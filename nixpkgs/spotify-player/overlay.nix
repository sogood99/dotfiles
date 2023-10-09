self: super:

{
  spotify-player = super.spotify-player.overrideAttrs ( oldAttrs: rec {
    version = "0.16";
    git-version = version;
    src = self.fetchFromGitHub {
      owner = "vyzo";
      repo = "gerbil";
      rev = "v${version}";
      sha256 = "0vng0kxpnwsg8jbjdpyn4sdww36jz7zfpfbzayg9sdpz6bjxjy0f";
    };
  });
}

