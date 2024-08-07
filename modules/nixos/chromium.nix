{ pkgs, settings, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      # Ublock
      { id = "epcnnfbjfcgphgdmggkamkmgojdagdnn"; }
      # Loom
      { id = "liecbddmkiiihnedobmlmillhodjkdmb"; }
      # Honey
      { id = "bmnlcjabgnpnenekpadlanbbkooimhnj"; }
      # Bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      # Wappalyzer
      { id = "gppongmhjkpfnbhagpmjfkannfbllamg"; }
      # Dark Reader
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
      # Tango
      { id = "lggdbpblkekjjbobadliahffoaobaknh"; }
      # Bookmark Sidebar
      { id = "jdbnofccmhefkmjbkkdkfiicjkgofkdh"; }
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