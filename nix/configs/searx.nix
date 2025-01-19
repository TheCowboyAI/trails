{ config, lib, ... }:
let
  cfg = config.services.searx;
in
{
  config = lib.mkIf cfg.enable {
    services.searx = {
      enable = true;
      redisCreateLocally = true;

      runInUwsgi = true;
      uwsgiConfig = {
        socket = "/run/searx/searx.sock";
        http = ":8888";
        chmod-socket = "660";
        disable-logging = true;
      };

      settings = {
        general = {
          debug = false;

        };

        server = {
          port = 80;
          bind_address = "127.0.0.1"; # address to listen on
          secret_key = "Istillhaven'tfoundwhatI'mlookingfor";
          base_url = false; # set custom base_url (or False)
          image_proxy = false; # proxying image results through searx
          public_instance = false;
          limiter = false;
          default_theme = "oscar"; # ui theme
        };

        engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
          "duckduckgo".disabled = false;
          "brave".disabled = false;
          "bing".disabled = true;
          "mojeek".disabled = false;
          "mwmbl".disabled = true;
          "mwmbl".weight = 0.4;
          "qwant".disabled = true;
          "crowdview".disabled = true;
          "crowdview".weight = 0.5;
          "curlie".disabled = true;
          "ddg definitions".disabled = false;
          "ddg definitions".weight = 2;
          "wikibooks".disabled = false;
          "wikidata".disabled = false;
          "wikiquote".disabled = true;
          "wikisource".disabled = true;
          "wikispecies".disabled = true;
          "wikispecies".weight = 0.5;
          "wikiversity".disabled = true;
          "wikiversity".weight = 0.5;
          "wikivoyage".disabled = true;
          "wikivoyage".weight = 0.5;
          "currency".disabled = false;
          "dictzone".disabled = true;
          "lingva".disabled = true;
          "bing images".disabled = false;
          "brave.images".disabled = false;
          "duckduckgo images".disabled = false;
          "google images".disabled = false;
          "qwant images".disabled = true;
          "1x".disabled = true;
          "artic".disabled = true;
          "deviantart".disabled = true;
          "flickr".disabled = true;
          "imgur".disabled = false;
          "library of congress".disabled = false;
          "material icons".disabled = true;
          "material icons".weight = 0.2;
          "openverse".disabled = true;
          "pinterest".disabled = true;
          "svgrepo".disabled = true;
          "unsplash".disabled = true;
          "wallhaven".disabled = true;
          "wikicommons.images".disabled = false;
          "yacy images".disabled = true;
          "bing videos".disabled = false;
          "brave.videos".disabled = false;
          "duckduckgo videos".disabled = false;
          "google videos".disabled = false;
          "qwant videos".disabled = true;
          "dailymotion".disabled = true;
          "google play movies".disabled = true;
          "invidious".disabled = true;
          "odysee".disabled = true;
          "peertube".disabled = false;
          "piped".disabled = true;
          "rumble".disabled = false;
          "sepiasearch".disabled = false;
          "vimeo".disabled = false;
          "youtube".disabled = false;
          "brave.news".disabled = false;
          "google news".disabled = false;
        };
      };
    };
  };
}
