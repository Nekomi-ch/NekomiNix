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

    font.package = pkgs.nerdfonts;
    font.name = "SpaceMono";

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

}
