-- |
-- | The OpenLayers Fill module, a purescript FFI mapping. It also
-- | reexports functions based on the `Fill` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Fill (
  Fill
  , create
  , create'
  ) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data Fill :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Fill)

-- |Creates a `Fill`, see `new Fill(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Fill
create r = runFn1 createImpl (FFI.toNullable r)

-- |Creates a `Fill` with defaults, see `new Fill()` in the OpenLayers API documentation.
create' :: Effect Fill
create' = runFn1 createImpl FFI.undefined
