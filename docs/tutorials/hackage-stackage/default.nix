let
  # You can use a tool like `niv` to manage this boilerplate
  hackageSrc = builtins.fetchTarball "https://github.com/the-blockchain-company/hackage.nix/archive/master.tar.gz";
  stackageSrc = builtins.fetchTarball "https://github.com/the-blockchain-company/stackage.nix/archive/master.tar.gz";
  haskellSrc = builtins.fetchTarball "https://github.com/the-blockchain-company/haskell.nix/archive/master.tar.gz";

  haskellNix = import haskellSrc {
    # This allows you to override the pins used by `haskell.nix` internally
    sourcesOverride = {
      hackage = hackageSrc;
      stackage = stackageSrc;
    };
  };
in {
  inherit haskellNix
  # ...
}
