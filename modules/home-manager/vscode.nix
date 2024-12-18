{ pkgs, inputs, ... }:
let
  extensionsList = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
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
      "zig.path" = "zig";
      "zig.zls.path" = "zls";
      "zig.initialSetupDone" = true;
      "emmet.includeLanguages" = {
        "javascript" = "javascriptreact";
        "handlebars" = "html";
        "mustache" = "html";
        "edge" = "html";
        "templ" = "html";
      };
      "sqltools.useNodeRuntime" = false;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[templ]" = {
        "editor.defaultFormatter" = "a-h.templ";
      };
      "[go]" = {
        "editor.defaultFormatter" = "golang.go";
      };
      # "[astro]" = {
      #   "editor.defaultFormatter" = "esbenp.prettier-vscode";
      # };
    };
    extensions = with extensionsList.vscode-marketplace; [
      bbenoist.nix
      tamasfe.even-better-toml
      astro-build.astro-vscode
      attilabuti.mustache-syntax-vscode
      polymeilex.wgsl
      ritwickdey.liveserver
      slevesque.shader
      geequlim.godot-tools
      mkhl.direnv
      yzhang.markdown-all-in-one
      adonisjs.vscode-edge
      tauri-apps.tauri-vscode
      jock.svg
      a-h.templ
      bradlc.vscode-tailwindcss
      mtxr.sqltools
      mtxr.sqltools-driver-sqlite
      thebearingedge.vscode-sql-lit
      ziglang.vscode-zig
      gleam.gleam
      unifiedjs.vscode-mdx
      otovo-oss.htmx-tags
      esbenp.prettier-vscode
      golang.go
      pkief.material-icon-theme
      redhat.vscode-yaml
      dotenv.dotenv-vscode
      christian-kohler.path-intellisense
      formulahendry.auto-rename-tag
      wix.vscode-import-cost
    ]; # ++ (with extensionsList.open-vsx-release; [
      # rust-lang.rust-analyzer
    # ]);
  };
}
