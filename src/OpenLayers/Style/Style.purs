-- |
-- | The OpenLayers Style module, a purescript FFI mapping. It also
-- | reexports functions based on the `Style` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Style (
  Style
  , StyleOptions
  , setText
  , create
  , create') where

-- Standard import
import Prelude
import Prim.Row (class Union)

-- Data imports
import Data.Nullable (Nullable, toNullable)
import Data.Maybe (Maybe)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Style.Text as Text
import OpenLayers.Style.Image as Image

--
-- Foreign data types
-- 
foreign import data Style :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Style)

-- |The options for the creation of the Style. See the `options` parameter in `new Style(options)` in the OpenLayers API documentation.
type StyleOptions s = (image :: Image.ImageStyle s)

-- |Creates a `Style`, see `new Style(r)` in the OpenLayers API documentation.
create :: forall l r s . Union l r (StyleOptions s) => Record l -> Effect Style
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Style` with defaults, see `new Style()` in the OpenLayers API documentation.
create' :: Effect Style
create' = runFn1 createImpl FFI.undefined

--
-- Setters
--
foreign import setTextImpl :: Fn2 (Nullable Text.Text) (Style) (Effect Unit)
setText :: Maybe Text.Text -> Style -> Effect Unit
setText t self = runFn2 setTextImpl (toNullable t) self
