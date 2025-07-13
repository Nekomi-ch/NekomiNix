{config, input, ...}: {
  services.mako = {
    enable = true;

    font = "Monofur Nerd Font 12";

    backgroundColor = "#090915";
    borderColor = "#f6f0ff";
    borderRadius = 5;
    borderSize = 5;
    textColor = "#f6f0ff";
 
    icons = true;
    ignoreTimeout = true;
    defaultTimeout = 5000;

  };
}
