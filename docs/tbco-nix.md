# TBCO's nix tooling

## [tbco-nix](https://github.com/The-Blockchain-Company/tbco-nix)

tbco-nix is TBCO's shared nix library.  It provides some templates to
make working with haskell.nix trivial but is non-essential to use
haskell.nix infrastructure.

lib.nix
```nix
let
  # tbco-nix can be overridden for debugging purposes by setting
  # NIX_PATH=tbco_nix=/path/to/tbco-nix
  tbcoNix = import (
    let try = builtins.tryEval <tbco_nix>;
    in if try.success
    then builtins.trace "using host <tbco_nix>" try.value
    else
      let
        spec = builtins.fromJSON (builtins.readFile ./tbco-nix.json);
      in builtins.fetchTarball {
        url = "${spec.url}/archive/${spec.rev}.tar.gz";
        inherit (spec) sha256;
      }) {};

  pkgs = tbcoNix.pkgs;
  lib = pkgs.lib;
in lib // { inherit tbcoNix pkgs; inherit (tbcoNix) nix-tools; }
```

tbco-nix.json
```json
{
  "url": "https://github.com/The-Blockchain-Company/tbco-nix",
  "rev": "c92f0119ef5814b0ed1f445c2fdcf8894e326294",
  "sha256": "05r90x6x3yp1nb66rkc4n0i8q15c634rrdsr2zvb118s3sdcmmrm",
  "fetchSubmodules": false
}
```

nix/pkgs.nix
```
{ pkgs ? import <nixpkgs> {}
, tbco-extras ? {}
, tbco-module ? {}
, haskell
, hackage
, stackage
, ...
}:
let
  # our packages
  stack-pkgs = import ./.stack-pkgs.nix;

  # Build the packageset with module support.
  # We can essentially override anything in the modules
  # section.
  #
  #  packages.cbors.patches = [ ./one.patch ];
  #  packages.cbors.flags.optimize-gmp = false;
  #
  compiler = (stack-pkgs.extras hackage).compiler.nix-name;
  pkgSet = haskell.mkNewPkgSet {
    inherit pkgs;
    pkg-def = stackage.${stack-pkgs.resolver};
    # These extras allow extension or restriction of the set of
    # packages we are interested in. By using the stack-pkgs.extras
    # we restrict our package set to the ones provided in stack.yaml.
    pkg-def-extras = [
      stack-pkgs.extras
      tbco-extras.${compiler}
    ];
    # package customizations
    modules = [
      # This module will ensure that we get the necessary
      # patches ontop of GHC packages that for which the
      # ones that GHC ships are not identical to the ones
      # we find on hackage. These patches will make sure
      # they are identical by augmenting the packages on
      # hackage to match those that ship with ghc.
      haskell.ghcHackagePatches.${compiler}

      # the tbco-module will supply us with the necessary
      # cross compilation plumbing to make Template Haskell
      # work when cross compiling.  For now we need to
      # list the packages that require template haskell
      # explicity here.
      tbco-module
    ];
  };
in
  pkgSet.config.hsPkgs // { _config = pkgSet.config; }
```


default.nix
```
let
  localLib = import ./lib.nix;
in
# This file needs to export a function that takes
# the arguments it is passed and forwards them to
# the default-nix template from tbco-nix. This is
# important so that the release.nix file can properly
# parameterize this file when targetting different
# hosts.
{ ... }@args:
# We will instantiate the defaul-nix template with the
# nix/pkgs.nix file...
localLib.nix-tools.default-nix ./nix/pkgs.nix args
# ... and add a few custom packages as well.
// { }
```
