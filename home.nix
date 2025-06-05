{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ashforest";
  home.homeDirectory = "/home/ashforest";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        undoFile.enable = true;
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };

        diagnostics = {
          enable = true;
          config.sign = {
              signs.text = {
                "vim.diagnostic.severity.ERROR" = "󰅚 ";
                "vim.diagnostic.severity.WARN" = "󰀪 ";
              };
            virtual_lines = true;
            virtual_text = true;
          };
          nvim-lint.enable = true;
        };

        binds.whichKey.enable = true;

        theme.enable = true;
        theme.name = "catppuccin";
        theme.style = "mocha";

        statusline.lualine.enable = true;

        telescope.enable = true;

        viAlias = true;
        vimAlias = true;

        treesitter = {
          enable = true;
          autotagHtml = true;
          context.enable = true;
        };

        languages = {
          enableFormat = true;
          nix.enable = true;
          rust.enable = true;
        };
        lsp = {
          enable = true;
          formatOnSave = true;

        };

        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          mappings = {
            confirm = "<Tab>";
            next = "<C-n>";
            previous = "<C-N>";
          };
        };

        autopairs.nvim-autopairs.enable = true;

        maps = {
          insert = {
            "jk".action = "<ESC>";
          };
        };

        utility = {
          yazi-nvim.enable = true;
        };
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
