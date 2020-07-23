-- |
-- | The OpenLayers Circle module, a purescript FFI mapping. It also
-- | reexports functions based on the `Circle` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Circle (
  module RegularShape

  , CircleStyle
  , RawCircleStyle
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
import OpenLayers.Style.Stroke as Stroke
import OpenLayers.Style.RegularShape (ImageStyle, RawImageStyle, RawRegularShape, RegularShape) as RegularShape

--
-- Foreign data types
-- 
foreign import data RawCircleStyle :: Type
type CircleStyle = RegularShape.RegularShape RawCircleStyle
--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect CircleStyle)

-- |The options for the creation of the CircleStyle. See the `options` parameter in `new CircleStyle(options)` in the OpenLayers API documentation.
type Options = (radius :: Number
  , fill :: Fill.Fill
  , stroke :: Stroke.Stroke
  , displacement :: Array Number)

-- |Creates a `Circle`, see `new Circle(r)` in the OpenLayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect CircleStyle
create r = runFn1 createImpl (FFI.notNullOrUndefined r)

-- |Creates a `Circle` with defaults, see `new Circle()` in the OpenLayers API documentation.
create' :: Effect CircleStyle
create' = runFn1 createImpl FFI.undefined
