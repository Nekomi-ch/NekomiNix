{...}:{
  programs.yazi = {
    enable = true;
    
    settings = {
      manager = {
        show_hidden = true;
	      sort_by = "natural";
	      sort_sensitive = true;
      };

      opener = {
        edit = [
	        {run = "nvim $@"; block = true;}
	      ];

        open = [
          {run = "okular $@"; block = true;}
        ];
      };

      open = {
        prepend_rules = [
          {name = "*.pdf"; use = "open";}
          {name = "*.tex"; use = "edit";}
        ];

        append_rules = [
          {name = "*"; use = "edit";}
        
        ];
      };
    };
  };
}
