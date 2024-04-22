{ pkgs, settings, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      "${settings.username}" = {
        id = 0;
        isDefault = true;
        search.default = "DuckDuckGo";
        # extensions = with config.nur.repos.rycee.firefox-addons; [
        #   bitwarden
        #   ublock-origin
        #   wappalyzer
        # ];
        bookmarks = settings.bookmarks;
      };
    };
    package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) {});
    policies = {
      # Homepage = {
      #   "URL" = "https://start.duckduckgo.com";
      # };
      # "SearchEngines" = {
      #   "Default" = "DuckDuckGo";
      # };
      # ExtensionSettings = {
      #   "uBlock0@raymondhill.net" = {
      #     "installation_mode" = "force_installed";
      #     "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      #   };
      #   "wappalyzer@crunchlabz.com" = {
      #     "installation_mode" = "force_installed";
      #     "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
      #   };
      #   "{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = {
      #     "installation_mode" = "force_installed";
      #     "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/fireshot/latest.xpi";
      #   };
      #   "{dcb8caa2-63fa-41aa-a508-a45c5990ebdd}" = {
      #     "installation_mode" = "force_installed";
      #     "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/zjm-whatfont/latest.xpi";
      #   };
      #   "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
      #     "installation_mode" = "force_installed";
      #     "install_url" = "https://addons.mozilla.org/firefox/downloads/file/4261683/bitwarden_password_manager-2024.3.1.xpi";
      #   };
      # };
    };
  };
}
