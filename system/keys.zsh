# Pipe my public key to my clipboard.
pubkey () {
  clip < ~/.ssh/id_joshua.pub && echo '=> Public key copied to pasteboard.'
}
