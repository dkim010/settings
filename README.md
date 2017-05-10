## Settings for development environments
### Configuration files
* `.bash_profile`
  * sample bash profile
* `.profile`
  * base bash profile
* `.vimrc`
  * vimrc
* `.pythonrc`
  * python startup script
* `tmux.conf`
  * tmux configuration
* `.screenrc`
  * screen configuration
* `.git-completion.bash`
* `.git-promt.sh`
* `iTerm2/`
  * iTerm2 configuration file for mac

### Setup scripts
* `set_profile.sh`
  * to set profile when multiple users share a user account in linux
  * including `scripts/func_profile`
* `mkln.sh`
  * to create symlink some files in your *HOME* directory
  * configuration files and util scripts
* `all.sh`
  * to install some packages using local install scripts
  * including `mkln.sh`

### Utilities
* `bin/atx`
  * shortcut tmux command with some options
* `bin/gfind`
  * to search text via find/grep
* `bin/nfind`
  * to search text in file names
* `bin/xfind`
  * to search text for specific extension
* `bin/ofind`
  * to search text for linux kernel sources
* `ctrl_slaves/`
  * to command slaves in master-slave networks via ssh/rcp

### Local install scripts on linux environments
  * `scripts/git_local_install.sh`
  * `scripts/tmux_local_install.sh`
  * `scripts/htop_local_install.sh`
  * `scripts/leveldb_local_install.sh`
  * `scripts/pyenv_local_install.sh`
    * ~~`pip_local_install.sh`~~
    * ~~`python2.7_local_install.sh`~~
  * `scripts/sbt_local_install.sh`
  * `scripts/golang_local_install.sh`
  * `scripts/node_npm_local_install.sh`
  * `scripts/memcached_local_install.sh`
  * `scripts/redis_local_install.sh`

---
_Created at 19-Apr-16 by Dongwon Kim (dkim010@gmail.com)_
