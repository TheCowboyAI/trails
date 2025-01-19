{ config, lib, ... }:
let
  cfg = config.services.nginx;
in
{
  options.services.nginx = {
    enable = lib.mkEnableOption "nginx";
  };

  config = lib.mkIf cfg.enable {
    services.nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts = {
        "search.leaf0.cim.thecowboy.ai" = {
          forceSSL = false;
          locations = {
            "/" = {
              extraConfig = ''
                uwsgi_pass unix:${config.services.searx.uwsgiConfig.socket};
              '';
            };
          };
        };

        "searchai.leaf0.cim.thecowboy.ai" = {
          forceSSL = false;
          locations."/" = {
            proxyPass = "http://127.0.0.1:11434";
            proxyWebsockets = true;
            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header X-Forwarded-Proto $scheme;
            '';
          };
        };
      };
    };
  };
}
