{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vlc
    spotify
    polypane
    libreoffice
  ];
}