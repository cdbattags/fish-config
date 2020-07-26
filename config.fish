# Set FISH_CONFIG if not set.
if not set -q FISH_CONFIG
  set -q XDG_CONFIG_HOME; or set -l XDG_CONFIG_HOME "$HOME/.config"
  set -gx FISH_CONFIG "$XDG_CONFIG_HOME/fish"
end

# Prepare Oh My Fish paths
set -l core_function_path $FISH_CONFIG/lib/{,git,functions}

# virtualenv support in fish
set -g VIRTUALFISH_COMPAT_ALIASES
. "$FISH_CONFIG/plugins/virtualfish/virtualfish/virtual.fish"
. "$FISH_CONFIG/plugins/virtualfish/virtualfish/auto_activation.fish"
. "$FISH_CONFIG/plugins/virtualfish/virtualfish/global_requirements.fish"

# nvm-wrapper
. "$FISH_CONFIG/plugins/nvm-wrapper/nvm.fish"

# fenv
set fish_function_path $fish_function_path $FISH_CONFIG/{lib/git,plugins/plugin-foreign-env/functions}

# Shell Integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
