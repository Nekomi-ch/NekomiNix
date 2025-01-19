{pkgs, ...}: {
  programs.rofi.package = pkgs.rofi-wayland;

  programs.rofi = {
    enable = true;

    font = "Monofur Nerd Font 16";

    extraConfig = {
      display-ssh = " ";
      display-run = " ";
      display-drun = " ";
      display-window = " ";
      display-combi = " ";
      show-icons = true;
    };

    theme = "./nord.rasi";
  };
}
