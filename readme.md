# Reed's VIM

## if using MacVim

Download font from: http://sourceforge.net/projects/sourcecodepro.adobe/files/

## clone and install::
$ git clone https://reedes@bitbucket.org/reedes/vim-config.git ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
$ vim +BundleInstall +qall

## setting up bitbucket
$ git remote remove origin
$ git remote add bitbucket https://reedes@bitbucket.org/reedes/vim-config.git
$ git push -u bitbucket --all    (is that right?)

## and drop box
$ git remote remove origin
$ git remote add origin ~/Dropbox/git-repo/vim-config.git
$ git push -u origin --all
