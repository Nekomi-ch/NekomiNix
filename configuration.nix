# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:{

  #NVIDIA 

  boot.kernelParams = [
    "nvidia.NVreg_EnableGpuFirmware=0"
  ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime ={

  offload = {
  	enable = true;
	enableOffloadCmd = true;
  };


    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  hardware.graphics = {
  	enable = true;
	extraPackages = with pkgs; [
	];
  };
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NekomiOS"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";
  #time.timeZone = "Asia/Hong_Kong";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_HK.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Display Manager
  services.xserver.displayManager.gdm = {
  	enable = true;
	wayland = true;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
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

  # USB
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nekomi = {
    isNormalUser = true;
    description = "nekomi";
    extraGroups = [ "networkmanager" "wheel" "input" "boinc" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  #hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    #nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  services.boinc.enable = true;
  services.boinc.extraEnvPackages = with pkgs; [
  	libglvnd
	brotli
  ];

  #nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  nixpkgs.overlays = let
    nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
  in [
    nix-matlab.overlay
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ];


  networking.extraHosts =
  ''
    128.95.160.156 boinc-files.bakerlab.org
    128.95.160.156 bwsrv1.bakerlab.org
  '';

  # Undervolting 
  services.undervolt = {
  	enable = true;
	package = pkgs.undervolt;
	coreOffset = 0;
	gpuOffset = -50;
	temp = 70;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     home-manager
     neovim

     gdm
     gdm-settings
     nordzy-cursor-theme
     nordzy-icon-theme
     nordic

     libreoffice
     librewolf
     brave
     git
     kitty
     kitty-themes
     thunderbird
     fastfetch
     yazi
     discord
     vesktop
     zip
     unzip
     nemo-with-extensions
     mpv
     nsxiv

     gcc
     python3Full

     gnome-keyring
     gnupg
     pass
     git-credential-manager
     networkmanagerapplet
     seahorse

     fish
     starship

     udisks
     udiskie

  #  hyprland
     rofi-wayland	
     wofi
     swww
     mako
     waybar
     hyprlock
     wlogout
     brightnessctl
     pwvucontrol
     hyprshot
     hyprcursor

     boinctui
     undervolt
     s-tui
     stress
     podman

     matlab
     julia-bin
     cmake
     libpkgconf

     nix-ld
     obs-studio
  ];

  fonts.packages = with pkgs; [
	nerd-fonts._3270
	nerd-fonts.monofur
	noto-fonts-cjk-sans
	noto-fonts-cjk-serif
	vistafonts
  ];

  #Garbage collector
  #nix.gc = {
  #	automatic = true;
  #	dates = "weekly";
  #	options = "--delete-older-than 180d";
  #};

  #nix.optimise = {
  #	automatic = true;
  #	interval = {Weekday = 7}
  #};


  #Experimental Features

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # services.envfs.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
  #hardware.graphics.enable = true;
  #hardware.graphics.enable = true;
