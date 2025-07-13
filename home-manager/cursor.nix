{pkgs, ...}:{
	home.pointerCursor = {
		name = "Bibata-Modern-Classic";
		package = pkgs.bibata-cursors;
		size = 30;
		gtk.enable = true;
		#hyprcursor.enable = true;
		#hyprcursor.size = 30;
	};
}
