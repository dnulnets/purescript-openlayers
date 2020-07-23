-- |
-- | The OpenLayers Select module, a purescript FFI mapping. It also
-- | reexports functions based on the `Select` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Interaction.Select
  ( module Interaction
    , module Event
    , module Observable

    -- SelectEvent
    , SelectEvent
    , RawSelectEvent
    , getSelected
    , getDeselected

    -- Select
    , Select
    , RawSelect
    , create
    , create'
    , Options(..)
    , LayerFilterFunction
    , Layers
    , layers
    , getFeatures
    , onSelect
    , unSelect ) where

-- Standard import
import Prelude
import Prim.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)

-- Data imports
import Data.Function.Uncurried (
  Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- own imports
import OpenLayers.FFI as FFI
import OpenLayers.Feature as Feature
import OpenLayers.Interaction.Interaction (Interaction) as Interaction
import OpenLayers.Events (EventsKey, ListenerFunction) as Events
import OpenLayers.Events.Event (BaseEvent) as Event
import OpenLayers.Events.Condition as Condition
import OpenLayers.Observable (on, un) as Observable
import OpenLayers.Collection as Collection
import OpenLayers.Layer.Layer as Layer

--
-- Foreign data types
-- 
foreign import data RawSelect :: Type
type Select = Interaction.Interaction RawSelect

foreign import data RawSelectEvent :: Type
type SelectEvent = Event.BaseEvent RawSelectEvent

--
-- Function mapping SelectEvent
--
foreign import getSelected :: SelectEvent->Effect (Array Feature.Feature)
foreign import getDeselected :: SelectEvent->Effect (Array Feature.Feature)

--
-- Function mapping Select
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined  (Record r)) (Effect Select)

-- |The FFI mapping of the layers element in `Options`.
foreign import data Layers :: Type

-- |The filter function that can be used in the layer element in `Options`.
type LayerFilterFunction l = Layer.Layer l -> Effect Boolean

-- |The options for the creation of the Select. See the `options` parameter in `new Select(options)` in the OpenLayers API documentation.
type Options = (multi::Boolean, 
  layers:: Layers
  , condition:: Condition.Condition
  , toggleCondition:: Condition.Condition)

-- |Constructors for the layers element in `Options`.
layers::forall l . {asArray::Array (Layer.Layer l)->Layers, asFunction::LayerFilterFunction l->Layers}
layers = {asArray:unsafeCoerce, asFunction:unsafeCoerce}

-- |Creates a `Select` object, see `new Select` in the OpenLayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect Select
create opts = runFn1 createImpl (FFI.notNullOrUndefined opts)

-- |Creates a `Select` object with defaults, see `new Select` in the OpenLayers API documentation.
create' :: Effect Select
create' = runFn1 createImpl FFI.undefined

--
-- getters
--
foreign import getFeaturesImpl :: Fn1 Select (Effect (Collection.Collection Feature.Feature))

getFeatures::Select->Effect (Collection.Collection Feature.Feature)
getFeatures self = runFn1 getFeaturesImpl self

--
-- All on functions

-- |Registers a listener function for the select event, see `on` for the Select object
-- |in the OpenLayers API documentation.
onSelect :: Events.ListenerFunction SelectEvent -> Select -> Effect Events.EventsKey
onSelect = Observable.on "select"

--
-- All un functions
--

-- |Unregisters a listener function for the select event, see `un` for the Select object
-- |in the Openlayers API documentation.
unSelect :: Events.EventsKey -> Select -> Effect Unit
unSelect key self = Observable.un "select" key self
