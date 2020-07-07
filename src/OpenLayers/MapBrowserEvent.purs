-- | The OpenLayers MapBrowserEvent module, a purescript FFI mapping. It also
-- | reexports functions based on the `MapBrowserEvent` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.MapBrowserEvent (
    module MapEvent

    , MapBrowserEvent
    , RawMapBrowserEvent) where

import OpenLayers.MapEvent (MapEvent) as MapEvent
--
-- Foreign data types
-- 

-- |The FFI version of the MapBrowserEvent. For internal use only!
foreign import data RawMapBrowserEvent :: Type
type MapBrowserEvent = MapEvent.MapEvent RawMapBrowserEvent
