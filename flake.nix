{
  description = "gke-gcloud-auth-plugin";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem
      [ system.x86_64-linux system.aarch64-linux system.x86_64-darwin system.aarch64-darwin ]
      ( system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
          rec {
            packages = flattenTree rec {
              gke-gcloud-auth-plugin = pkgs.callPackage ./package.nix { };
              default = gke-gcloud-auth-plugin;
            };
            # defaultPackage = packages.gke-gcloud-auth-plugin;
          }
      );

}
