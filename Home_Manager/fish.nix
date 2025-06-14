{...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = "
			set -U fish_greeting \n
			eval (ssh-agent -c) \n
			clear
		";  

    shellAbbrs = {
      ls = "lsd";
      vi = "nvim";
      vim = "nvim";

			neofetch = "fastfetch";
			fetch = "fastfetch";

			ssh-act = "eval (ssh-agent -c)";
    };
    # shellInit = "tmux";
  };
}
