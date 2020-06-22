-- |
-- | The OpenLayers Stroke module, a purescript FFI mapping. It also
-- | reexports functions based on the `Stroke` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Stroke (
  Stroke
  , create
  , create') where

-- Data imports
import Data.Maybe (Maybe)
import Data.Function.Uncurried (Fn1, runFn1)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data Stroke :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Stroke)

-- |Creates a `Stroke`, see `new Stroke(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Stroke
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Stroke`, see `new Stroke()` in the Openlayers API documentation.
create' :: Effect Stroke
create' = runFn1 createImpl FFI.undefined
