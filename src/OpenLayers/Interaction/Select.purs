-- |
-- | The OpenLayers Intersecto Select module
-- |
-- | Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
-- |
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
    , onSelect
    , unSelect ) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toNullable)
import Data.Maybe (Maybe)
import Data.Function.Uncurried (
  Fn1
  , Fn3
  , runFn1
  , runFn3)

-- Effect imports
import Effect (Effect)

-- own imports
import OpenLayers.FFI as FFI
import OpenLayers.Feature as Feature
import OpenLayers.Interaction.Interaction (Interaction) as Interaction
import OpenLayers.Events (EventsKey, ListenerFunction) as Events
import OpenLayers.Events.Event (BaseEvent) as Event
import OpenLayers.Observable (on, un) as Observable

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
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined  {|r}) (Effect Select)

create :: forall r . Maybe {|r} -> Effect Select
create opts = runFn1 createImpl (FFI.toNullable opts)

create' :: Effect Select
create' = runFn1 createImpl FFI.undefined

--
-- All on functions

onSelect :: Events.ListenerFunction SelectEvent -> Select -> Effect Events.EventsKey
onSelect = Observable.on "select"

--
-- All un functions
--

unSelect :: Events.EventsKey -> Select -> Effect Unit
unSelect key self = Observable.un "select" key self
