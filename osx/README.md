# OSX Scaffold

- [Application list](#application-list)
  - [Base](#base)
  - [Work](#work)
- [Step-by-step Installation](#step-by-step-installation)



## Application list

### Base

- iTerm2 https://www.iterm2.com/

  Terminal emulator.

- Homebrew https://brew.sh/

  - tap

    - cask

  - app

     - zsh
      - https://github.com/zsh-users/zsh-completions
     - wget
     - tree
     - [thefuck](https://github.com/nvbn/thefuck) Magnificent app which corrects your previous console command.
     - [ccat](https://github.com/jingweno/ccat) Colorizing `cat` >> alternative to `bat` 
     - [bat](https://github.com/sharkdp/bat) A cat(1) clone with wings.
     - [cloc](https://github.com/AlDanial/cloc) cloc counts blank lines, comment lines, and physical lines of source code in many programming languages.
     - [htop](https://hisham.hm/htop/index.php) This is htop, an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.
     - [nmap](https://nmap.org/) Nmap ("Network Mapper") is a free and open source utility for network discovery and security auditing.
     - [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder
     - [fd](https://github.com/sharkdp/fd) A simple, fast and user-friendly alternative to 'find'
     - [ripgrep](https://github.com/BurntSushi/ripgrep) ripgrep recursively searches directories for a regex pattern
     - [gitbatch](https://github.com/isacikgoz/gitbatch)
     - [lsd](https://github.com/Peltoche/lsd) The next gen ls command
     - [scc](https://github.com/boyter/scc) Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go
     
- font
  - [nerd font](https://github.com/ryanoasis/nerd-fonts)

- color
  - [Gogh](https://github.com/Mayccoll/Gogh)

- oh-my-zsh https://github.com/robbyrussell/oh-my-zsh

   Oh My Zsh is an open source, community-driven framework for managing your [zsh](http://www.zsh.org/) configuration.

- Typora https://typora.io/

  The markdown editor.

- Yoink https://eternalstorms.at/yoink/

  Simplify and Improve Drag and Drop.

- iStat Menus https://bjango.com/mac/istatmenus/

  An advanced system monitor for menubar.

- Magnet http://magnet.crowdcafe.com/

  Window manager.

- Keka http://www.kekaosx.com/en/

   Free file archiver.

- Timing https://timingapp.com/

### Work

- Dash https://kapeli.com/dash

  Dash is an API Documentation Browser and Code Snippet Manager.

- GitKraken https://www.gitkraken.com/

- Beyond Compare https://www.scootersoftware.com/

- Visual Studio Code https://code.visualstudio.com/

- PhpStorm https://www.jetbrains.com/phpstorm/

- Docker https://www.docker.com/



## Step-by-step Installation

1. Install [Homebrew](https://brew.sh/)

   ```bash
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

   1. Install Apps

      ```bash
      brew install wget tree thefuck ccat zsh
      ```

   2. Setup zsh - Change the default shell to zsh
   
      ```bash
      sudo sh -c "echo $(which zsh) >> /etc/shells"
      chsh -s $(which zsh)
      ```
      
   3. Add tap

      ```bash
      brew tap homebrew/cask-fonts
      ```
      
   4. Install font: font-firacode-nerd-font

      ```bash
      brew cask install font-fira-code
      brew cask install font-jerbrains-mono-nerd-font
      ```

2. Install [iTerm2](https://www.iterm2.com/), install by Homebrew-Cask or download fomr website.

  ```bash
  brew cask install iterm2
  ```

3. Change the iterm2 color

   - Download the schema from https://github.com/mbadolato/iTerm2-Color-Schemes
   
   ```bash
   https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Tomorrow%20Night%20Eighties.itermcolors -O tomorrow-night-eighties.itermcolors
   ```

4. Change the font to `14pt firacode-nerd-font` in `Preferences > Profiles > Text > Change Font`.

5. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

   1. [Download and install oh-my-zsh by script](https://github.com/robbyrussell/oh-my-zsh#via-curl)

      ```bash
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      ```

   2. Setup the theme to [Powerlevel9k](https://github.com/bhilburn/powerlevel9k):
      1. [Install Powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh) for Oh-My-Zsh:

         clone the powerlevel9k to `~/.oh-my-zsh/custom/themes/powerlevel9k`

         ```bash
         git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
         ```


      2. Setting the theme and setup the config of `powerlevel9k`
         - ***Option 1***: 
             1. Download the config
             ```bash
             mkdir .myconfig
             ```

             ```bash
             wget https://raw.githubusercontent.com/seanmars/dotfiles/master/osx/.myconfig/oh-my-zsh-theme -O .myconfig/oh-my-zsh-theme
             ```

             2. Edit the `.zshrc`, add the below script under `ZSH_THEME="robbyrussell"`

             ```bash
             source .myconfig/oh-my-zsh-theme
             ```


         - ***Option 2***: Edit the `.zshrc` directly

         ```bash
         ZSH_THEME="powerlevel9k/powerlevel9k"

         # =============================================================================
         # POWERLEVEL9K
         # =============================================================================
         POWERLEVEL9K_MODE='nerdfont-complete'

         POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
         POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="\uE0B4"
         POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
         POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="\uE0B6"

         POWERLEVEL9K_PROMPT_ON_NEWLINE=true
         POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

         POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{169}???%F"
         POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{169}\u2570%F{208}\uF460%F{220}\uF460%F{231}\uF460%f "

         POWERLEVEL9K_STATUS_VERBOSE=false
         POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

         POWERLEVEL9K_HOST_TEMPLATE=""
         POWERLEVEL9K_HOST_ICON="%F{228}\uF120%F"

         POWERLEVEL9K_TIME_BACKGROUND="255"
         POWERLEVEL9K_TIME_FORMAT="\uF017 %D{%T}"

         POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
         POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

         POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host time dir dir_writable vcs virtualenv status)
         POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time ip)
         ```

6. Add alias


```bash
wget https://raw.githubusercontent.com/seanmars/dotfiles/master/osx/.myconfig/alias -O .myconfig/alias
```

```bash
echo "source .myconfig/alias" >> ~/.zshrc
```
