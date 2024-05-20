{ pkgs, lib, settings, config, ... }:
let
  lingeringFile = "${config.home.homeDirectory}/.mozilla/firefox/${settings.username}/search.json.mozlz4";
in
{
  # Fix Firefox lingering file bug
  # home.file.".mozilla/firefox/${settings.username}/search.json.mozlz4".text = lib.mkForce "";
  # home.activation = lib.mkIf (builtins.pathExists lingeringFile) {
  #   deleteFile = lib.hm.dag.entryBefore ["linkGeneration"] ''
  #     $DRY_RUN_CMD rm -f ${lingeringFile}
  #     echo "Deleted ${lingeringFile}"
  #   '';
  # };

  programs.firefox = {
    enable = true;
    profiles = {
      "${settings.username}" = {
        isDefault = true;
        bookmarks = settings.bookmarks;
      };
    };
    package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) {});
    # Check about:policies#documentation for options.
    policies = {
      Homepage = {
        "URL" = "https://start.duckduckgo.com";
      };
      SearchEngines = {
        Add = [
          {
            Name = "DuckDuckGo";
            URLTemplate = "https://duckduckgo.com/?q={searchTerms}";
            Method = "GET";
            IconURL = "https://duckduckgo.com/favicon.ico";
            Description = "The Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs.";
          }
        ];
        "Default" = "DuckDuckGo";
      };
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        # Wappalyzer
        "wappalyzer@crunchlabz.com" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
        };
        # FireShot
        "{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/fireshot/latest.xpi";
        };
        # WhatFont
        "{dcb8caa2-63fa-41aa-a508-a45c5990ebdd}" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/zjm-whatfont/latest.xpi";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/file/4261683/bitwarden_password_manager-2024.3.1.xpi";
        };
      };
    };
  };
}
