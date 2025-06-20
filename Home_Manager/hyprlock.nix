{config, inputs, ...}: {
  programs.hyprlock = {
      enable = true;

      settings = {
        background = [
          {
            text = "cmd[update=1000] echo $TIME";
            path = "~/Pictures/Nixos/Wallpapers/Birthday2025.png";
            blur_size = 8;
            blur_passes = 2;
            noise = 0.01;
            brightness = 0.5;
            vibrancy = 0.2;
            vibrancy_darkness = 0.2;
          }
        ];

        image = [
          {
            monitor = "";
            path = "~/Pictures/Nixos/NekomiHead.png";
            size = 350;
            rounding = -1;
            border_size = 6;
            border_color = "#f6f0ff";

            position = "0,300";
            halign = "center";
            valign = "center";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "#191728";
          }
        ];


        label = [
          {
            #zindex = 1;

            monitor = "";
            text = "NekomiNix $TIME";
            text_align = "right";
            color ="#f6f0ff";
            font_size = 75;
            font_family = "Monofur Nerd Font";

            position = "-900,500";
            halign = "center";
            valign = "bottom";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "#191728";
          }
        ];



        input-field = [
          {
            size = "200, 50";
            outline_thickness = 3;
            dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
            dots_ceqnter = "falseq";
            dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
            outer_color = "#191728";
            inner_color = "#f6f0ff";
            font_color = "#191728";
            fade_on_empty = "false";
            placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
            hide_input = "false";
            rounding = -1; # -1 means complete rounding (circle/oval)
            check_color = "#ffe19d";
            fail_color = "#f66355"; # if authentication failed, changes outer_color and fail message color
            fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
            fail_timeout = 2000; # milliseconds before fail_text and fail_color disappears
            fail_transition = 300; # transition time in ms between normal outer_color and fail_color
            capslock_color = "#d3baff"; 
            numlock_color = "#d3baff"; 
            bothlock_color = "#d3baff";  # when both locks are active. -1 means don't change outer color (same for above)
            invert_numlock = "false"; # change color if numlock is off
            swap_font_color = "false"; # see below


            position = "0, -70";
            halign = "center";
            valign = "center";

            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "rgb(${config.colorScheme.palette.base00})";
          }
        ];
      };
    };
} 
