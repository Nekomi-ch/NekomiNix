{...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = "set -U fish_greeting";  

    shellAbbrs = {
      ls = "lsd";
      vi = "nvim";
      vim = "nvim";
    };
    # shellInit = "tmux";
  };
}
