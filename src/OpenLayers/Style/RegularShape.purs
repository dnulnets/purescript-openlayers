-- |
-- | The OpenLayers RegularShape module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.RegularShape (
    module Image

    , Options(..)
    , create
    , create'

    , RegularShape
    , RawRegularShape) where

-- Standard import
import Prelude
import Prim.Row (class Union)

-- Data imports
import Data.Function.Uncurried (Fn1, runFn1)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Style.Image (ImageStyle, RawImageStyle) as Image
import OpenLayers.Style.Fill as Fill
import OpenLayers.Style.Stroke as Stroke

--
-- Foreign data types
-- 
foreign import data RawRegularShape :: Type -> Type

-- |The actual abstract basetype for geometry
type RegularShape a = Image.ImageStyle (RawRegularShape a)

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect (RegularShape Void))

-- |The options for the creation of the Style. See the `options` parameter in `new Style(options)` in the OpenLayers API documentation.
type Options s = (fill :: Fill.Fill
    , stroke :: Stroke.Stroke
    , points::Int
    , radius::Int
    , radius2::Int
    , angle::Number)

-- |Creates a `Style`, see `new Style(r)` in the OpenLayers API documentation.
create :: forall l r s . Union l r (Options s) => Record l -> Effect (RegularShape Void)
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Style` with defaults, see `new Style()` in the OpenLayers API documentation.
create' :: Effect (RegularShape Void)
create' = runFn1 createImpl FFI.undefined
