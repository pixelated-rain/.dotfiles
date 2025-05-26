# documentation

this document largely serves as a means of helping charlie remember important
details of the structure of this flake. however, it may serve as meaningful to
anyone wishing to draw inspiration from this flake, so it is being included
here.

## overview

this section provides a big-picture overview of the important files in this
flake and their purposes.

### hosts

`hosts/${hostname}/variables.nix` serves as the place to define most of the
important options. this includes, but is not limited to:

1. the user's git username and email,
2. hyprland monitor settings,
3. the default wallpaper,
4. font sizes,
5. the default editor and browser,

and more. `hosts/${hostname}/hardware.nix` is a direct copy of the file
`/etc/nixos/hardware-configuration.nix` generated when the user runs the
following command:

```sh
nixos-generate-config
```

currently, `hosts/${hostname}/default.nix` just imports `variables.nix`. if
`variables.nix` ever gets too bloated, it will be split up, so this structure
will be kept for the time being.

### modules

the folder for managing `nixpkgs` and `home-manager` dependencies. graphics
drivers are also in here. currently, both `modules/core` and `modules/home` have
a `default.nix` file which just imports all of the packages of interest.

a major current goal is to introduce new per-host variables to group whether or
not some packages should be installed on a given device. for example, it seems
unlikely that steam should be installed on a device with no dedicated graphics.
similarly, there should be a variable for whether TeXLive should be installed on
a given device, since it is huge and significantly slows down build times.
