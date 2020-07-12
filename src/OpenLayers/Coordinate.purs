-- |
-- | The OpenLayers Coordinate module, a purescript FFI mapping. 
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Coordinate (Coordinate) where

-- |A Coordinate in the Openlayers space.
type Coordinate = Array Number