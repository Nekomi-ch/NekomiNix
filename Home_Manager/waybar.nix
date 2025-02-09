{...}: {
  programs.waybar = {
    enable = true;

    style = ./waybarstyle.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["custom/nixos" "hyprland/workspaces"];
        modules-center = ["hyprland/window" "clock" "keyboard-state"];
        modules-right = ["pulseaudio" "custom/volume" "backlight" "network" "battery" "group/hardware"];

        "custom/nixos" = {
          "format" = "󱄅 ";
          "tooltip" = false;
          "on-click" = "wlogout -b 5";
        };

        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
            "disk"
            "temperature"
          ];

          drawer = {
            "transition_duration" = 500;
            "transition-left-to-right" = true;
          };
        };

        "cpu" = {
          "format" = "  {usage}%";
          "tooltip" = false;

          "on-click" = "kitty --hold sh -c 'btop'";
        }; 

        "memory" = {
          "interval" = 30;
          "format" = "  {percentage}%";
          "tooltip" = false;

          "on-click" = "kitty --hold sh -c 'btop'";
        };

        "disk" = {
          "interval" = 60;
          "format" = "  {percentage_used}%";
          "unit" = "GB";
          "tooltip" = true;
          "tooltip-format" = "{specific_used:0.2f} GB / {specific_total:0.2f} GB";

          "on-click" = "nautilus";
        };

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "on-click" = "activate";
          "warp-on-scroll" = true;
          "format" = "{icon}";
          "format-icons" = {
            "active" = " ";
          };
        };

        "hyprland/window" = {
          "format" = "󰅬 {}";
        };

        "clock" = {
          "interval" = 60;
          "format" = " {:%H:%M}";

          "tooltip" = true;
          "tooltip-format"= "󰃭 {:%Y-%m-%d %a}";

          "on-click" = "gnome-calendar";
        };

        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = {
            "numlock" = "󰎥 {icon}";
            "capslock" = "󰪛 {icon}";
          };

          "format-icons" = {
            "locked" = " ";
            "unlocked" = " ";
          };
        };

        "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = ["󰃞 " "󰃟 " "󰃠 "];
          "on-scroll-up" = "brightnessctl s +5%";
          "on-scroll-down" = "brightnessctl s 5%-";
          "on-click" = "brightnessctl s +5%";
          "on-click-right" = "brightnessctl s 5%-"; 
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-muted" = " ";
          "format-icons" = {
            "headphone" = " ";
            "default" = " ";
          };

          "scroll-step" = 1;
          "on-click" = "pwvucontrol"; 
          "tooltip" = false;
        };

        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "󰖩 ";
          "format-ethernet" = " ";
          "format-disconnected" = "󰖪 ";
          "tooltip-format" = "{ifname} via {gwaddr}  ";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) 󰖩 ";
          "tooltip-format-ethernet" = "{ifname}  ";
          "tooltip-format-disconnected" = "Disconnected 󰖪 ";

          "on-click" = "nm-connection-editor";
        };

        "battery" = {
          "interval" = 60;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };

          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% 󰂄";
          "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󱟢"];
        };

        "temperature" = {
          "thermal-zone" = 3;
          "format" = "{temperatureC}󰔄 ";
          "critial-threshold" = 69;
          "format-critical" = "{temperatureC}󰔄 ";

        };
      };
    };
  };
}
