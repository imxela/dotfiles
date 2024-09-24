{
  config,
  lib,
  pkgs,
  ...
}: let
  
in {
  options = {
    modules.openssh.enable = lib.mkEnableOption "enable the openssh service";
  };

  config = lib.mkIf config.modules.openssh.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
    };
  };
}