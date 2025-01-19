{...}: {
  programs.kitty = {
    enable = true;

    font = { 
      name = "3270 nerd font";
      size = 15;
    };
    shellIntegration.enableFishIntegration = true;

    theme = "Nord";
  };
}
