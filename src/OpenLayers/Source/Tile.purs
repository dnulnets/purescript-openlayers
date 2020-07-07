-- |
-- | The OpenLayers Tile module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.Tile (
  module Source

  , TileSource
  , RawTileSource) where

-- Our own imports
import OpenLayers.Source.Source (BaseObject, RawSource, Source, get) as Source

--
-- Foreign data types
-- 
foreign import data RawTileSource :: Type -> Type

type TileSource a = Source.Source (RawTileSource a)

--
-- Function mapping
--
