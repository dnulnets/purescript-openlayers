-- |
-- | The OpenLayers Overlay module, a purescript FFI mapping. It also
-- | reexports functions based on the `Overlay` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Overlay (
  Overlay
  , Options(..)
  , create) where

-- Standard imports
import Prim.Row (class Union)

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Our own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data Overlay :: Type

-- |The options for the creation of the Overlay. See the `options` parameter in `new Overlay(options)` in the OpenLayers API documentation.
type Options = ()

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Overlay)

-- |Create a new `Overlay`, see `new Overlay(r)` in the OpenLayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect Overlay
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

