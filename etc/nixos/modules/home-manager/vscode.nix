{ pkgs, ...}:
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
    extensions = with pkgs.vscode-extensions; [
      esbenp.prettier-vscode
      golang.go
      rust-lang.rust-analyzer
      bradlc.vscode-tailwindcss
      pkief.material-icon-theme
      # vscodevim.vim
      eamodio.gitlens
      redhat.vscode-yaml
      yzhang.markdown-all-in-one
      dotenv.dotenv-vscode
      christian-kohler.path-intellisense
      formulahendry.auto-rename-tag
      wix.vscode-import-cost
      astro-build.astro-vscode
      tamasfe.even-better-toml
      jnoortheen.nix-ide
      # devsense.phptools-vscode
      # devsense.composer-php-vscode
      # devsense.profiler-php-vscode
    ];
  };
}
