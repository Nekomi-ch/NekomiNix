{pkgs, ...}:{
  gtk = {
    enable = true;

    cursorTheme.package = pkgs.nordzy-cursor-theme;
    cursorTheme.name = "Nordzy-cursors";

    theme.package = pkgs.nordic;
    theme.name = "Nordic";

    iconTheme.package = pkgs.nordzy-icon-theme;
    iconTheme.name = "Nordzy-icon";
  };
}
