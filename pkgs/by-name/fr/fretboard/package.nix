{ lib
, blueprint-compiler
, cargo
, darwin
, desktop-file-utils
, fetchFromGitHub
, glib
, gtk4
, libadwaita
, meson
, ninja
, pkg-config
, rustPlatform
, rustc
, stdenv
, wrapGAppsHook4
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "fretboard";
  version = "7.1";

  src = fetchFromGitHub {
    owner = "bragefuglseth";
    repo = "fretboard";
    rev = "v${finalAttrs.version}";
    hash = "sha256-ZBDsG59WLsTYdayqGMBAh9+gDtoaqlAuSdObcjAk6DA=";
  };

  cargoDeps = rustPlatform.fetchCargoTarball {
    src = finalAttrs.src;
    name = "${finalAttrs.pname}-${finalAttrs.version}";
    hash = "sha256-W0gvSPVG0q1928uDky4Ad4VowuWcj6DyyWF2C2Y573c=";
  };

  nativeBuildInputs = [
    blueprint-compiler
    cargo
    desktop-file-utils
    meson
    ninja
    pkg-config
    rustPlatform.cargoSetupHook
    rustc
    wrapGAppsHook4
  ];

  buildInputs = [
    glib
    gtk4
    libadwaita
  ] ++ lib.optionals stdenv.hostPlatform.isDarwin [
    darwin.apple_sdk.frameworks.Foundation
  ];

  env.NIX_CFLAGS_COMPILE = toString (lib.optionals stdenv.cc.isClang [
    "-Wno-error=incompatible-function-pointer-types"
  ]);

  meta = with lib; {
    changelog = "https://github.com/bragefuglseth/fretboard/releases/tag/v${finalAttrs.version}";
    description = "Look up guitar chords";
    homepage = "https://apps.gnome.org/Fretboard/";
    license = licenses.gpl3Plus;
    mainProgram = "fretboard";
    maintainers = with maintainers; [ michaelgrahamevans ];
    platforms = platforms.unix;
    broken = stdenv.hostPlatform.isDarwin;
  };
})
