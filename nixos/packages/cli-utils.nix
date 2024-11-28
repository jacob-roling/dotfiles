{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # nix-output-monitor
    # nvd
    # nh
    lsd
    ripgrep
    zip
    unzip
    p7zip
    stow
    neofetch
    bottom
    fzf
    git
    gh
    killall
    envsubst
    ffmpeg
    wget
    ncmpcpp
    polkit
    acpi
    powertop
    light
    mpd
    # mpd-cli
    systemd
    maim
    xclip
    alsa-utils
    ranger
    nsxiv
    dmidecode
    cpu-x
    xdelta
    imagemagick
    pandoc
    direnv
    fd
    file
    pass
    pwgen
    rsync
    starship
    dig
    fwupd
    git-credential-oauth
    libsecret
    turso-cli
    xdiskusage
    docker
    redis
    sqlite-interactive
    postgresql
    devenv
    dnsperf
    zenity
    mslink
    # (python3.withPackages (python-pkgs: [
    #   # python-pkgs.opencv4
    # ]))
  ];
}
