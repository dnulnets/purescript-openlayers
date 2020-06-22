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
  , create
  , create') where

-- Data imports
import Data.Maybe (Maybe)
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

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Overlay)

-- |Create a new `Overlay`, see `new Overlay(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Overlay
create o = runFn1 createImpl (FFI.toNullable o)

-- |Create a new `Overlay`, see `new Overlay()` in the OpenLayers API documentation.
create' :: Effect Overlay
create' = runFn1 createImpl FFI.undefined
