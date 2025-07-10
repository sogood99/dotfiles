# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }: 

let 
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; }; 
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix 
    ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # Enable the X11 windowing system.
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };

    # i3
    autorun = true;
    desktopManager.xterm.enable = false; 
    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
	rofi
        i3status # gives you the default i3 status bar
        i3blocks
        i3lock #default i3 screen locker
	dunst
	pavucontrol
	polybarFull
	brightnessctl
	playerctl
	feh
	alacritty
	arc-theme
	lxappearance
	arandr 
	xdg-utils # for opening default programs when clicking links
	glib # gsettings
	dracula-theme # gtk theme
	adwaita-icon-theme  # default gnome cursors
	viewnior 
	nautilus
	wacomtablet
	udiskie
	redshift # night redshift
	pulseaudioFull
     ];
    };


    videoDrivers = [ "intel" ]; 
    deviceSection = ''
    Option "DRI" "2"
    Option "TearFree" "true" 
    '';
  };


  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
      disableWhileTyping = false;
      clickMethod = "clickfinger";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true; 
  services.printing.drivers = [ pkgs.brlaser ];
  services.avahi.enable = true; # runs the Avahi daemon
  services.avahi.nssmdns4 = true; # enables the mDNS NSS plug-in
  services.avahi.openFirewall = true; # opens the firewall for UDP port 5353

  # Enable sound with pipewire.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.picom.enable = true;
  services.picom.vSync = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
	  General = {
		  Enable = "Source,Sink,Media,Socket";
	  };
  };
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mani = {
    isNormalUser = true;
    description = "Mani";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      fastfetch
      nodejs_20
      vscodium
      discord
      spotify
      unstable.spotify-player
      ranger
      gcc
      clang_16
      clang-tools_16
      lld_16
      llvmPackages_16.libllvm
      haskell.compiler.ghc964
      rustup
      dotnet-sdk
      unstable.osu-lazer-bin
      texlive.combined.scheme-full
      jdk
      krita
      gimp
      gnomeExtensions.dash-to-dock
      gnomeExtensions.caffeine
      libreoffice-qt
      hunspell
      hunspellDicts.en_US-large
      yt-dlp
      gnumake
      cmake
      pkg-config
      SDL2
      ruby
      bundix
      bundler
      rubyPackages.jekyll
      (agda.withPackages (p: with p; [
	standard-library
      ]))
      emacs
      blender
      mesa
      udev
      ripgrep
      unzip
      lua-language-server
      # rnix-lsp
      haskell-language-server
      jdt-language-server
      marksman
      blueman
      zathura
      texlab
      efm-langserver
      black
      pyright
      maim
      slack
      nmap
      obs-studio
      python310
      xclip
      bluez
      valgrind
      vlc
      barrier
      nasm
      gdb
      jetbrains.idea-ultimate
      qemu_full
      wasm-pack
      xorg.libXxf86vm
      unstable.vscode
      kazam
      go
      gopls
      godot_4
      filezilla
      zig
      zls # zig language server
      inkscape
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim_configurable
    unstable.neovim
    tmux
    wget
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

# For CN and JP fonts
  fonts.packages = with pkgs; [
	corefonts
	ubuntu_font_family
	powerline
	powerline-fonts
	powerline-symbols
	font-awesome
	source-code-pro
	emojione
	kanji-stroke-order-font
	gyre-fonts
	ipafont
	noto-fonts
	noto-fonts-extra
	noto-fonts-cjk-sans
	noto-fonts-cjk-serif
	noto-fonts-emoji
	liberation_ttf
	fira-code
	fira-code-symbols
	mplus-outline-fonts.githubRelease
	dina-font
	proggyfonts
	nerd-fonts.monaspace
	terminus_font
  ];

  # For CN and JP input
  i18n.inputMethod = {
    # enabled = "ibus";
    # ibus.engines = with pkgs.ibus-engines; [ mozc libpinyin rime ];
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-chinese-addons
        fcitx5-gtk
    ];
  };

  # Sudo doesnt need password
  security.sudo.wheelNeedsPassword = false;

  # Map Caps Lock to Esc
  # services.xserver.xkbOptions = "caps:escape";
  console.useXkbConfig = true;

  programs.java.enable = true;

  # Enable OpenTabletDriver
  hardware.opentabletdriver.enable = true;

  services.xserver.wacom.enable = true;

  hardware.graphics = {
     enable = true;
     extraPackages = with pkgs; [
       libGL
       glade
     ];
   };

   services.udisks2.enable = true;

  programs.dconf.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
