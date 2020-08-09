########## Color shortcuts
local dark_gray=%F{237}
local gray=%F{242}
local light_gray=%F{250}
local red=%F{197}
local dark_red=%F{161}
local yellow=%F{221}
local green=%F{77}
local beige=%F{143}


########## user@host:dir

if [[ $UID -ne 0 ]]; then
    local username_color="%{$gray%}"
else
    local username_color="%{$red%}"
fi

local user_host="%{$username_color%}%n%{$dark_gray%}@%{$gray%}%M%{$dark_gray%}:%{$light_gray%}%~%u"


########## wsl/msys info

if [[ ! -z "${WSL_DISTRO_NAME}" ]]; then
    local distro_info="%{$dark_gray%}[%{$gray%}${WSL_DISTRO_NAME}%{$dark_gray%}]"
fi
if [[ ! -z "${MSYSTEM}" ]]; then
    local distro_info="%{$dark_gray%}[%{$gray%}${MSYSTEM}%{$dark_gray%}]"
fi


########## git.zsh colors

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="%{$gray%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$dark_red%}[*]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$red%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$red%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$yellow%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$yellow%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$green%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$beige%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$red%}[!]"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$dark_gray%}[%{$gray%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$dark_gray%}]"


########## Prompt format

PROMPT='
${user_host}$(parse_git_dirty)$(git_prompt_ahead) ${distro_info}%F{reset}
%{$dark_gray%}>%F{reset} '

RPROMPT='%{$light_gray%}$(git_current_branch)$(git_prompt_short_sha)$(git_prompt_status)%F{reset}'
