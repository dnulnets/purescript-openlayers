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
  , MapOption(..)
  , RawMap

  , create
  
  ) where

-- Standard import
import Prelude (($))
import Prim.Row (class Union)

-- Data imports
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

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

-- |The options for the creation of the Map. See the `options` parameter in `new Map(options)` in the OpenLayers API documentation.
type MapOption r = (target::String
                    , controls::Collection.Collection Control.Control
                    , layers::Array (Base.BaseLayer r)
                    , view::View.View)

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Map)

-- |Creates a `Map`, see `new Map(options)` in the OpenLayers API documentation.
create :: forall l r layer . Union l r (MapOption layer) => Maybe (Record l) -> Effect Map
create o = runFn1 createImpl $ FFI.toNullable o
