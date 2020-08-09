-- |
-- | The OpenLayers Map module, a purescript FFI mapping. It also
-- | reexports functions based on the `Map` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Map (
  module PluggableMap
  , Map
  , Options(..)
  , Target
  , Controls
  , Layers
  , RawMap
  , Interactions
  , Overlays
  , KBDEventTarget
  , target
  , controls
  , layers
  , interactions
  , overlays
  , keyboardeventtarget

  , create
  , create'
  
  ) where

-- Standard import
import Prelude (($))
import Prim.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Web imports
import Web.DOM (Element)
import Web.DOM.Document (Document)

-- Openlayers
import OpenLayers.FFI as FFI
import OpenLayers.Layer.Base as Base
import OpenLayers.View as View
import OpenLayers.Overlay as Overlay
import OpenLayers.Control.Control as Control
import OpenLayers.Collection as Collection
import OpenLayers.Interaction.Interaction as Interaction
import OpenLayers.PluggableMap (
  PluggableMap
  , addInteraction
  , addLayer
  , addOverlay
  , getView
  , setTarget
  , getSize
  , on
  , un
  , onRenderComplete
  , unRenderComplete
  , clearTarget) as PluggableMap
--
-- Foreign data types
-- 
-- |The FFI version of the Map. For internal use only!
foreign import data RawMap :: Type
type Map = PluggableMap.PluggableMap RawMap

-- |The FFI mapping of the target element in the options structure
foreign import data Target :: Type

-- |The FFI mapping of the controls element in the options structure
foreign import data Controls :: Type

-- |The FFI mapping of the controls element in the options structure
foreign import data Layers :: Type

-- |The FFI mapping of the interactions element in the options structure
foreign import data Interactions :: Type

-- |The FFI mapping of the overlays element in the options structure
foreign import data Overlays :: Type

-- |The FFI mapping of the kbdeventtarget element in the options structure
foreign import data KBDEventTarget :: Type

-- |The options for the creation of the Map. See the `options` parameter in `new Map(options)` in the OpenLayers API documentation.
type Options r = (target::Target
                  , controls::Controls
                  , layers::Layers
                  , view::View.View
                  , pixelRatio::Number
                  , interactions::Interactions
                  , keyboardEventTarget::KBDEventTarget
                  , maxTilesLoading::Int
                  , moveTolerance::Int
                  , overlays::Overlays)

-- |Constructors for the target element in `Options`
target::{asId::String->Target, asElement::Element->Target}
target = {asId:unsafeCoerce, asElement:unsafeCoerce}

-- |Constructors for the keyboardeventtarget element in `Options`
keyboardeventtarget::{asId::String->Target, asElement::Element->Target, asDocument::Document->Target}
keyboardeventtarget = {asId:unsafeCoerce, asElement:unsafeCoerce, asDocument:unsafeCoerce}

-- |Constructors for the controls element in `Options`
controls::{asCollection::Collection.Collection Control.Control->Controls, asArray::Array Control.Control->Controls}
controls = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

-- |Constructors for the layers element in `Options`
layers::forall r . {asCollection::Collection.Collection (Base.BaseLayer r)->Layers, asArray::Array (Base.BaseLayer r)->Layers}
layers = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

-- |Constructors for the interactions element in `Options`
interactions::forall r . {asCollection::Collection.Collection (Interaction.Interaction r)->Interactions
                        , asArray::Array (Interaction.Interaction r)->Interactions}
interactions = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

-- |Constructors for the overlays element in `Options`
overlays::{asCollection::Collection.Collection Overlay.Overlay->Overlays
          , asArray::Array Overlay.Overlay->Overlays}
overlays = {asCollection:unsafeCoerce, asArray:unsafeCoerce}

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect Map)

-- |Creates a `Map`, see `new Map(options)` in the OpenLayers API documentation.
create :: forall l r layer . Union l r (Options layer) => Record l -> Effect Map
create o = runFn1 createImpl $ FFI.notNullOrUndefined o

-- |Creates a `Map`, see `new Map(options)` in the OpenLayers API documentation.
create' :: Effect Map
create' = runFn1 createImpl FFI.undefined
