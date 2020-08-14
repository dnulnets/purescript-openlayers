-- |
-- | The OpenLayers Overlay module, a purescript FFI mapping. It also
-- | reexports functions based on the `Overlay` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Overlay
  ( Overlay
  , AutoPan(..)
  , PanOptions(..)
  , PanIntoViewOptions(..)
  , Options(..)
  , setPosition
  , autoPan
  , create
  , create'
  ) where

-- Standard imports
import Prelude
import Unsafe.Coerce (unsafeCoerce)
import Prim.Row (class Union)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Data.Maybe (Maybe)
import Effect (Effect)
-- Web imports
import Web.DOM (Element)
import OpenLayers.FFI as FFI
import OpenLayers.Easing as Easing
import OpenLayers.Coordinate as Coordinate

--
-- Foreign data types
-- 
foreign import data Overlay :: Type

-- |The FFI mapping of the `autoPan` element in the options structure
foreign import data AutoPan :: Type

-- |PanOption for the creatiuon of the Overlay. See the `options` parameter in `new Overlay(options)` in the OpenLayers API documentation.
type PanOptions
  = ( duration :: Int, easing :: Easing.EasingFunction )

-- |PanIntoViewOption for the creatiuon of the Overlay. See the `options` parameter in `new Overlay(options)` in the OpenLayers API documentation.
type PanIntoViewOptions po
  = { animation :: Record po, margin :: Int }

-- |The options for the creation of the Overlay. See the `options` parameter in `new Overlay(options)` in the OpenLayers API documentation.
type Options po
  = ( element :: Element
    , autoPan :: AutoPan
    , autoPanAnimation :: Record po
    )

-- |Constructors for the autoPan element in `Options`
autoPan :: { asBoolean :: Boolean -> AutoPan, asPanIntoViewOptions :: forall l r. Union l r PanOptions => Record l -> AutoPan }
autoPan = { asBoolean: unsafeCoerce, asPanIntoViewOptions: unsafeCoerce }

--
-- Function mapping
--
foreign import setPositionImpl :: Fn2 (FFI.NullableOrUndefined Coordinate.Coordinate) Overlay (Effect Unit)

setPosition :: Maybe Coordinate.Coordinate -> Overlay -> Effect Unit
setPosition c self = runFn2 setPositionImpl (FFI.toUndefined c) self

foreign import createImpl :: forall r. Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Overlay)

-- |Create a new `Overlay`, see `new Overlay(r)` in the OpenLayers API documentation.
create ::
  forall l r lpo rpo.
  Union l r (Options lpo) =>
  Union lpo rpo PanOptions =>
  Record l -> Effect Overlay
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Overlay`, see `new Overlay(options)` in the OpenLayers API documentation.
create' :: Effect Overlay
create' = runFn1 createImpl FFI.undefined
