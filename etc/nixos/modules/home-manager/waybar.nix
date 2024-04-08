{ pkgs, inputs, config, ... }:
{
  programs.waybar = with config.colorScheme.palette; {
    enable = true;
  };

  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };
  
  home.file.".config/waybar/style.css".text = ''
* {
    font-family: FiraCode Nerd Font;
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

#workspaces button {
}

#workspaces button:hover {
  color: #${base06};
}

#workspaces button.active {
  color: #${base06};
  box-shadow: inset 0 -2px #${base06};
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
  background-color: transparent;
  border-radius: 999px;
}

window#waybar.empty #window {
    background-color: transparent;
}

#workspaces button, #window, #clock, #pulseaudio, #bluetooth, #custom-power {
  padding: 4px 12px;
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

#custom-power {
  color: #${base0F};
}

#pulseaudio.muted {
}
'';
  };
}
