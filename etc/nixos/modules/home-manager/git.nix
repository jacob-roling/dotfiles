{ inputs, ... }:
{
  xdg.configFile.".gitconfig".source = ../../../../.gitconfig;
  
  programs.git = {
    enable = true;
  };
}
