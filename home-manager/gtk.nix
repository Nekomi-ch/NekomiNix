{pkgs, ...}:{
  gtk = {
    enable = true;

		cursorTheme.package = pkgs.bibata-cursors;
		cursorTheme.name = "Bibata-Modern-Classic";

    theme.package = pkgs.tokyonight-gtk-theme;
    theme.name = "Tokyonight-Dark";

		iconTheme.package = pkgs.whitesur-icon-theme;
		iconTheme.name = "WhiteSur";
  };
}
