{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      jacob = {
        id = 0;
        isDefault = true;
        extensions = with config.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          wappalyzer
          joplin-web-clipper
        ];
      };
    };
  };
}
