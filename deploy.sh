prompt_install() {
  echo -n "$1 is not installed. Would you like to install it? (y/n) " >&2
  old_stty_cfg=$(stty -g)
  stty raw -echo
  answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done  )
  stty $old_stty_cfg && echo
  if echo "$answer" | grep -iq "^y" ;then
    # This could def use community support
    if [ -x "$(command -v apt-get)"  ]; then
      sudo apt-get install $1 -y
    elif [ -x "$(command -v brew)"  ]; then
      brew install $1
    elif [ -x "$(command -v pkg)"  ]; then
      sudo pkg install $1
    elif [ -x "$(command -v pacman)"  ]; then
      sudo pacman -S $1
    else
      echo "I'm not sure what your package manager is! Please install $1 on your own and run this deploy script again. Tests for package managers are in the deploy script you just ran starting at line 13. Feel free to make a pull request at https://github.com/parth/dotfiles :)"
    fi
  fi
}

check_for_software() {
  echo "Checking to see if $1 is installed"
  if ! [ -x "$(command -v $1)"  ]; then
    prompt_install $1
  else
    echo "$1 is installed."
  fi
}

check_default_shell() {
  if [ -z "${SHELL##*zsh*}"  ] ;then
    echo "Default shell is zsh."
  else
    echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done  )
    stty $old_stty_cfg && echo
    if echo "$answer" | grep -iq "^y" ;then
      chsh -s $(which zsh)
    else
      echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
    fi
  fi
}

echo "We're going to do the following:"
echo "1. Grab dependencies"
echo "2. Check to make sure you have zsh, vim, nvim, and tmux installed"
echo "3. We'll help you install them if you don't"
echo "4. We're going to check to see if your default shell is zsh"
echo "5. We'll try to change it if it's not"

echo "Let's get started? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done  )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
  echo
else
  echo "Quitting, nothing was changed."
  exit 0
fi

git submodule update --init --recursive
check_for_software zsh
echo
check_for_software vim
echo
check_for_software nvim
echo
check_for_software tmux
echo
check_default_shell
echo
echo -n "Would you like to backup your current dotfiles? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done  )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
  mv ~/.zshrc ~/.zshrc.old
  mv ~/.tmux.conf ~/.tmux.conf.old
  mv ~/.vimrc ~/.vimrc.old
else
  echo -e "\nNot backing up old dotfiles."
fi

printf "source ~/.dotfiles/zsh/zshrc_manager.sh" > ~/.zshrc
printf "so ~/.dotfiles/vim/vimrc.vim" > ~/.vimrc
mkdir ~/.config/
mkdir ~/.config/nvim-vim/
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim-vim/init.vim
mkdir ~/.config/nvim/
printf "vim.opt.runtimepath:append(vim.fn.expand('~/.dotfiles/nvim'))\nvim.opt.packpath = vim.opt.runtimepath:get()\nvim.cmd('source ' .. vim.fn.expand('~/.dotfiles/nvim/init.lua'))\n" >> ~/.config/nvim/init.lua
printf "source-file ~/.dotfiles/tmux/tmux.conf" > ~/.tmux.conf

echo
echo "Please log out and log back in for default shell to be initialized."
