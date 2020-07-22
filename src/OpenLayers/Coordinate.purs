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
module OpenLayers.Coordinate (Coordinate, latitude, longitude) where

-- Standard imports
import Data.Array(index)
import Data.Maybe (Maybe)

-- |A Coordinate in the Openlayers space.
type Coordinate = Array Number

latitude :: Coordinate -> Maybe Number
latitude c = index c 1

longitude :: Coordinate -> Maybe Number
longitude c = index c 0