# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Icons
set __fish_git_prompt_char_cleanstate '👍'
set __fish_git_prompt_char_conflictedstate '⚠️'
set __fish_git_prompt_char_dirtystate '💩'
set __fish_git_prompt_char_invalidstate '🤮'
set __fish_git_prompt_char_stagedstate '🚥'
set __fish_git_prompt_char_stashstate '📦'
set __fish_git_prompt_char_stateseparator '|'
set __fish_git_prompt_char_untrackedfiles '🔍'
set __fish_git_prompt_char_upstream_ahead '☝️'
set __fish_git_prompt_char_upstream_behind '👇'
set __fish_git_prompt_char_upstream_diverged '🚧'
set __fish_git_prompt_char_upstream_equal '💯'

# User colors
set fish_color_user ffd787
set fish_color_host 0087d7

# Select color
set fish_color_search_match --background=ffffff black

function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	set -l delim '$'

	switch $USER

	case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

	case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

	end

	set -l prompt_status
	if test $last_status -ne 0
		if not set -q __fish_prompt_status
			set -g __fish_prompt_status (set_color $fish_color_status)
		end
		set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
	end

	if not set -q __fish_prompt_user
		set -g __fish_prompt_user (set_color $fish_color_user)
	end
	if not set -q __fish_prompt_host
		set -g __fish_prompt_host (set_color $fish_color_host)
	end

	echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (pwd)
  echo -n -s (set_color brown) (__fish_git_prompt) (set_color normal)

  if set -q DOCKER_MACHINE_NAME
      echo -n -s (set_color blue) " [$DOCKER_MACHINE_NAME]" (set_color normal)
  end

  if set -q VIRTUAL_ENV
    echo -n -s (set_color red) " [" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end

  echo -n -s "$__fish_prompt_normal" "$prompt_status"
  echo "$delim" ''
end
