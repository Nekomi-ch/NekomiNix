{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nekomi";
  home.homeDirectory = "/home/nekomi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./kitty.nix
    ./gtk.nix
    ./yazi.nix
    ./fish.nix
    ./neovim.nix
    ./bash.nix
    ./starship.nix
    ./hyprlock.nix
    ./waybar.nix
    ./wlogout.nix
    ./git.nix
    ./btop.nix
    ./tmux.nix
    ./rofi.nix
    ./mako.nix
    ./fastfetch.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    btop

    #Lazyvim
    lazygit
    fd
    ripgrep
    telescope
    curl
    gh
    github-desktop
    tmux 
    fzf

    ncdu
    ffmpeg-full
    lsd
    axel
    tldr

    #LaTeX
    texliveFull
    vimPlugins.vimtex
    papers
		zathura

    #random
    pipes
    hollywood
    cmatrix

    gnumake
    unzip
    wget

    vdhcoapp

		#language servers
		matlab-language-server
		nil
		ltex-ls
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nekomi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
      EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  #hyprland stuff


   
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$main" = "SUPER";

      monitor = ",preferred,auto,1";

      env = [
        "HYPRCURSOR_THEME,Nordzy-cursors"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "swww init && waybar"
        "brightnessctl s 35%"
        "[workspace 1 silent] kitty"
        "[workspace 2 silent] librewolf"
        "[workspace 3 silent] thunderbird"
        #"[workspace 4 silent] boincmgr"
      ];
      
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;

        layout = "dwindle";

        "col.active_border" = "rgb(${config.colorScheme.palette.base08}) rgb(${config.colorScheme.palette.base0A}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base07}) rgb(${config.colorScheme.palette.base0B}) 45deg";
      };

    
      misc = {
        disable_hyprland_logo = "yes";
      };

      decoration = {
        rounding = 7;

        blur = {
          enabled = true;
          size = 7;
          passes = 4;
          new_optimizations = true;
        };

      };

      animations = {
        enabled = "yes";
      };

      windowrulev2 = [
				"opacity 0.9 0.9,class:^(kitty)$"
				#"opacity 1 1,class:^(kitty)$"

        "opacity 0.5 0.5,focus:0"
        "opacity 1 1,fullscreen:1"
        "opacity 1 1,class:^(librewolf)$"
        "opacity 1 1,class:^(firefox)$"
        "opacity 0.9 0.9,class:^(discord)$"
      ];


      bind = [
        #main keybinds
        "$main, Q, exec, kitty"
        "$main, C, killactive,"
        "$main, L, exec, hyprlock"
        "$main, M, exec, wlogout --protocol layer-shell" # show the logout window
        "$main SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
        "$main, E, exec, nemo"
        "$main, V, togglefloating," # Allow a window to float
        "$main, R, exec, rofi -show drun" # Show the graphical app launcher
        "$main, P, pseudo," # dwindle
        "$main, J, togglesplit," # dwindle
        "$main, F, fullscreen"
        "$main, S, exec, hyprshot -o ~/Pictures/Screenshots -m region" #screenshot
        "$main, ESCAPE, exec, wlogout -b 5" #wlogout
        "$main SHIFT, L, exec, brightnessctl s 35%" # For monitor accedentally goes to 0 by clicking


        #movement keybinds
        "$main, left, movefocus, l"
        "$main, right, movefocus, r"
        "$main, up, movefocus, u"
        "$main, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$main, 1, workspace, 1"
        "$main, 2, workspace, 2"
        "$main, 3, workspace, 3"
        "$main, 4, workspace, 4"
        "$main, 5, workspace, 5"
        "$main, 6, workspace, 6"
        "$main, 7, workspace, 7"
        "$main, 8, workspace, 8"
        "$main, 9, workspace, 9"
        "$main, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$main SHIFT, 1, movetoworkspace, 1"
        "$main SHIFT, 2, movetoworkspace, 2"
        "$main SHIFT, 3, movetoworkspace, 3"
        "$main SHIFT, 4, movetoworkspace, 4"
        "$main SHIFT, 5, movetoworkspace, 5"
        "$main SHIFT, 6, movetoworkspace, 6"
        "$main SHIFT, 7, movetoworkspace, 7"
        "$main SHIFT, 8, movetoworkspace, 8"
        "$main SHIFT, 9, movetoworkspace, 9"
        "$main SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$main, mouse_down, workspace, e+1"
        "$main, mouse_up, workspace, e-1"


      ];
      

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$main, mouse:272, movewindow"
        "$main, mouse:273, resizewindow"
      ];
    };

  };
}
