# Lazy-load pyenv — only initializes when python/pip/pyenv is first called
_lazy_pyenv() {
  unfunction pyenv python python3 pip pip3
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
}
pyenv() { _lazy_pyenv; pyenv "$@" }
python() { _lazy_pyenv; python "$@" }
python3() { _lazy_pyenv; python3 "$@" }
pip() { _lazy_pyenv; pip "$@" }
pip3() { _lazy_pyenv; pip3 "$@" }
