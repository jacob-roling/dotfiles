{ pkgs, settings, ... }:
{
  environment.systemPackages = with pkgs; [
    (chromium.override { enableWideVine = true; })
  ];

  programs.chromium = {
    enable = true;
    # homepageLocation = "chrome-extension://jdbnofccmhefkmjbkkdkfiicjkgofkdh/html/newtab.html";
    extensions = [
      # Ublock Origin
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      # Loom
      "liecbddmkiiihnedobmlmillhodjkdmb"
      # Honey
      "bmnlcjabgnpnenekpadlanbbkooimhnj"
      # Bitwarden
      "nngceckbapebfimnlniiiahkandclblb"
      # Wappalyzer
      "gppongmhjkpfnbhagpmjfkannfbllamg"
      # Dark Reader
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      # Tango
      "lggdbpblkekjjbobadliahffoaobaknh"
      # Bookmark Sidebar
      "jdbnofccmhefkmjbkkdkfiicjkgofkdh"
      # Instant Data Scraper
      # "ofaokhiedipichpaobibbnahnkdoiiah"
    ];
  };
  # extraOpts = {
  #   "BrowserSignin" = 0;
  #   "SyncDisabled" = true;
  #   "PasswordManagerEnabled" = false;
  #   "BuiltInDnsClientEnabled" = false;
  #   "MetricsReportingEnabled" = true;
  #   "SpellcheckEnabled" = true;
  #   "SpellcheckLanguage" = ["en-AU"];
  #   "CloudPrintSubmitEnabled" = false;
  # };

  # xdg.configFile."chromium/Default/Bookmarks".text = '';
}