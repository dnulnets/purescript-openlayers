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
  module XYZ

  , OSM
  , RawOSM
  , OSMOptions (..)
  , create
  , create') where

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Standard imports
import Prim.Row (class Union)

-- Effect imports
import Effect (Effect)

-- Import own stuff
import OpenLayers.FFI as FFI
import OpenLayers.Source.XYZ (BaseObject, RawSource, RawTileImage, RawTileSource
                            , RawUrlTile, RawXYZ, Source, TileImage, TileSource, UrlTile, XYZ, get) as XYZ

--
-- Foreign data types
-- 
foreign import data RawOSM :: Type
type OSM = XYZ.XYZ RawOSM

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect OSM)

-- |The options for the creation of the OSM. See the `options` parameter in `new OSM(options)` in the OpenLayers API documentation.
type OSMOptions = ()

-- |Creates an open street map source, see `new OSM(r)` in the OpenLayers
-- |API documentation.
create :: forall l r . Union l r OSMOptions => Record l -> Effect OSM
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates an open street map source with defaults, see `new OSM()` in
-- |the OpenLayers API documentation.
create' :: Effect OSM
create' = runFn1 createImpl FFI.undefined
