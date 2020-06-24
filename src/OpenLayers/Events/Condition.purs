-- | The OpenLayers Condition module, a purescript FFI mapping.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Events.Condition (Condition, doubleClick, never) where

-- Data imports
import Data.Function.Uncurried (Fn1, runFn1)

-- Import our own stuff
import OpenLayers.Events as Events
import OpenLayers.Events.Event as Event

--
-- Foreign data types
--
foreign import data Condition :: Type

--
-- Foreign imports
--
foreign import doubleClick::Condition
foreign import never::Condition

--
-- Creates a condition, not part of OpenLayers
--
foreign import createImpl::forall e . Fn1 (Events.ListenerFunction (Event.BaseEvent e)) Condition
create::forall e . Events.ListenerFunction (Event.BaseEvent e)->Condition
create f = runFn1 createImpl f

--foreign import data RawBaseEvent :: Type -> Type
--type BaseEvent a = RawBaseEvent a
