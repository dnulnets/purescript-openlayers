-- |
-- | The OpenLayers TileImage module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.TileImage (
  module UrlTile

  , TileImage
  , RawTileImage) where

-- Our own imports
import OpenLayers.Source.UrlTile (BaseObject, RawSource, RawTileSource, RawUrlTile, Source, TileSource, UrlTile, get) as UrlTile

--
-- Foreign data types
-- 
foreign import data RawTileImage :: Type -> Type

type TileImage a = UrlTile.UrlTile (RawTileImage a)

--
-- Function mapping
--
