-- |
-- | The OpenLayers Projection module, a purescript FFI mapping.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Proj (
  SRS
  
  , epsg_3857
  , epsg_4326

  , fromLonLat
  , fromLonLat'
  , toLonLat
  , toLonLat' ) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toNullable)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn2
  , runFn2)

-- Our own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 

--
-- Own datatypes
--

-- |The SRS type, can be either EPSG:3857 or EPSG:4326
newtype SRS = SRS String

-- |The EPSG:3857 projection
foreign import epsg_3857::SRS

-- |The EPSG:4326 projection
foreign import epsg_4326::SRS

--
-- Function mapping
--
foreign import fromLonLatImpl :: Fn2 (Array Number) (FFI.NullableOrUndefined SRS) (Array Number)

fromLonLat :: Array Number->Maybe SRS-> Array Number
fromLonLat c s = runFn2 fromLonLatImpl c $ FFI.toNullable s

-- |Same as `fromLonLat` but uses the default SRS, see the OpenLayers API documentation.
fromLonLat' :: Array Number -> Array Number
fromLonLat' c = runFn2 fromLonLatImpl c FFI.undefined

foreign import toLonLatImpl :: Fn2 (Array Number) (FFI.NullableOrUndefined SRS) (Array Number)

toLonLat :: Array Number->Maybe SRS-> Array Number
toLonLat c s = runFn2 toLonLatImpl c $ FFI.toNullable s

-- |Same as `toLonLat` but uses the default SRS, see the OpenLayers API documentation.
toLonLat' :: Array Number->Array Number
toLonLat' c = runFn2 toLonLatImpl c FFI.undefined
