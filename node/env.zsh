export NODE_VERSION=18.20.1
export NODE_COMPILE_CACHE=.cache/nodejs-compile-cache
export NODE_OPTIONS=--max_old_space_size=15360
export TSC_WATCHFILE=UseDynamicPriorityPolling

export NVM_DIR="$HOME/.nvm"

load-nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() {
  unset -f nvm
  load-nvm
  nvm "$@"
}
