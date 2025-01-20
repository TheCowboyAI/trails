{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, darwin
, libgit2
, git
, pkg-config
, zlib
, dart-sass
, nodejs_23
, nodePackages
, config
,
}:

rustPlatform.buildRustPackage {
  pname = "trails";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "thecowboyai";
    repo = "trails";
    rev = "";
    hash = "";
  };

  cargoHash = "";

  nativeBuildInputs = [
    pkg-config
    git
  ];

  buildInputs = [
    libgit2
    zlib
    dart-sass
    nodejs_23
    nodePackages.tailwindcss
    nodePackages.typescript-language-server

    # dev docs
    config.process-compose.cargo-doc-live.outputs.package

  ] ++ lib.optional stdenv.hostPlatform.isDarwin darwin.apple_sdk.frameworks.Security;

  meta = with lib; {
    description = "Trails is an enhanced Internet Search experiance";
    homepage = "https://github.com/thecowboyai/trails";
    license = licenses.mit;
    maintainers = with maintainers; [ cowboyai ];
    mainProgram = "trails";
  };
}
