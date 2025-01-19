{config, input, ...}: {
  services.mako = {
    enable = true;

    font = "Monofur Nerd Font 12";

    backgroundColor = "#${config.colorScheme.palette.base01}";
    borderColor = "#${config.colorScheme.palette.base06}";
    borderRadius = 5;
    borderSize = 5;
    textColor = "#${config.colorScheme.palette.base06}";
 
    icons = true;
    ignoreTimeout = true;
    defaultTimeout = 5000;

  };
}
