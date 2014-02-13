vimConfig
=========

vim configuration


cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update

Update submodule:
  git submodule foreach git pull origin master

Add submodule:
  git submodule add http://github.com/tomtom/tcomment_vim bundle/tcomment_vim

Push to remote/gitHub:
  git push -u origin master

Stage locally deleted files:
  git add -u
