{ pkgs, ... }:
{
    programs = {
        yazi = {
            enable = true;
        };

        zsh.shellAliases = {
            fm = "yazi";
        };
    };
}