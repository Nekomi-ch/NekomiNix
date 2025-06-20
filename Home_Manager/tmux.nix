{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = true;
    keyMode = "vi";
    shortcut = "s";

    extraConfig = "
      set-option -g status-position top \n
      set -g base-index 1 \n
      setw -g pane-base-index 1
      "
    ;
  };
}
