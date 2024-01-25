{ pkgs, ... }:
{
  home.username = "radu";
  home.homeDirectory = "/home/radu";
  home.stateVersion = "23.11";
  
  home.packages = with pkgs; [
    neovim
    tree
  ];

  nixpkgs.config.allowUnfree = true;

  home.file.".config/nvim".source = fetchGit {
    url = "https://github.com/coderadu/nvim-dotfiles.git";
    ref = "main";
    rev = "98fc46296aa7050046bc81ce83baaf0fbaecfe7f";
  };

  programs.git = {
    enable = true;
    userName = "CodeRadu";
    userEmail = "47945947+CodeRadu@users.noreply.github.com";
  };
  programs.gh.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  imports = [
    ./gnome.nix
  ];

  programs.home-manager.enable = true;
}
