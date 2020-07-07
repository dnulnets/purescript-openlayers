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
  , create'
  , TileOptions(..)) where

-- Standard imports
import Prim.Row (class Union)

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Import own modules
import OpenLayers.Layer.BaseTile as BaseTile
import OpenLayers.Source.Tile as Tile
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data RawTile :: Type
type Tile = BaseTile.BaseTileLayer RawTile

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Tile)

-- |The options for the creation of the Tile. See the `options` parameter in `new Tile(options)` in the OpenLayers API documentation.
type TileOptions s = (source :: Tile.TileSource s)

-- |Creates a `Tile`, see `new Tile(r)` in the OpenLayers API documentation.
create :: forall l r s. Union l r (TileOptions s) => Record l -> Effect Tile
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Tile` with defaults, see `new Tile()`  in the OpenLayers API documentation
create' :: Effect Tile
create' = runFn1 createImpl FFI.undefined
