-- |
-- | The OpenLayers Stroke module, a purescript FFI mapping. It also
-- | reexports functions based on the `Stroke` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Stroke (
  Stroke
  , Options(..)
  , Color
  , color

  , create
  , create') where

-- Standard imports
import Prim.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)

-- Data imports
import Data.Function.Uncurried (Fn1, runFn1)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data Stroke :: Type

-- |The FFI mapping of the color element in the options structure
foreign import data Color :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Stroke)

-- |The options for the creation of the Stroke. See the `options` parameter in `new Stroke(options)` in the OpenLayers API documentation.
type Options = (color :: Color, width :: Int)

-- |Constructors for the color element in `Options`
color::{asString::String->Color, asArray::Array Int->Color}
color = {asString:unsafeCoerce, asArray:unsafeCoerce}

-- |Creates a `Stroke`, see `new Stroke(r)` in the OpenLayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect Stroke
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Stroke`, see `new Stroke()` in the Openlayers API documentation.
create' :: Effect Stroke
create' = runFn1 createImpl FFI.undefined
