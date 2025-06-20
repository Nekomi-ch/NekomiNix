{...}: {
  programs.kitty = {
		#My own custom theme
    enable = false;

    font = { 
      name = "3270 nerd font";
      size = 15;
    };
    shellIntegration.enableFishIntegration = true;

    theme = "Nord";
  };
}
