# TBCO's nix tooling

## [`tbco-nix`](https://github.com/the-blockchain-company/tbco-nix)

`tbco-nix` is TBCO's shared nix library. It provides some templates to
make working with `haskell.nix` trivial but is non-essential to use
`haskell.nix` infrastructure.

### `lib.nix`

```nix
{{#include tbco-nix/lib.nix}}
```

### `tbco-nix.json`
```json
{{#include tbco-nix/tbco-nix.json}}
```

### `nix/pkgs.nix`

```nix
{{#include tbco-nix/nix/pkgs.nix}}
```

### `default.nix`

```nix
{{#include tbco-nix/default.nix}}
```
