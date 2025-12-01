{...}: {
  services.hyprpaper = {
    enable = true;

		settings = {
			ipc = true;
			splash = false;

			preload = ["~/Pictures/Nixos/Wallpapers/Birthday2025.png"];

			wallpaper = ["DP-1,~/Pictures/Nixos/Wallpapers/Birthday2025.png"];
		};
  };
}

