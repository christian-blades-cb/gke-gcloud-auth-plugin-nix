{ baseUrl ? "https://dl.google.com/dl/cloudsdk/channels/rapid/" }:

let
  manifest = builtins.fromJSON (builtins.readFile ./sources.json);
  srcFromManifest = googleName: with manifest.${googleName}; {
    url = "${baseUrl}/${url}";
    inherit sha256;
  };
in
rec {
  # manifest at https://dl.google.com/dl/cloudsdk/channels/rapid/components-2.json

  version = manifest.gke-gcloud-auth-plugin-linux-x86_64.version.version_string;
  build =  manifest.gke-gcloud-auth-plugin-linux-x86_64.version.build_number;

  aarch64-darwin = srcFromManifest "gke-gcloud-auth-plugin-darwin-arm";

  x86_64-darwin = srcFromManifest "gke-gcloud-auth-plugin-darwin-x86_64";

  aarch64-linux = srcFromManifest "gke-gcloud-auth-plugin-linux-arm";

  x86_64-linux = srcFromManifest "gke-gcloud-auth-plugin-linux-x86_64";

  i686-linux = srcFromManifest "gke-gcloud-auth-plugin-linux-x86";
}
