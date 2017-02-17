# pyenv

## Installation
### OS X
#### Using Homebrew:
1. Update Homebrew & Install it:
```bash
$ brew update
$ brew install pyenv
```
	**!!!** If you get an error such as having no writable permission to `/usr/local`, try:
	```
	sudo chgrp -R admin /usr/local
	sudo chmod -R g+w /usr/local
	```

2. Add `eval "$(pyenv init -)"` to your profile, `.bash_profile`

3. Restart your shell so the path changes take effect.
```bash
$ exec $SHELL
```

4. Install Python versions into `$PYENV_ROOT/versions`. For example:
```bash
$ pyenv install 3.6.0
```

**!!!** If zlib needs to be installed, try:
```bash
$ xcode-select --install
```
This installs Xcode library

## Usage
### Local
Current directory + sub directories get affected
```bash
$ pyenv local 3.6.0
```

To revert back,
```bash
$ pyenv local --unset 
```

### Global
```bash
$ pyenv global 3.6.0
```


## Upgrade
### OS X
#### Using Homebrew: 
```bash
$ brew upgrade pyenv
`