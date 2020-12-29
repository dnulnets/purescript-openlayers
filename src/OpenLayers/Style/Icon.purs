-- |
-- | The OpenLayers Icon module, a purescript FFI mapping. 
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Icon (

    Icon
  , RawIconStyle
  , Options(..)
  , create
  , create'
  ) where

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Standard import
import Prim.Row (class Union)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Style.Fill as Fill
import OpenLayers.Style.Image (ImageStyle) as Image
import OpenLayers.Style.Stroke as Stroke

--
-- Foreign data types
-- 
foreign import data RawIconStyle :: Type
type Icon = Image.ImageStyle RawIconStyle

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Icon)

-- |The options for the creation of the Icon. See the `options` parameter in `new Icon(options)` in the OpenLayers API documentation.
type Options = (anchor :: Array Number
  , anchorXUnits :: String
  , anchorYUnits :: String
  , size :: Array Int
  , offset :: Array Int
  , opacity :: Number 
  , scale :: Number
  , fill :: Fill.Fill
  , stroke :: Stroke.Stroke
  , src :: String)

-- |Creates an `Icon`, see `new Icon(r)` in the OpenLayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect Icon
create r = runFn1 createImpl (FFI.notNullOrUndefined r)

-- |Creates an `Icon` with defaults, see `new Icon()` in the OpenLayers API documentation.
create' :: Effect Icon
create' = runFn1 createImpl FFI.undefined
