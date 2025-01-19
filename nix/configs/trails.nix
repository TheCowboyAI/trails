{ config, lib, ... }:
# trails... a web search system using ai to find the best results
let
  cfg = config.services.trails;
in
{

  config = lib.mkIf cfg.enable { };
}
