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

or

git clone --recursive http://github.com/mjpatrick/vimConfig.git ~/.vim

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

To list all tags
  git tag -l

To 'switch' to a specific tag:
  git checkout tags/<tag_name>

To diff a file on different tag
  git diff tag1 tag2 -- some/file/name

To find when a line is added
  git blame -L8,+3 src/main/java/com/zsoltfabok/blog/Munger.java
  git show e26fd52f

  The blame command accepts a commit which specifies the starting point of the search
    git blame -L8,+3 "e26fd52f^" -- src/main/java/com/zsoltfabok/blog/Munger.java
    git show 30b4cae4

  git gui command
    git gui blame src/main/java/com/zsoltfabok/blog/Munger.java

Given a git patch id, find out which release contains it
  git describe --contains f3a1ef9cee4812e2d08c855eb373f0d83433e34c
