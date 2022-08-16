{ stdenv, fetchurl, autoPatchelfHook, lib, ... }:

let
  sources = import ./data.nix {};
in stdenv.mkDerivation {
  pname = "gke-gcloud-auth-plugin";
  version = sources.version;

  src = fetchurl (sources.${stdenv.hostPlatform.system});

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = lib.optionals stdenv.isLinux [ autoPatchelfHook ];

  installPhase = ''
    mkdir -p $out/bin
    cp -a . $out/bin/
    runHook postInstall
  '';
}
