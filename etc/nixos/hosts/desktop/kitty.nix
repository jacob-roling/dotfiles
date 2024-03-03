{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; {
  };

  programs.kitty = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };
}
