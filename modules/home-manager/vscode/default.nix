{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    modules.vscode.enable = lib.mkEnableOption "enable vscode";
  };

  config = lib.mkIf config.modules.git.enable {
    home.packages = [
    ];

    programs.vscode = {
      enable = true;

      # Prefer managing versions of things through flakes
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;

      extensions = with pkgs.vscode-extensions; [
        # Web
        astro-build.astro-vscode
        ecmel.vscode-html-css
        ms-vscode.live-server
        yzhang.markdown-all-in-one
        davidanson.vscode-markdownlint
        bradlc.vscode-tailwindcss

        # Native Debugging
        vadimcn.vscode-lldb

        # C/C++
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        twxs.cmake

        # Crab language my beloved :3
        rust-lang.rust-analyzer

        # C#
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
        ms-dotnettools.csdevkit

        # Python
        ms-python.isort
        ms-python.vscode-pylance
        ms-python.python
        ms-python.debugpy

        # Nix
        jnoortheen.nix-ide

        # Misc
        editorconfig.editorconfig
        usernamehw.errorlens
        tamasfe.even-better-toml
        eamodio.gitlens
        ms-vscode.hexeditor
        esbenp.prettier-vscode

        pkgs.unstable.vscode-extensions.leonardssh.vscord

        # Theming
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        jdinhlife.gruvbox
        pkief.material-icon-theme
        equinusocio.vsc-material-theme
        equinusocio.vsc-material-theme-icons

        # Missing :(
        # neikeq.godot-csharp-vscode
        # jeff-hykin.better-cpp-syntax
        # geequlim.godot-tools
      ];

      userSettings = {
        "telemetry.telemetryLevel" = "off";
	"editor.fontLigatures" = false;
	"editor.fontFamily" = "Iosevka";
	"editor.fontSize" = 16;
	"editor.minimap.enabled" = false;
	"editor.rulers" = [ 80 90 120 ];

	"workbench.colorTheme" = "Catppuccin Mocha";
	"workbench.reduceMotion" = "on";
	"workbench.startupEditor" = "none";

	# Gruvbox Dark Hard, Gruvbox Dark Medium, Gruvbox Dark Soft
        "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";

	"window.menuBarVisibility" = "toggle";
	"window.titleBarStyle" = "custom";
	"window.zoomLevel" = 1; # 1 = 120%, -1 = 80%
	"files.enableTrash" = true;

	"files.eol" = "\r\n";

        "update.mode" = "none";
	"debug.console.fontFamily" = "Iosevka";
	"debug.console.fontSize" = 16;

	"extensions.autoCheckUpdates" = false;
	"extensions.autoUpdate" = false;
          
	"terminal.external.linuxExec" = "foot";
	"terminal.integrated.fontFamily" = "Iosevka";
	"terminal.integrated.fontSize" = 16;

	"window.systemColorTheme" = "dark";
        "chat.editor.fontFamily" = "Iosevka";
        "chat.editor.fontSize" = 16;

        # it's annoying >:c
	"security.workspace.trust.enabled" = false;
      };
    };
  };
}