# Prepare

[oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)

## Installation

```sh
pacman -S procps-ng
```

## Theme

```sh
omf install bobthefish
omf reload
```

## Modify

Add the below script in `~/.config/fish/function/fish_prompt.fish` and call the `__bobthefish_timestamp` in `fish_prompt` function.

```fish
# Time
function __bobthefish_timestamp -S -d 'Show the current timestamp'
  [ "$theme_display_date" = "no" ]; and return
  set -q theme_date_format
    or set -l theme_date_format "+%c"

  printf (date $theme_date_format)
end

# ==============================
# Apply theme
# ==============================

function fish_prompt -d 'bobthefish, a fish theme optimized for awesome'
...
...
__bobthefish_timestamp
...
...
end
```
