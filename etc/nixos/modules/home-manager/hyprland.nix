{ inputs, config, pkgs, ... }:
{
  wayland = {
    windowManager.hyprland = with config.colorScheme.palette; {
      enable = true;
      systemd.enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      extraConfig = ''
monitor=,highres,auto,2

# Idle
# exec-once hypridle

# Waybar
exec-once = waybar

# Set wallpapers
exec-once = swww init
exec-once = for img in ~/Pictures/Wallpapers/*; do swww img "$img"; done

# Set programs that you use
$terminal = kitty
$menu = rofi -show drun
$browser = firefox

# Some default env vars.
env = XCURSOR_SIZE,24
# env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

env = NIXPKGS_ALLOW_UNFREE,1

env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1

env = GDK_BACKEND,wayland,x11
env = SDL_VIDEODRIVER,wayland
env = CLUTTER_BACKEND,wayland
env = MOZ_ENABLE_WAYLAND,1
env = MOZ_DISABLE_RDD_SANDBOX,1
env = _JAVA_AWT_WM_NONREPARENTING,1
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = QT_QPA_PLATFORM,wayland
env = __NV_PRIME_RENDER_OFFLOAD,1
env = __VK_LAYER_NV_optimus,NVIDIA_only
env = PROTON_ENABLE_NGX_UPDATER,1
env = NVD_BACKEND,direct
env = __GL_GSYNC_ALLOWED,1
env = __GL_VRR_ALLOWED,1
env = WLR_DRM_NO_ATOMIC,1
env = WLR_USE_LIBINPUT,1
env = __GL_MaxFramesAllowed,1
env = WLR_RENDERER_ALLOW_SOFTWARE,1
env = NIXOS_OZONE_WL,1
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_DESKTOP,Hyprland
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = GDK_SCALE,2

xwayland {
    force_zero_scaling = true
}

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 to 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgb(${base05})
    col.inactive_border = rgb(${base00})

    layout = dwindle

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false

    # lock_cmd = notify-send "lock!"          # dbus/sysd lock command (loginctl lock-session)
    # A unlock_cmd = notify-send "unlock!"      # same as above, but unlock
    # before_sleep_cmd = notify-send "Zzz"    # command ran before sleep
    # after_sleep_cmd = notify-send "Awake!"  # command ran after sleep
    # ignore_dbus_inhibit = false             # whether to ignore dbus-sent idle-inhibit requests (used by e.g. firefox or steam)
}

# listener {
#     timeout = 500                            # in seconds
#     on-timeout = notify-send "You are idle!" # command to run when timeout has passed
#     on-resume = notify-send "Welcome back!"  # command to run when activity is detected after timeout has fired.
# }

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 8
    
    blur {
        enabled = true
        size = 8
        passes = 4
        brightness = 0.25
    }

    drop_shadow = false
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
}



# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, $terminal
bind = $mainMod, Q, killactive, 
bind = $mainMod, C, exit, 
bind = $mainMod, V, togglefloating, 
bind = $mainMod SHIFT, Return, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, F, fullscreen,
bind = $mainMod, W, exec, $browser
bind = $mainMod, M, exec, spotify

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move active window
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1
bind = $mainMod CONTROL, right, workspace,e+1
bind = $mainMod CONTROL, left, workspace,e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bind = ALT,Tab,cyclenext
bind = ALT,Tab,bringactivetotop
bind = ,XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bind = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind = ,XF86AudioPlay, exec, playerctl play-pause
bind = ,XF86AudioPause, exec, playerctl play-pause
bind = ,XF86AudioNext, exec, playerctl next
bind = ,XF86AudioPrev, exec, playerctl previous
bind = ,XF86MonBrightnessDown,exec,brightnessctl set 5%-
bind = ,XF86MonBrightnessUp,exec,brightnessctl set +5%
'';
    };
  };
}
