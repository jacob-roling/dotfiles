{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    profiles = {
      jacob = {
        id = 0;
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          wappalyzer
          joplin-web-clipper
        ];
      };
    };
  }
}
