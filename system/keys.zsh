# Pipe my public key to my clipboard.
# Uses the cross-platform clipboard_copy function from _os.zsh
alias pubkey="cat ~/.ssh/id_rsa.pub | clipboard_copy && echo '=> Public key copied to pasteboard.'"
