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
  , setText
  , create
  , create') where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe, toNullable)
import Data.Maybe (Maybe)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Style.Text as Text

--
-- Foreign data types
-- 
foreign import data Style :: Type

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Style)

-- |Creates a `Style`, see `new Style(r)` in the OpenLayers API documentation.
create :: forall r . Maybe {|r} -> Effect Style
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Style` with defaults, see `new Style()` in the OpenLayers API documentation.
create' :: Effect Style
create' = runFn1 createImpl FFI.undefined

--
-- Setters
--
foreign import setTextImpl :: Fn2 (Nullable Text.Text) (Style) (Effect Unit)
setText :: Maybe Text.Text -> Style -> Effect Unit
setText t self = runFn2 setTextImpl (toNullable t) self
