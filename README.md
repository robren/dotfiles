# My dotfiles.

This contains some of my more useful dotfiles in a folder structure which lends itself to be easily used by a utility called Gnu stow.  The stow utility can be used to create symlinks from both the home directory and other subdirectories e.g ~/.config to configuration files contained here. My previous technique was a custom shell script to create the nexessary sym links.

## How to populate the dotfiles on a new machine.

This assumes that  stow has been installed

- Git clone this repo from the home directory.
- stow -vt ~ */
    - This will create the necessary symlinks from ~ and .config to all of our dotfiles.
    - The / at the end means it will only create symlinks to the things in directories, so we could have install scripts READMes etc here and they will not pollute our home directory.
   -  by default stow will create the target files in the directory above where it is executed. However it's very easy to execute this at a lower level and things do not happen as expected Hence good practive to include the -t for target directory. 

## The magic of stow

Stow treats each of the  top level  directories it sees as "Package" and will treat that as one unit. Within this package maybe just a single file e.g bash/.bashrc or it could be a directory tree e.g nvim/.admin/nvim.  Stow will create links from the Target directory, by default one above where it is being invoked to the so called "Installation Image". 


## Subleties of stow
When we need to have symlinks placed within a subdirectory of ~ e.g. ~/.config we acheive this by making sure that the "package" is laid out exactly as how we want things to look in the .config directory.  All works well **as long as** the target subdirectory already exists. Read the manpage section of stow under "INSTALLING PACKAGES" if interested.

By default there is usually a .config created in most linux distros so as long as one sticks to the format in place in this repo then stow will "just work".

## TODO

I do plan on addin a script which will install a number of packages on a new machine. 


