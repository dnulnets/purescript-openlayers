-- |
-- | The OpenLayers Openstreetmap API module,, a purescript FFI mapping. It also
-- | reexports functions based on the `OSM` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.OSM (
  OSM
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

-- Import own stuff
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data OSM :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect OSM)

-- |Creates an open street map source, see `new OSM(r)` in the OpenLayers
-- |API documentation.
create :: forall r . Maybe {|r} -> Effect OSM
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates an open street map source with defaults, see `new OSM()` in
-- |the OpenLayers API documentation.
create' :: Effect OSM
create' = runFn1 createImpl FFI.undefined
