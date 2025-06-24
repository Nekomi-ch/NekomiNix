{...}: {
  programs.fastfetch = {
    enable = true;

		settings = {
			logo = {
				position = "left";
			};

			display = {
				separator = "   ";
			};

			modules = [
				{
					type = "title";
					color = {
						user = "white";
						at = "red";
						host = "white";
					};
				}

				{
					type = "break";
				}

				{
					type = "cpu";
					key = " ";
					keyColor = "blue";
				}
				{
					type = "gpu";
					key = " ";
					keyColor = "blue";
				}
				{
					type = "host";
					key = "󰍹 ";
					keyColor = "blue";
				}
				{
					type = "memory";
					key = " ";
					keyColor = "blue";
				}
				{
					type = "disk";
					key = "󰋊 ";
					keyColor = "blue";
				}

				{
					type = "break";
				}

				{
					type = "kernel";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "os";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "packages";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "wm";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "shell";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "terminal";
					key = " ";
					keyColor = "yellow";
				}

				{
					type = "break";
				}

				{
					type = "icons";
					key = " ";
					keyColor = "cyan";
				}
				{
					type = "cursor";
					key = "󰆽 ";
					keyColor = "cyan";
				}
				{
					type = "terminalfont";
					key = "󰬈 ";
					keyColor = "cyan";
				}
				{
					type = "font";
					key = "󰯫 ";
					keyColor = "cyan";
				}
				{
					type = "theme";
					key = " ";
					keyColor = "cyan";
				}

				{
					type = "break";
				}

				{
					type = "colors";
					symbol = "circle";
				}
			];
		};
  };
}
