{...}: {
  programs.wlogout = {
    enable = true;

    style = ./wlogoutstyle.css;

    layout = [
      {
        "label" = "lock";
        "action" = "hyprlock";
        "text" = "Lock";
      }

      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Sleep";
      }


      {
        "label" = "logout";
        "action" = "loginctl kill-session $XDG_SESSION_ID";
        "text" = "Logout";
      }

      {
        "label" = "reboot";
        "action" = "reboot";
        "text" = "Restart";
      }

      {
        "label" = "shutdown";
        "action" = "poweroff";
        "text" = "Power Off";
      }

    ];
  };
}
