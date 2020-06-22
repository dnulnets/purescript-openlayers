# purescript-openlayers
A purescript FFI mapping for OpenLayers v6.3.1. It is by no means complete and currently fulfills the need for the Swedish IoT Hub Prototype for Accessibility Case 3, see https://github.com/dnulnets/haccessibility.

## Installation

Add this to your package.dhall:

```dhall
let additions = {
    openlayers =
    { dependencies =[ "console", "effect", "foreign", "functions", "maybe", "nullable", "psci-support"]
    , repo = "https://github.com/dnulnets/purescript-openlayers.git"
    , version = "v0.1.0"
    }
}
```

or make a local addition and clone the repository. Then install it with:


```sh
spago install openlayers
```

## Documentation

The majority of the documentation is the already on the OpenLayers home page for javascript and
in those cases where the FFI mapping differs it is written in the purescript files as comments
and can be generated from the repository with:

```sh
spage docs
```
