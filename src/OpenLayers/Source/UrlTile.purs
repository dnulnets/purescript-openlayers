-- |
-- | The OpenLayers UrlTile module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.UrlTile (
  module Tile

  , UrlTile
  , RawUrlTile) where

-- Our own imports
import OpenLayers.Source.Tile (BaseObject, RawSource, RawTileSource, Source, TileSource, get) as Tile

--
-- Foreign data types
-- 
foreign import data RawUrlTile :: Type -> Type

type UrlTile a = Tile.TileSource (RawUrlTile a)

--
-- Function mapping
--
