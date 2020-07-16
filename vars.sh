# size of directory
alias sod="du -h --max-depth=1"

# cd
alias ....="cd ../../.."
alias .....="cd ../../../.."

# tmux
alias tl="tmux ls"
alias ts="tmux new-session -s "
alias ta="tmux attach -t"

# TERM
export TERM='xterm-256color'
alias vt220="export TERM='vt220'"

# intel
rm -rf ~/intel/

# Search by filename
alias sf="find . | grep "

# Search by file content
alias sc="grep -R "
