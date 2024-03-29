function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings
set fish_cursor_default block
set fish_cursor_insert block
set -g theme_date_timezone America/New_York
set -g theme_date_format "+ %H:%M"

set -g __fish_git_prompt_color_dirtystate brblue

bind \cd delete-char
bind \cd -M insert delete-char
bind \cd -M visual delete-char

set -g EDITOR /usr/bin/vim
set -g PAGER less

alias t todo.sh
alias tl "todo.sh ls"
alias repo "cd ~/projects/GA/"
alias ls "ls --color --group-directories-first"

# opam configuration
source /home/yashkir/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
