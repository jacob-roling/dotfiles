{ pkgs, inputs, ... }:
let
  extensionsList = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{
  environment.systemPackages = [
    (vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with extensionsList.vscode-marketplace; [
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
      ];
    })
  ];
}