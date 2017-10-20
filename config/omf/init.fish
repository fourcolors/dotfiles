set fish_greeting ""

# PATHS
set -x BUNDLER_EDITOR "vim" $BUNDLER_EDITOR
set -x EDITOR "vim" $EDITOR

################### Aliases ###################
alias dockspace "defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock"
function ta; tmux -2 attach -t $argv; end
alias gco "git checkout"
alias pull "pull --rebase"
function staging; heroku run console --remote staging; end
function production; heroku run console --remote production; end
function fs; foreman start; end
function bx
 bundle exec $argv
end
function rake; noglob rake; end
function gpush; git push origin HEAD:refs/for/master; end
function pserver; python -m SimpleHTTPServer; end

function tn
  tmux new -s $argv
end

alias tmux "tmux -2"

function gpull
  git pull --rebase
end

function candockerbuild
  docker-compose run --rm web bundle update
  and docker-compose run --rm web npm install
  and docker-compose run --rm web bundle exec rake db:migrate
  and docker-compose run --rm web bundle exec rake canvas:compile_assets[0,0,1,0]
end

function gpush; git push origin HEAD:refs/for/master; end
function pserver; python -m SimpleHTTPServer; end
alias gs "git status"
alias gl "git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"
function gcm; git commit -m $argv; end
function gc; git commit; end
function gca; git commit --amend; end
alias g "git"
function tu; ruby -Itest; end
function lh; ls -lah; end

# Canvas Alias
function js_test
  set -lx JS_SPEC_MATCHER "**/*"$argv[1]"*.js"
  bundle exec rake js:test
end

function js_dev
  set -lx JS_SPEC_MATCHER "**/*"$argv[1]"*.js"
  bundle exec rake js:dev
end

# Make node not break when doing tests
ulimit -n 8192

# Show git branch
set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '\u26F5 [%s%s%s][%s] ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '\u26F5 [%s%s%s] '(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

# Make auto complete work with aliases
function make_completion --argument alias command
    complete -c $alias -xa "(
        set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
        complete -C\"$command \$cmd\";
    )"
end

make_completion gco 'git checkout'

# Gerrit Checkouts
function gerrit_checkout
 set -l REF (ssh gerrit.instructure.com gerrit query --format=json --current-patch-set change:$argv[1] | head -n 1 | json currentPatchSet.ref)
 and git fetch gerrit $REF
 and git checkout FETCH_HEAD
end

set fish_function_path $fish_function_path /usr/local/lib/python2.7/site-packages/powerline/bindings/fish
powerline-setup
