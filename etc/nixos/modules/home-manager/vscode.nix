{ pkgs, inputs, ...}:
let
  extensions = inputs.nix-vscode-extensions.extensions."x86_64-linux";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.fontFamily" = "FiraCode Nerd Font";
      "editor.fontSize" = 16;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.fontLigatures" = false;
      "workbench.editor.highlightModifiedTabs" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "files.autoSave" = "afterDelay";
      "explorer.sortOrder" = "type";
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = false;
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
    extensions = with extensions.vscode-marketplace; [
      esbenp.prettier-vscode
      golang.go
      bradlc.vscode-tailwindcss
      pkief.material-icon-theme
      eamodio.gitlens
      redhat.vscode-yaml
      yzhang.markdown-all-in-one
      dotenv.dotenv-vscode
      christian-kohler.path-intellisense
      formulahendry.auto-rename-tag
      wix.vscode-import-cost
      astro-build.astro-vscode
      tamasfe.even-better-toml
      attilabuti.mustache-syntax-vscode
      polymeilex.wgsl
      ritwickdey.liveserver
      arrterian.nix-env-selector
      slevesque.shader
      geequlim.godot-tools
      bbenoist.nix
      # raczzalan.webgl-glsl-editor
      # wgsl-analyzer.wgsl-analyzer
      # vscodevim.vim
      # devsense.phptools-vscode
      # devsense.composer-php-vscode
      # devsense.profiler-php-vscode
    ] ++ (with extensions.open-vsx-release; [
      rust-lang.rust-analyzer
    ]);
  };
}
