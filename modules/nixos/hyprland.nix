{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      dolphin
      networkmanagerapplet
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  # security.polkit = {
  #   enable = true;
  #   extraConfig = ''
  #     polkit.addRule(function(action, subject) {
  #       if (
  #         subject.isInGroup("users")
  #           && (
  #             action.id == "org.freedesktop.login1.reboot" ||
  #             action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
  #             action.id == "org.freedesktop.login1.power-off" ||
  #             action.id == "org.freedesktop.login1.power-off-multiple-sessions"
  #           )
  #         )
  #       {
  #         return polkit.Result.YES;
  #       }
  #     });
  #   '';
  # };
}