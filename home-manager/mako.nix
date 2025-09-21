{config, input, ...}: {
  services.mako = {
    enable = true;

		settings = {
			ignore-timeout = true;
    	default-timeout = 5000;
    	icons = true;
    	border-radius = 5;
    	border-color = "#f6f0ff";
    	border-size = 5;
    	text-color = "#f6f0ff";
    	font = "Monofur Nerd Font 12";
    	background-color = "#090915";
		};

  };
}
