# ykoath

`ykoath` is a convenient way to use oath codes stored on your Yubikey.

Ykoath uses [rofi](https://github.com/davatorium/rofi) to select the code you want to use. Upon selection, the corresponding oath code is requested from the Yubikey and typed onto the screen. (not copied to the clipboard)

## To run

The simplest way to run is with [nix](https://nixos.org/download.html). If you have `nix` installed, run this package using `nix run github:cstoltze/ykoath`

## Installation

### with nix

`nix-env -iA github:cstoltze/ykoath`

To uninstall

`nix-env --uninstall github:cstoltze/ykoath`

### NixOS (with flakes enabled)

add this url to your flake inputs. In your `flake.nix` file, add the following code within the `inputs` stanza.

```nix
ykoath.url = "github:cstoltze/ykoath";
```

TODO: ... and add the following code to environment.systemPackages...

### Other linux

1. Ensure that all dependencies are installed
    1. rofi
    1. xdotool
    1. yubikey-manager (which provides `ykman`)
1. Copy the `ykoath` script into your PATH

## Tips

1. Make sure your Yubikey is plugged in before running `ykoath`
2. Ensure that the correct textbox has focus before running. So that the code is typed into the correct place.
3. Use a keyboard shortcut to launch `ykoath`
    1. My keyboard shortcut is `Super-O`. In my i3 config, this reads as `bindsym Mod4+o exec ykoath` 

## Rough edges

This is a utility meant mostly for my own use. There are some rough edges:

- It doesn't nicely handle errors
    - make sure the Yubikey is plugged in before running the script
- If your oath code requires touch, there's no visible indication on the screen that you need to touch the Yubikey.
    - my Yubikey flashes when it needs to be touched
    - you could install something like [yubikey-touch-detector](https://github.com/maximbaz/yubikey-touch-detector) for general purpose touch detection.
- It is most useful when launched with a system-wide keyboard shortcut
    - maybe there should be an option to copy to the clipboard instead of typing directly onto the screen
- It only works on some linux distros. I think the biggest limiter is the `xdotool` dependency.
