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
    background-color: #${base00};
    color: #${base05};
    transition-property: background-color;
    transition-duration: .5s;
    padding-block: 2px;
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
    padding: 0 5px;
    background-color: transparent;
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
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

.modules-right {
  background-color: #${base01};
  border-radius: 9999px;
}

.modules-right > * {
  padding: 2px 4px;
}

#clock {
  color: #${base0A};
}

#battery {
}

#cpu {
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
