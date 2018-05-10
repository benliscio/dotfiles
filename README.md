dotfiles
===================

Install
-------

Clone:

    git clone git://github.com/benliscio/dotfiles.git ~/dotfiles

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

Update
------

    rcup
