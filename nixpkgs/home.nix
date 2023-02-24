{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zijun";
  home.homeDirectory = "/home/zijun";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
    pkgs.ripgrep
    pkgs.python311
    pkgs.nodejs
    pkgs.rustup
    pkgs.opam
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    plugins = [
      # Need this when using Fish as a default macOS shell in order to pick
      # up ~/.nix-profile/bin
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
    ];
  };

  programs.bat = {
    enable = true;
    # config = {
    #   theme = "GitHub";
    #   italic-text = "always";
    # };
  };

  programs.emacs = {
    enable = true;
    # extraPackages = epkgs: [
    #   epkgs.nix-mode
    #   epkgs.magit
    # ];
  };

  programs.git = {
    enable = true;
    userName = "Zijun Yu";
    userEmail = "zijun.yu.joey@gmail.com";
    aliases = {
      prettylog = "...";
    };
  };
}
