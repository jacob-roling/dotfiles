{
  config,
  pkgs,
  inputs,
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
    obsidian
    inputs.zen-browser.packages."${system}".default
  ];
}