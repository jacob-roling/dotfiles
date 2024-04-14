{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      jacob = {
        id = 0;
        isDefault = true;
        # extensions = with config.nur.repos.rycee.firefox-addons; [
        #   bitwarden
        #   ublock-origin
        #   wappalyzer
        # ];
      };
    };
    policies = {
      ExtensionSettings = rec {
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };
    };
  };
}
