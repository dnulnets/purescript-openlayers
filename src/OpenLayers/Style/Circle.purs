-- |
-- | The OpenLayers Circle module, a purescript FFI mapping. It also
-- | reexports functions based on the `Circle` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Circle (
  Circle
  , create
  , create'
  ) where

-- Data imports
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
foreign import data Circle :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Circle)

-- |Creates a `Circle`, see `new Circle(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Circle
create r = runFn1 createImpl (FFI.toNullable r)

-- |Creates a `Circle` with defaults, see `new Circle()` in the OpenLayers API documentation.
create' :: Effect Circle
create' = runFn1 createImpl FFI.undefined
