-- | The OpenLayers MapEvent module, a purescript FFI mapping. It also
-- | reexports functions based on the `MapEvent` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.MapEvent (
    module Event

    , MapEvent
    , RawMapEvent) where

import OpenLayers.Events.Event (BaseEvent) as Event
--
-- Foreign data types
-- 

-- |The FFI version of the MapEvent. For internal use only!
foreign import data RawMapEvent :: Type -> Type
type MapEvent a = Event.BaseEvent (RawMapEvent a)
