vimConfig
=========

vim configuration

---------------------------------------------------------------------

cd ~
git clone http://github.com/mjpatrick/vimConfig.git ~/.vim 
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init

---------------------------------------------------------------------

Update submodule:
  git submodule foreach git pull origin master

Add submodule:
  git submodule add http://github.com/tomtom/tcomment_vim bundle/tcomment_vim

Push to remote/gitHub:
  git push -u origin master

Stage locally deleted files:
  git add -u

To pull another submodule from remote:
  git submodule update --init
