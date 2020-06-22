-- |
-- | The OpenLayers Observable module, a purescript FFI mapping. It also
-- | reexports functions based on the `Observable` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Observable (
    module Target
    , Observable
    , RawObservable
    
    , on
    , un
    , once) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
    , Fn3
    , runFn1
    , runFn3)

-- Effect imports
import Effect (Effect)

-- Import our own stuff
import OpenLayers.Events.Target (Target) as Target
import OpenLayers.Events.Event as Event
import OpenLayers.Events as Events

--
-- Foreign data types
-- 
foreign import data RawObservable :: Type -> Type
type Observable a = Target.Target (RawObservable a)

foreign import onImpl :: forall e o . Fn3 String (Events.ListenerFunction (Event.BaseEvent e)) (Observable o) (Effect Events.EventsKey)

on::forall e o . String->Events.ListenerFunction (Event.BaseEvent e)->Observable o->Effect Events.EventsKey
on s ef o = runFn3 onImpl s ef o

foreign import onceImpl :: forall e o . Fn3 String (Events.ListenerFunction (Event.BaseEvent e)) (Observable o) (Effect Events.EventsKey)

once::forall e o . String->Events.ListenerFunction (Event.BaseEvent e)->Observable o->Effect Events.EventsKey
once s ef o = runFn3 onceImpl s ef o

foreign import unImpl :: forall o . Fn3 String Events.EventsKey (Observable o) (Effect Unit)

un::forall o . String->Events.EventsKey->Observable o->Effect Unit
un s ef o = runFn3 unImpl s ef o

