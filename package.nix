{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, darwin
, libgit2
, git
, pkg-config
, zlib
, config
,
}:

rustPlatform.buildRustPackage {
  pname = "trails";
  version = "unstable";

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
    (nodePackages.tailwindcss.overrideAttrs (_: {
      plugins = [
        nodePackages."@tailwindcss/aspect-ratio"
        nodePackages."@tailwindcss/forms"
        nodePackages."@tailwindcss/language-server"
        nodePackages."@tailwindcss/line-clamp"
        nodePackages."@tailwindcss/typography"
      ];
    }))

    # dev docs
    config.process-compose.cargo-doc-live.outputs.package

  ] ++ lib.optional stdenv.hostPlatform.isDarwin darwin.apple_sdk.frameworks.Security;

  meta = with lib; {
    description = "Trails is an enhanced Internet Search experiance";
    homepage = "https://github.com/thecowboyai/trails";
    license = licenses.mit;
    maintainers = with maintainers; [ thecowboyai ];
    mainProgram = "trails";
  };
}
