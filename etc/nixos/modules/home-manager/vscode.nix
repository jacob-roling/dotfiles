{ pkgs, inputs, ...}:
let
  extensions = inputs.nix-vscode-extensions.extensions."x86_64-linux";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.fontFamily" = "FiraCode Nerd Font";
      "editor.fontSize" = 16;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.fontLigatures" = true;
      "workbench.editor.highlightModifiedTabs" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "files.autoSave" = "afterDelay";
      "explorer.sortOrder" = "type";
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;
      "editor.mouseWheelZoom" = true;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      "files.associations" = {
        ".env*" = "dotenv";
      };
      "editor.tokenColorCustomizations" = {
        "textMateRules" = [];
      };
      "dotenv.enableAutocloaking" = false;
      "redhat.telemetry.enabled" = false;
    };
    extensions = with extensions; [
      vscode-marketplace.esbenp.prettier-vscode
      vscode-marketplace.golang.go
      open-vsx-release.rust-lang.rust-analyzer
      vscode-marketplace.bradlc.vscode-tailwindcss
      vscode-marketplace.pkief.material-icon-theme
      # vscode-marketplace.vscodevim.vim
      vscode-marketplace.eamodio.gitlens
      vscode-marketplace.redhat.vscode-yaml
      vscode-marketplace.yzhang.markdown-all-in-one
      vscode-marketplace.dotenv.dotenv-vscode
      vscode-marketplace.christian-kohler.path-intellisense
      vscode-marketplace.formulahendry.auto-rename-tag
      vscode-marketplace.wix.vscode-import-cost
      vscode-marketplace.astro-build.astro-vscode
      vscode-marketplace.tamasfe.even-better-toml
      # vscode-marketplace.jnoortheen.nix-ide
      vscode-marketplace.attilabuti.mustache-syntax-vscode
      # vscode-marketplace.devsense.phptools-vscode
      # vscode-marketplace.devsense.composer-php-vscode
      # vscode-marketplace.devsense.profiler-php-vscode
    ];
  };
}
