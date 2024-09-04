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
    openshot-qt
    audacity
    motrix
    noisetorch
  ];
}