-- |
-- | The OpenLayers XYZ module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.XYZ (
  module TileImage

  , XYZ
  , RawXYZ) where

-- Our own imports
import OpenLayers.Source.TileImage (BaseEvent, BaseObject, ObjectEvent, Observable
    , RawBaseEvent, RawBaseObject, RawObjectEvent, RawObservable, RawSource, RawTileImage
    , RawTileSource, RawUrlTile, Source, Target, TileImage, TileSource, UrlTile, get, on, once, un) as TileImage

--
-- Foreign data types
-- 
foreign import data RawXYZ :: Type -> Type

-- |The actual abstract basetype for geometry
type XYZ a = TileImage.TileImage (RawXYZ a)

--
-- Function mapping
--
