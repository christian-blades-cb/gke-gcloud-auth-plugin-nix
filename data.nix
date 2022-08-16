{ baseUrl ? "https://dl.google.com/dl/cloudsdk/channels/rapid/" }:

rec {
  # manifest at https://dl.google.com/dl/cloudsdk/channels/rapid/components-2.json

  version = "0.2.0";
  build = "20220415194303";

  aarch64-darwin = {
    url = "${baseUrl}/components/google-cloud-sdk-gke-gcloud-auth-plugin-darwin-arm-20220415194303.tar.gz";
    sha256 = "671c488a87f4901023e8d53c6a48b2e95feccf29d1205218a896a297b3c697d3";
  };

  x86_64-darwin = {
    url = "${baseUrl}/components/google-cloud-sdk-gke-gcloud-auth-plugin-darwin-x86_64-20220415194303.tar.gz";
    sha256 = "13246b33bc9a08cba1e351188c132fec130dbb9699b69b4867dbfde61742809a";
  };

  aarch64-linux = {
    url = "${baseUrl}/components/google-cloud-sdk-gke-gcloud-auth-plugin-linux-arm-20220415194303.tar.gz";
    sha256 = "d11927a60ab40d5af8c2f350dbf4743234e02396e6700b32bbbfee35713b78d7";
  };

  x86_64-linux = {
    url = "${baseUrl}/components/google-cloud-sdk-gke-gcloud-auth-plugin-linux-x86_64-20220415194303.tar.gz";
    sha256 = "77f398eaedda9d6ae7f33a91495f3728089b2e540ea350bac78eee7c894fab69";
  };

  i686-linux = {
    url = "${baseUrl}/components/google-cloud-sdk-gke-gcloud-auth-plugin-linux-x86-20220415194303.tar.gz";
    sha256 = "61432985d9b2fff2715b0c6b5d4322b886f5e090edc9bec9fc7e1c4524172104";
  };
}
