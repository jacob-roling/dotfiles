{ pkgs, inputs, config, ... }:
{
  xdg.configFile."waybar/config.jsonc".source = ../../../../.config/waybar/config.jsonc;

  programs.waybar = with config.colorScheme.palette; {
    enable = true;
    systemd.enable = true;
    style = ''
* {
    font-family: FiraCode Nerd Font, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 16px;
}

window#waybar {
    background-color: #${base01};
    color: #${base05};
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button {
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.focused {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#window,
#workspaces {
}

.modules-left {
  margin: 4px 0px 4px 4px;
}

.modules-center {
  margin: 4px 0px 4px 0px;
}

.modules-right {
  margin: 4px 4px 4px 0px;
}

.modules-left, .modules-right, .modules-center {
  background-color: #${base00};
  border-radius: 999px;
}

window#waybar.empty #window {
    background-color: transparent;
}

#workspaces button, #window, #clock, #pulseaudio {
  padding: 4px 8px;
}

#clock {
  color: #${base0A};
}

#battery {
}

#memory {
}

#pulseaudio {
  color: #${base0B};
}

#pulseaudio.muted {
}
'';
  };
}
