-- |
-- | The OpenLayers Feature module, a purescript FFI mapping. It also
-- | reexports functions based on the `Feature` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Feature (
  module Object
  , module Observable

  , Feature
  , RawFeature
  , create
  , create'
  , Properties(..)
  , GeometryOrProperties(..)

  , setStyle
  , setProperties
  , setGeometry
  , setGeometry') where

-- Standard import
import Prelude
import Prim.Row (class Union)

-- Data imports
import Data.Nullable (Nullable, toNullable)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , Fn2
  , runFn1
  , runFn2)

-- Effect imports
import Effect (Effect)

--
-- Our own imports
--
import OpenLayers.FFI as FFI
import OpenLayers.Geom.Geometry as Geometry
import OpenLayers.Style.Style as Style
import OpenLayers.Object (BaseObject, get) as Object
import OpenLayers.Observable (on, once, un) as Observable
--
-- Foreign data types
--

-- |The FFI version of the Feature. For internal use only!
foreign import data RawFeature :: Type

type Feature = Object.BaseObject RawFeature

-- |The options for the creation of the Feature. See the `options` parameter in `new Feature(options)` in the OpenLayers API documentation.
-- The `Properties` constructor is for the creation of a `Feature` based on properties and the `Geometry` constructor is for the creation
-- of a `Feature` based on a `Geometry`. See the `GeometryOrProperties` type. 
data GeometryOrProperties g r = Properties (Record r)
                              | Geometry (Geometry.Geometry g)

-- |The properties for the creation of a `Feature` based on the `Properties` constructor. See the `options` parameter in `new Feature(options)` in the OpenLayers API documentation.
-- The r in the type is to support any property.
type Properties g r = (geometry :: Geometry.Geometry g | r)

--
-- Function mapping
--
foreign import createFromPropertiesImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Feature)
foreign import createFromGeometryImpl :: forall g . Fn1 (FFI.NullableOrUndefined (Geometry.Geometry g)) (Effect Feature)

-- |Creates a `Feature`, see `new Feature(options)` in the OpenLayers API documentation.
create :: forall l r g p . Union l r (Properties g p) => GeometryOrProperties g l -> Effect Feature
create (Properties r) = runFn1 createFromPropertiesImpl (FFI.notNullOrUndefined r)
create (Geometry g) = runFn1 createFromGeometryImpl (FFI.notNullOrUndefined g)

-- |Creates a `Feature` with defaults, see `new Feature()` in the OpenLayers API documentation.
create' :: Effect Feature
create' = runFn1 createFromPropertiesImpl FFI.undefined

--
-- setters
--
foreign import setStyleImpl :: Fn2 (Nullable Style.Style) Feature (Effect Unit)
setStyle::Maybe Style.Style->Feature->Effect Unit
setStyle st self = runFn2 setStyleImpl (toNullable st) self

foreign import setPropertiesImpl :: forall r . Fn2 (Record r) Feature (Effect Unit)
setProperties::forall r . Record r -> Feature -> Effect Unit
setProperties r self = runFn2 setPropertiesImpl r self

foreign import setGeometryImpl :: forall g . Fn2 (FFI.NullableOrUndefined (Geometry.Geometry g)) Feature (Effect Unit)

setGeometry::forall g . Geometry.Geometry g -> Feature -> Effect Unit
setGeometry r self = runFn2 setGeometryImpl (FFI.notNullOrUndefined r) self

setGeometry'::Feature -> Effect Unit
setGeometry' self = runFn2 setGeometryImpl FFI.undefined self
