# arch-stuff
In this repo I gather various useful scripts and configurations that I use in my arch installation, for backup purposes. This repo is meant for my personal use.

- [arch-stuff](#arch-stuff)
  - [Gnome Shell](#gnome-shell)
    - [Useful Extensions](#useful-extensions)
    - [Tweaks](#tweaks)
  - [Applications](#applications)
  - [Misc. Packages](#misc-packages)
  - [Theme](#theme)
  - [Fonts](#fonts)
  - [Fun](#fun)

## Gnome Shell

### Useful Extensions
* Dash to dock
* Disable Workspace Switch Animation
* Disable Workspace Switcher Popup
* KStatusNotifierItem/AppIndicator Support
  1. **for better icon size:**
  2. navigate to `~/.local/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com`
  3. edit `appIndicator.js`
  4. find `this._iconSize = icon_size`
  5. replace with `this._iconSize = icon_size * 0.85` for slightly smaller icons with an actual margin
* Launch new instance
* No Topleft Hot Corner
* NoAnnoyance
* Removable Drive Menu
* Screenshot Tool
* TopIcons Plus
* Workspace Indicator  
* Media Player Indicator 
  * [My fork without icon](https://github.com/realChesta/gnome-shell-extensions-mediaplayer)

### Tweaks

* **Make nemo default file manager:**

   ```shell
   $ xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

   $ gsettings set org.gnome.desktop.background show-desktop-icons false

   $ gsettings set org.nemo.desktop show-desktop-icons true
   ```
   (source: https://itsfoss.com/install-nemo-file-manager-ubuntu/)


## Applications

* [**Lockscreen**](https://github.com/pavanjadhaw/betterlockscreen) [AUR: `betterlockscreen-git`]
  * fix for time: in i3lock line:
    ```shell
    --timepos='x+43:h-70' \
	--datepos='x+43:h-45' \
	--clock --date-align 1 --time-align 1 --datestr "$locktext" \
    ```
  * config in this repo

* [**Greeter**](https://github.com/FallingSnow/lightdm-webkit2-material2) [AUR: `lightdm-webkit2-theme-material2`]

* [**Albert launcher**](https://github.com/albertlauncher/albert) [AUR: `albert-lite`]

* [**Tilix**](https://gnunn1.github.io/tilix-web/) [pacman: `tilix`]

* **Nemo** File Manager [pacman: `nemo`]

* **Caffeine** [AUR: `caffeine`] (to prevent sleep while fullscreen)

* **`zsh`** with [oh-my-zsh](https://ohmyz.sh/), `agnoster` theme
  * Prompt length patch: 
    ```shell
    prompt_dir() {
      prompt_segment blue $CURRENT_FG "%$(( $COLUMNS - 61 ))    <...<%3~%<<"
    }
    ```
    _(replace `prompt_dir()` in `~/.oh-my-zsh/themes/agnoster.zsh-theme`)_

## Misc. Packages

```
dropbox, tty-clock, peaclock, neofetch, gnome-termina-transparency
```

## Theme

* [**Arc Theme**](https://github.com/NicoHood/arc-theme) [AUR: `arc-gtk-theme-git`]
* [**Paper icons**](https://snwh.org/paper) [AUR: `paper-icon-theme-git`]
  
  **Gnome 3.32 fix:** Edit `source` line in `PKGBUILD` to `https://github.com/archlinux-jerry/paper-icon-theme`

* [**Bibata cursors**](https://github.com/KaizIqbal/Bibata_Cursor) [AUR: `bibata-cursor-theme`]

* [**One Dark** for Gedit](https://github.com/Peter-van-der-Velde/Two-Dark)

## Fonts

* [Consolas (Powerline patched)](https://github.com/Znuff/consolas-powerline)
* Roboto [AUR: `ttf-roboto`]
* Emoji [AUR: `ttf-emojione`]

## Fun
* AUR: `ctris`, `yetris`
* [pipes.sh](https://github.com/pipeseroni/pipes.sh) [AUR: `bash-pipes`]
* [asciiquarium](https://robobunny.com/projects/asciiquarium/html/)
* AUR: `nyancat`
* [cli pokedex](https://github.com/realChesta/pokedex-cli/tree/transparency)

* [Pokemon Terminal](https://github.com/realChesta/Pokemon-Terminal/tree/print-path)