{ config
, pkgs
, lib
, ...
}:
let
  cfg = config.services.ollama;
in
{
  options.services.ollama = {
    enable = lib.mkEnableOption "ollama";
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      OLLAMA_ORIGINS = "http://127.0.0.1:11434";
      OLLAMA_HOST = "127.0.0.1:11434";
      OLLAMA_MODELS = "/var/lib/ollama/models";
      OLLAMA_URL = "http://127.0.0.1:11434";
      OLLAMA_SECRET_API_KEY = "sk-89804321";
      CUDA_VISIBLE_DEVICES = "0,1";
    };

    systemd.tmpfiles.rules = [
      "d /var/lib/ollama/models 0755 ollama ollama -"
    ];

    services.ollama = {
      enable = true;
      acceleration = "cuda";
      openFirewall = true;
      loadModels = [
        "vicuna"
      ];
      host = "127.0.0.1";
      port = 11434;
      home = "/var/lib/ollama";
    };

    # start ollama with systemd (as a user service)
    systemd.user.services.ollama = {
      enable = true;
      description = "ollama server instance";
      unitConfig = {
        Type = "simple";
      };
      serviceConfig = {
        ExecStart = "${pkgs.ollama}/bin/ollama serve";
        wantedBy = [ "default.target" ];
      };
    };

    systemd.services.init-ollama = {
      description = "Initialize ollama service";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" "polkit.service" ];
      requires = [ "network-online.target" ];
      path = [ "/run/current-system/sw/" ];
      script = ''
    '';

      serviceConfig = {
        Type = "oneshot";
      };
    };
  };
}
