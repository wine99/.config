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
    pkgs.ranger
    pkgs.cmake
    pkgs.jdk
    pkgs.python3
    pkgs.nodejs
    pkgs.rustup
    pkgs.opam
    pkgs.racket
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

    shellInit = ''
      zoxide init fish | source
      fish_add_path $HOME/.emacs.d/bin
      fish_add_path $HOME/.cargo/bin
      source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';

    interactiveShellInit = ''
      set --global VISUAL "emacs"
      set --global EDITOR "vim"
    '';
  };

  programs.bat.enable = true;
  programs.keychain.enable = true;
  programs.zoxide.enable = true;
  programs.skim.enable = true;

  programs.git = {
    enable = true;
    userName = "Zijun Yu";
    userEmail = "zijun.yu.joey@gmail.com";
  };

  programs.emacs = {
    enable = true;
    # extraPackages = epkgs: [
    #   epkgs.nix-mode
    #   epkgs.magit
    # ];
  };
}
