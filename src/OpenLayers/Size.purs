-- |
-- | The OpenLayers Size module, a purescript FFI mapping. 
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Size (width, height, Size) where

-- Data imports
import Data.Array(index)
import Data.Maybe (Maybe)

-- |A Coordinate in the Openlayers space.
type Size = Array Number

-- |Returns with the x coordinate of the `Coordinate`. This function do not exist in
-- the Openlayers API.
width:: Size -> Maybe Number
width c = index c 0

-- |Returns with the y coordinate of the `Coordinate`. This function do not exist in
-- the Openlayers API.
height:: Size -> Maybe Number
height c = index c 1
