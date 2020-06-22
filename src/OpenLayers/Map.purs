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
  , RawMap

  , create
  , create'
  
  ) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn0
  , Fn1
  , runFn0
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Openlayers
import OpenLayers.FFI as FFI
import OpenLayers.View as View
import OpenLayers.Layer.Base as Base
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
foreign import data RawMap :: Type
type Map = PluggableMap.PluggableMap RawMap
--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Map)

-- |Creates a `Map`, see `new Map(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Map
create o = runFn1 createImpl $ FFI.toNullable o

-- |Creates a `Map` with defaults, see `new Map()` in the Openlayers API documentation.
create':: Effect Map
create' = runFn1 createImpl FFI.undefined
