Install.
--------

    # backup what you've got
    mv .vim .vim-backup
	mv .vimrc .gvimrc .vim-backup

    # grab from GitHub
	git clone git://github.com/snikch/dotfiles.git .dotfiles

    # symlink the rc files into your home directory
	ln -s .dotfiles/vim/vimrc .vimrc
	ln -s .dotfiles/vim/gvimrc .gvimrc

Background.
-----------

This is largely based on [pda’s](http://github.com/pda) .vim.

Some posts that helped him along the way:

  - [Steve Losh - Coming Home to Vim][1]
  - [Stephen Bach - Configuring Vim Right][2]
  - [Google Tech Talk video by creator of Vim][3]
  - [Vim Recipes - A free online book on using Vim][4]
  - [Jonathan McPherson - Efficient Editing with Vim][5]

  [1]: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
  [2]: http://items.sjbach.com/319/configuring-vim-right
  [3]: http://video.google.com/videoplay?docid=2538831956647446078
  [4]: http://vim.runpaint.org/
  [5]: http://jmcpherson.org/editing.html
