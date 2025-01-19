{...}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      format = #"[](#FDFDFD)"+
               "$shell"+
               "$nix_shell" +
               #"[](bg:#1A1B2A fg:#474A53)"+
               "[](fg:#474A53)"+
               "$username" +
               "[](bg:#AECCFF fg:#474A53)" +
               "$directory" +
               "[](bg:#2D55E5 fg:#AECCFF)" +
               "$git_branch" +
               "$git_status" +
               "[](bg:#0A09A5 fg:#2D55E5)" +
               "$time[ ](fg:#0A09A5)";

      shell = {
        fish_indicator = "  ";
        bash_indicator = "  ";
        disabled = false;
        style = "fg:#ECEFF4";

        #style = "bg:#1A1B2A fg:#ECEFF4";
      };
      
      username = {
        show_always = true;
        style_user = "bg:#474A53 fg:#ECEFF4";
        style_root = "bg:#474A53 fg:#ECEFF4";
        format = "[$user ]($style)";
      };

      directory = {
        style = "bg:#AECCFF fg:#2E3440";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };

      time = {
        disabled = false;
        time_format = "%R";   # Hour:Minute Format
        style = "bg:#0A09A5 fg:#EcEFF4";
        format = "[ $time ]($style)";
      };

      git_branch = {
        symbol = " ";
        style = "bg:#2D55E5 fg:#ECEFF4";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#2D55E5 fg:#ECEFF4";
        format = "[ $all_status$ahead_behind ]($style)";
      };

      nix_shell = {
        symbol = "󱄅 ";
        style = "bg:#1A1B2A fg:#ECEFF4";
        format = "[󱄅 $state ]($style)";
      };
    };
  };
}
