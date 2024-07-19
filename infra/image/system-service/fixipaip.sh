#!/bin/bash -eu

HOSTNAME=$(hostname)
IP=$(hostname -I | cut -d " " -f 1)

echo "SomeADMINpassword" | kinit -c ansible_freeipa_cache admin
KRB5CCNAME=ansible_freeipa_cache \
    ipa dnsrecord-mod test.local "${HOSTNAME%%.*}" --a-rec="$IP"
KRB5CCNAME=ansible_freeipa_cache \
    ipa dnsrecord-mod test.local ipa-ca --a-rec="$IP"
kdestroy -c ansible_freeipa_cache -A

exit 0
