{...}: {
  programs.git = {
    enable = true;
    userName = "nekomi-ch";
    userEmail = "148702789+Nekomi-ch@users.noreply.github.com";

		signing = {
			key = "148702789+Nekomi-ch@users.noreply.github.com";
			signByDefault = false;
		};
  };
}
