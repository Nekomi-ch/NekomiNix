{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = true;
    keyMode = "vi";
    shortcut = "s";

    extraConfig = "
      set-option -g status-position top
      set -g base-index 1
      setw -g pane-base-index 1

			unbind r 
			bind r source-file ~/.config/tmux/tmux.conf
      "
    ;

		plugins = with pkgs; [
			tmuxPlugins.tokyo-night-tmux
		];
  };
}
