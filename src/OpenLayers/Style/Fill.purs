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
  , FillOptions (..)
  , create
  , create'
  ) where

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Standard import
import Prim.Row (class Union)

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
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Fill)

-- |The options for the creation of the Fill. See the `options` parameter in `new Fill(options)` in the OpenLayers API documentation.
type FillOptions = (color :: String)

-- |Creates a `Fill`, see `new Fill(r)` in the OpenLayers API documentation.
create :: forall l r . Union l r FillOptions => Record l -> Effect Fill
create r = runFn1 createImpl (FFI.notNullOrUndefined r)

-- |Creates a `Fill` with defaults, see `new Fill()` in the OpenLayers API documentation.
create' :: Effect Fill
create' = runFn1 createImpl FFI.undefined
