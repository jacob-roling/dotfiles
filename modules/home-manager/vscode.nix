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
    extensions = with extensions.vscode-marketplace; [
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
      otovo-oss.htmx-tags
      esbenp.prettier-vscode
      golang.go
      pkief.material-icon-theme
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
      slevesque.shader
      geequlim.godot-tools
      bbenoist.nix
      mkhl.direnv
      unifiedjs.vscode-mdx
    ] ++ (with extensions.open-vsx-release; [
      rust-lang.rust-analyzer
    ]);
  };
}

# ms-dotnettools.csharp
# ms-dotnettools.vscode-dotnet-runtime
# eamodio.gitlens
# arrterian.nix-env-selector
# raczzalan.webgl-glsl-editor
# wgsl-analyzer.wgsl-analyzer
# vscodevim.vim
# devsense.phptools-vscode
# devsense.composer-php-vscode
# devsense.profiler-php-vscode