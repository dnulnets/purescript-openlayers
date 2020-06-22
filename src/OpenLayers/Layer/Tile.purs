-- |
-- | The OpenLayers Tile module,, a purescript FFI mapping. It also
-- | reexports functions based on the `Tile` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Layer.Tile (
  Tile
  , RawTile

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

-- Import own modules
import OpenLayers.Layer.BaseTile as BaseTile
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data RawTile :: Type
type Tile = BaseTile.BaseTileLayer RawTile

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Tile)

-- |Creates a `Tile`, see `new Tile(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Tile
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Tile` with defaults, see `new Tile()`  in the OpenLayers API documentation
create' :: Effect Tile
create' = runFn1 createImpl FFI.undefined
