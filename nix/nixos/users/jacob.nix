{
  config,
  pkgs,
  ...
}: {
  users.users.jacob = {
    uid = 1000;
    isNormalUser = true;
    extraGroups = ["networkmanager" "transmission" "wheel" "audio" "realtime"];

    # openssh.authorizedKeys.keys = [
    #   "ssh-rsa AAAAB3NzaC reinis@home-desktop-debian"
    #   "ssh-rsa AAAAB3NzaC1yc2EA reinis@home-desktop-nixos"
    # ];
    
    # mkpasswd -m sha-512
    hashedPassword = "$6$q9vznMFhVXJH1H2W$yjoPJfsOpa0Obvu.cnF1lqrSs20ebYlQQpZKFFZoOz5z1mJkeDSG0QckBUfZ8KKqvgQ/k/8IJTw5mr2jgWAOf.";
  };
}