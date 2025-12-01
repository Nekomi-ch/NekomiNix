{...}: {
  programs.git = {
    enable = true;
    settings.user = {
			name = "nekomi-ch";
    	email = "148702789+Nekomi-ch@users.noreply.github.com";
		};

		signing = {
			key = "148702789+Nekomi-ch@users.noreply.github.com";
			signByDefault = false;
		};
  };
}
