#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# for OPAM
test -r /home/i/.opam/opam-init/init.sh && . /home/i/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
