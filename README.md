## Settings for development environments
### Setup scripts
* `. set_profile.sh [USERNAME]`
  * to set profile when multiple users share a user account in linux
  * including `scripts/func_profile`
  * the *USERNAME* will be written in `$HOME/.user`
  * the file will be used for your tmux socket name
* `mkln.sh`
  * to create symlink some files in your new *HOME* directory
  * linking configuration files and util scripts
* `all.sh`
  * to install some packages using local install scripts
  * including `mkln.sh`
* `git sb init && git sb update`
  * for vim!

### Configuration files
* `.bash_profile`: sample bash profile
* `.profile`: basic bash profile
* `.vimrc`
  * `.vim`
* `.pythonrc` : python startup script
* `tmux.conf`
* `.screenrc`
* git-completion
  * https://github.com/git/git/tree/master/contrib/completion
  * without submodule

### Utilities
* `bin/{a|o}tx`
  * shortcut tmux command with some options
  * a: with your tmux socket
  * o: without the specific tmux socket
* `bin/gzwc`
  * gzcat with `wc -l`
* `bin/{n|g|x|o}find`
  * shortcut to search text
  * n: search file names
  * g: search contents
  * x: search contents for specific extension
  * o: search contents for linux kernel sources compiled

### Local install scripts on linux environments
  * `scripts/`

---
_from at 19-Apr-16_
