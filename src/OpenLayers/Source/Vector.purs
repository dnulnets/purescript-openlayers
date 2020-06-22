-- |
-- | The OpenLayers Vector module, a purescript FFI mapping. It also
-- | reexports functions based on the `Vector` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.Vector (
  Vector
  , create
  , create') where

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
foreign import data Vector :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Vector)

-- |Creates a `Vector` source, see `new Vector(r)` in the Openlayers API documentation.
create :: forall r . Maybe {|r} -> Effect Vector
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Vector` source with defaults, see `new Vector()` in the OpenLayers API documentation.
create' :: Effect Vector
create' = runFn1 createImpl FFI.undefined
