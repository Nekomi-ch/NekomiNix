{...}: {
  services.hyprpaper = {
    enable = true;

		settings = {
			ipc = true;
			splash = false;

			preload = ["~/Pictures/Nixos/Wallpapers/Birthday2025.png"];

			wallpaper = ["eDP-1,~/Pictures/Nixos/Wallpapers/Birthday2025.png"];
		};
  };
}

