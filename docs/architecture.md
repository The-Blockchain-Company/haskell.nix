# Architecture

There are multiple components that play a part in the haskell.nix
infrastructure.  These are `nix-tools`, `haskell.nix`, `hackage.nix`,
and `stackage.nix`.

```no-highlight
                                             .-------------.     .-------------.
.- nix-tools ------.                         | haskell.nix |  .- | hackage.nix |
| .--------------. |   .----------------.    '-------------'  |  '-------------'
| | stack-to-nix |---> | stack-pkgs.nix |-.         |         |         |
| '--------------' |   '----------------' |         v         |         v
| .-------------.  |   .----------.       '--> .----------. <-'  .--------------.
| | plan-to-nix |----> | plan.nix |------.---> | pkgs.nix | <--- | stackage.nix |
| '-------------'  |   '----------'      |     '----------'      '--------------'
| .--------------. |   .--------------.  |          |
| | cabal-to-nix |---> | $package.nix |--'          v
| '--------------' |   '--------------'       .-------------.
'------------------'                          | default.nix |
                                              '-------------'
                                                    |
                                                    v
                                              .-------------.
                                              | release.nix |
                                              '-------------'
```
haskell.nix diagram

## [nix-tools](https://github.com/the-blockchain-company/nix-tools)

nix-tools is a Haskell package that provides the following tools:

- `cabal-to-nix`: a `.cabal` to `.nix` transformer that retains
  conditional expressions.

- `stack-to-nix`: a `stack.yaml` to `.nix` transformer that will read
  in a `stack.yaml` expression an generate a `pkgs.nix` file suited for
  use with `haskell.nix`.

- `plan-to-nix`: a `plan.json` to `.nix` transformer that will read in
  a `plan.json` file and generate a `pkgs.nix` file suited for use
  with `haskell.nix`.

as well as a few other tools used to generate `hackage.nix` and `stackage.nix`.

## [haskell.nix][]

[Haskell.nix][] is the runtime system for this Haskell infrastructure.
It contains the component builder, as well as the system package and
license mapping.  Without haskell.nix the expressions generated by
either of the `nix-tools` tools make little sense on their own.

## [hackage.nix][]

[hackage.nix][] provides all cabal expressions from hackage as nix
expressions.  It is periodically updated to keep in sync with the set
of packages available on hackage.

## [stackage.nix][]

[stackage.nix][] is similar to hackage.nix but provides all stackage
snapshots (lts, and nightly) as nix expressions.  It naturally depends
on hackage.nix to resolve package names, versions and revisions to the
respective packages from hackage.nix.

[haskell.nix]: https://github.com/the-blockchain-company/haskell.nix
[hackage.nix]: https://github.com/the-blockchain-company/hackage.nix
[stackage.nix]: https://github.com/the-blockchain-company/stackage.nix
