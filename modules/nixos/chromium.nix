{ pkgs, settings, ... }:
{
  environment.systemPackages = with pkgs; [
    chromium
  ];

  programs.chromium = {
    enable = true;
    homepageLocation = "https://www.google.com";
    extensions = [
      # Ublock
      "epcnnfbjfcgphgdmggkamkmgojdagdnn"
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
}