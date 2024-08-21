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

    #gtk theme 
    nordic

    #LaTeX
    texliveFull
    vimPlugins.vimtex
    okular

    #random
    pipes
    hollywood
    cmatrix

    gnumake
    unzip

  ];

  ## GTK Themes

  gtk.enable = true;

  #gtk.cursorTheme.package = pkgs.nordic;
  #gtk.cursorTheme.name = "Nordic";

  gtk.theme.package = pkgs.nordic;
  gtk.theme.name = "Nordic";

  gtk.iconTheme.package = pkgs.nordic;
  gtk.iconTheme.name = "Nordic";

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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.yazi = {
    enable = true;
    
    settings = {
      manager = {
        show_hidden = true;
	      sort_by = "natural";
	      sort_sensitive = true;
      };

      opener = {
        edit = [
	        {run = "nvim $@"; block = true;}
	      ];

        open = [
          {run = "okular $@"; block = true;}
        ];
      };

      open = {
        prepend_rules = [
          {name = "*.pdf"; use = "open";}
          {name = "*.tex"; use = "edit";}
        ];

        append_rules = [
          {name = "*"; use = "edit";}
        
        ];
      };
    };
  };
  
  programs.kitty = {
    enable = true;

    #font.package = pkgs.nerdfonts;
    #font.name = "SpaceMono";
    font = {
      #name = "Space Mono nerd font";
      
      name = "3270 nerd font";
      size = 15;
    };
    shellIntegration.enableFishIntegration = true;

    theme = "Nord";
  };

  programs.btop = {
    enable = true;

    settings = {
      color_theme = "nord";
      theme_background = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "nekomi-ch";
    userEmail = "morvenhui@gmail.com";
  };
  
  
  #hyprland stuff
  
  programs.hyprlock = {
      enable = true;

      settings = {
        background = [
          {
            path = "~/Pictures/Nixos/Wallpapers/NixLogo.png";
            blur_size = 8;
            blur_passes = 1;
            noise = 0.01;
          }
        ];

        image = [
          {
            monitor = "";
            path = "~/Pictures/Nixos/NekomiHead.png";
            size = 350;
            rounding = -1;
            border_size = 6;
            border_color = "rgb(${config.colorScheme.colors.base06})";

            position = "0,300";
            halign = "center";
            valign = "center";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "rgb(${config.colorScheme.colors.base00})";
          }
        ];


        label = [
          {
            zindex = 1;

            monitor = "";
            text = "NekomiOS V2 $TIME";
            text_align = "left";
            color ="rgb(${config.colorScheme.colors.base06})";
            font_size = 75;
            font_family = "Monofur Nerd Font";

            position = "0,-670";
            halign = "center";
            #valign = "center";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "rgb(${config.colorScheme.colors.base00})";
          }
        ];



        input-field = [
          {
            size = "200, 50";
            outline_thickness = 3;
            dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
            dots_ceqnter = "falseq";
            dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
            outer_color = "rgb(${config.colorScheme.colors.base00})";
            inner_color = "rgb(${config.colorScheme.colors.base06})";
            font_color = "rgb(${config.colorScheme.colors.base01})";
            fade_on_empty = "false";
            placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
            hide_input = "false";
            rounding = -1; # -1 means complete rounding (circle/oval)
            check_color = "rgb(${config.colorScheme.colors.base0D})";
            fail_color = "rgb(${config.colorScheme.colors.base08})"; # if authentication failed, changes outer_color and fail message color
            fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
            fail_timeout = 2000; # milliseconds before fail_text and fail_color disappears
            fail_transition = 300; # transition time in ms between normal outer_color and fail_color
            capslock_color = "rgb(${config.colorScheme.colors.base0A})"; 
            numlock_color = "rgb(${config.colorScheme.colors.base0A})"; 
            bothlock_color = "rgb(${config.colorScheme.colors.base0A})";  # when both locks are active. -1 means don't change outer color (same for above)
            invert_numlock = "false"; # change color if numlock is off
            swap_font_color = "false"; # see below


            position = "0, -70";
            halign = "center";
            valign = "center";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "rgb(${config.colorScheme.colors.base00})";

          }
        ];


      };
    };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$main" = "SUPER";

      monitor = ",preferred,auto,1";

      #dwindle = [
      #  "pseudotile = yes"
      #  "preserve_split = yes"
      #];

      exec-once = "swww init";

      bind = [
        #main keybinds
        "$main, Q, exec, kitty"
        "$main, C, killactive,"
        "$main, L, exec, hyprlock"
        "$main, M, exec, wlogout --protocol layer-shell" # show the logout window
        "$main SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
        "$main, E, exec, nautilus"
        "$main, V, togglefloating," # Allow a window to float
        "$main, R, exec, rofi -show drun" # Show the graphical app launcher
        "$main, P, pseudo," # dwindle
        "$main, J, togglesplit," # dwindle
        "$main, F, fullscreen"

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
