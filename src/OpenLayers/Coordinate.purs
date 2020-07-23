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
module OpenLayers.Coordinate (
    Coordinate
    , toStringHDMS
    , toStringHDMS'
    , x
    , y
    , latitude
    , longitude) where

-- Standard imports
import Prelude

-- Data imports
import Data.Array(index)
import Data.Maybe (Maybe)
import Data.Function.Uncurried (Fn2, runFn2)

-- Openlayers input
import OpenLayers.FFI as FFI

-- |A Coordinate in the Openlayers space.
type Coordinate = Array Number


foreign import toStringHDMSImpl :: Fn2 Coordinate (FFI.NullableOrUndefined Int) String

toStringHDMS::Coordinate->Int->String
toStringHDMS c i = runFn2 toStringHDMSImpl c $ FFI.notNullOrUndefined i

toStringHDMS'::Coordinate->String
toStringHDMS' c = runFn2 toStringHDMSImpl c FFI.undefined

-- |Returns with the x coordinate of the `Coordinate`. This function do not exist in
-- the Openlayers API.
x:: Coordinate -> Maybe Number
x c = index c 0

-- |Returns with the y coordinate of the `Coordinate`. This function do not exist in
-- the Openlayers API.
y:: Coordinate -> Maybe Number
y c = index c 1

-- |Returns with the latitude of the `Coordinate`. This function do not exist in
-- the Openlayers API.
latitude :: Coordinate -> Maybe Number
latitude c = index c 1

-- |Returns with the longitude coordinate of the `Coordinate`. This function do not exist in
-- the Openlayers API.
longitude :: Coordinate -> Maybe Number
longitude c = index c 0
