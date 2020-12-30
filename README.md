# purescript-openlayers
A purescript FFI binding for OpenLayers v6.5. It is by no means near a complete binding but fulfills the need for the Swedish IoT Hub Prototype for Accessibility Case 3, see https://github.com/dnulnets/haccessibility, for now. Please feel free to contribute to thie library!

OpenLayers uses a lot of object inheritance, optional record fields and fields having mutiple types when creating the objects. It has been solved in purescript by using type parameters, Union, and a pattern of constructuor records and unsafeCoerce. See below for more details.

## Adding the library to your project

Add this to your package.dhall:

```dhall
let additions = {
    openlayers =
    { dependencies =[ "console", "effect", "foreign", "functions", "maybe", "nullable", "psci-support"]
    , repo = "https://github.com/dnulnets/purescript-openlayers.git"
    , version = "v0.1.9"
    }
}
```

or make a local addition and clone the repository. Then install it with:


```sh
spago install openlayers
```

## Documentation

The majority of the documentation is the already on the OpenLayers home page for javascript and
in those cases where the FFI binding differs it is written in the purescript files as comments
and can be generated from the repository with:

```sh
spago docs
```

## Requirements to be able to build

You need to include Openlayers in the node environment to be able to run or pack the final output.


```
npm install ol
```

## Patterns used by the FFI Mapping for OpenLayers 
All javascript ***new*** functions in OpenLayers are mapped to a correspondign ***create*** function for each class. The case when the options parameter for the javascript ***new*** function can be omitted completely a ***create'*** function is added.


In addition to that the following patterns have been used:
### Inheritance
The following pattern is used to follow the inheritance structure for the Openlayers FFI mapping:

```purescript
foreign import data RawBaseLayer :: Type -> Type
foreign import data RawLayer :: Type

type BaseLayer a = RawBaseLayer a
type Layer = BaseLayer RawLayer
```

This is an example of a ***Layer*** that "inherits" ***BaseLayer*** and you can then use a ***Layer*** in every function that takes a ***BaseLayer a***.

### Optional record fields
The following pattern is used to support optional record fields within OpenLayers:

```purescript
type OptionalFields = (a::String, b::Boolean)

create :: forall l r . Union l r OptionalFields => Record l -> Effect ....
create o = runFn1 createImpl (FFI.notNullOrUndefined o)
```
```javascript
exports.createImpl = function (opt) {
    return function() {
        return new oll.Vector(opt);
    }
}
```

This is an example of how a ***create*** function is mapped to the javascript ***new*** function that takes an options parameter with optional fields.

### Record fields with multiple types
The following pattern is used to support record fields that can have multiple types within OpenLayers:

```purescript
foreign import data Target :: Type

type OptionalFields = (element::Element, target::Target)

target::{asId::String->Target, asElement::Element->Target}
target = {asId:unsafeCoerce, asElement:unsafeCoerce}

create :: forall l r . Union l r OptionalFields => Record l -> Effect ...
create o = ...
```

and can then be used such as follows:

```purescript
create { target: target.asId "elementid"}
```
