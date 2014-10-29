typeset -U path

# Add Homebrew
path=(/usr/local/bin $path)

# Add Racket
path=("/Applications/Racket v5.3.5/bin" $path)

# Add ruby gems
path=(/usr/local/opt/ruby/bin $path)

# Add TEX
path=(/usr/texbin $path)

# Add Haskell
path=(~/.cabal/bin $path)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR=vim
export GNUTERM=x11

# API Keys for various web services
export TWITTER_TOKEN=wSGbLHa4UDQAinb91IEF1Q
export TWITTER_SECRET=KcnBtGQwohkrkqbcHxYvzM093CeUyccD0eKWtX8M

export READABILITY_TOKEN=gidj
export READABILITY_SECRET=7AVUMDpagwHu9AF364xRPwxdCZDbZhGN
export READABILITY_PARSER_TOKEN=5dd46afba26b059c2bfef66782e4850052a6cc47

export FACEBOOK_TOKEN=810492778976374
export FACEBOOK_SECRET=18dd4800b25c506d85c068cfc42142d5

export LEGIBILITY_SECRET_KEY='6gk%zi!kk1zzwif$o6rf#zn&5kw0=5c^#@wh%x%#=dd=#xi9z^'

export PATH

