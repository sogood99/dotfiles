# default.nix
with import <nixpkgs> {};
stdenv.mkDerivation {
    name = "OSU-Dev"; 
    nativeBuildInputs = [ pkg-config ]; 
    buildInputs = [ 
        systemd
        ffmpeg
        alsa-lib
        SDL2
        lttng-ust
        numactl

# needed to avoid:
# Failed to create SDL window. SDL Error: Could not initialize OpenGL / GLES library
        libglvnd

# needed for the window to actually appear
        xorg.libXi

# needed to avoid in runtime.log:
# [verbose]: SDL error log [debug]: Failed loading udev_device_get_action: /nix/store/*-osu-lazer-*/lib/osu-lazer/runtimes/linux-x64/native/libSDL2.so: undefined symbol: _udev_device_get_action
# [verbose]: SDL error log [debug]: Failed loading libudev.so.1: libudev.so.1: cannot open shared object file: No such file or directory
        udev
    ];

  runtimeDeps = [
    ffmpeg
    alsa-lib
    SDL2
    lttng-ust
    numactl

    # needed to avoid:
    # Failed to create SDL window. SDL Error: Could not initialize OpenGL / GLES library
    libglvnd

    # needed for the window to actually appear
    xorg.libXi

    # needed to avoid in runtime.log:
    # [verbose]: SDL error log [debug]: Failed loading udev_device_get_action: /nix/store/*-osu-lazer-*/lib/osu-lazer/runtimes/linux-x64/native/libSDL2.so: undefined symbol: _udev_device_get_action
    # [verbose]: SDL error log [debug]: Failed loading libudev.so.1: libudev.so.1: cannot open shared object file: No such file or directory
    udev
  ];
}

