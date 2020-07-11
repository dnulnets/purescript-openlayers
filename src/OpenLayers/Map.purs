-- |
-- | The OpenLayers Map module, a purescript FFI mapping. It also
-- | reexports functions based on the `Map` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Map (
  module PluggableMap
  , Map
  , Options(..)
  , Target
  , Controls
  , Layers
  , RawMap
  , target
  , controls
  , layers

  , create
  , create'
  
  ) where

-- Standard import
import Prelude (($))
import Prim.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Web imports
import Web.DOM.Element (Element)

-- Openlayers
import OpenLayers.FFI as FFI
import OpenLayers.Layer.Base as Base
import OpenLayers.View as View
import OpenLayers.Control.Control as Control
import OpenLayers.Collection as Collection
import OpenLayers.PluggableMap (
  PluggableMap
  , addInteraction
  , addLayer
  , getView
  , setTarget
  , clearTarget) as PluggableMap
--
-- Foreign data types
-- 
-- |The FFI version of the Map. For internal use only!
foreign import data RawMap :: Type
type Map = PluggableMap.PluggableMap RawMap

-- |The FFI mapping of the target element in the options structure
foreign import data Target :: Type

-- |Constructors for the target element in `MapOption`
target::{id::String->Target, element::Element->Target}
target = {id:unsafeCoerce, element:unsafeCoerce}

-- |The FFI mapping of the controls element in the options structure
foreign import data Controls :: Type

-- |Constructors for the controls element in `MapOption`
controls::{asCollection::Collection.Collection Control.Control->Controls, asArray::Array Control.Control->Controls}
controls = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

-- |The FFI mapping of the controls element in the options structure
foreign import data Layers :: Type

-- |Constructors for the layers element in `MapOption`
layers::forall r . {asCollection::Collection.Collection (Base.BaseLayer r)->Layers, asArray::Array (Base.BaseLayer r)->Layers}
layers = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

-- |The options for the creation of the Map. See the `options` parameter in `new Map(options)` in the OpenLayers API documentation.
type Options r = (target::Target, controls::Controls, layers::Layers, view::View.View)

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Map)

-- |Creates a `Map`, see `new Map(options)` in the OpenLayers API documentation.
create :: forall l r layer . Union l r (Options layer) => Record l -> Effect Map
create o = runFn1 createImpl $ FFI.notNullOrUndefined o

-- |Creates a `Map`, see `new Map(options)` in the OpenLayers API documentation.
create' :: Effect Map
create' = runFn1 createImpl FFI.undefined
