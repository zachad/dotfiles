# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

setopt promptsubst

# Change this to your own username
DEFAULT_USERNAME='zachad'

# Threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn # You can add hg too if needed: `git hg`
zstyle ':vcs_info:*' formats ' %b'
zstyle ':vcs_info:*' actionformats '%b|%a'
zstyle ':vcs_info:*' branchformat '%b'

# username
local user_at_host='%F{green}%n%f@%F{magenta}%m%f'

# Fastest possible way to check if repo is dirty
git_dirty() {
	git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo '*'
}

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
	local stop=`date +%s`
	local start=${cmd_timestamp:-$stop}
	let local elapsed=$stop-$start
	[ $elapsed -gt $CMD_MAX_EXEC_TIME ] && echo ${elapsed}s
}


preexec() {
	cmd_timestamp=`date +%s`
}

precmd() {
	vcs_info
	# Add `%*` to display the time
  print -P "\n$user_at_host:%F{blue}%~%F{245}$vcs_info_msg_0_`git_dirty` %F{245}%f %F{yellow}`cmd_exec_time`%f"
	# Reset value since `preexec` isn't always triggered
	unset cmd_timestamp
}

# Prompt turns red if the previous command didn't exit with 0
PROMPT='%(?.%F{green}.%F{red})❯%f '
#RPS1='%F{black}$ruby_version%f'
