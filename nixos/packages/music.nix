{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vital
  ];
}