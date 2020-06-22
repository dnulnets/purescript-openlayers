-- |
-- | The OpenLayers Text module, a purescript FFI mapping. It also
-- | reexports functions based on the `Text` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Text (
  Text
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

-- own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data Text :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Text)

-- |Creates a `Text`, see `new text(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Text
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Text` with defaults, see `new Text()` in the OpenLayers API documentation.
create' :: Effect Text
create' = runFn1 createImpl FFI.undefined
