-- | The OpenLayers Object module, a purescript FFI mapping. It also
-- | reexports functions based on the `Object` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Object (
    module Observable
    , module Event

    , BaseObject
    , RawBaseObject    
    , get
    , set
    , set'

    , ObjectEvent
    , RawObjectEvent) where

-- Standard import
import Prelude
import Foreign (Foreign, isNull, isUndefined, unsafeFromForeign, unsafeToForeign)

-- Data imports
import Data.Nullable (Nullable, toNullable)
import Data.Maybe (Maybe(..))
import Data.Function.Uncurried (
    Fn2
    , Fn4

    , runFn2
    , runFn4)

-- Effect imports
import Effect (Effect)

-- Our own imports
import OpenLayers.FFI as FFI
import OpenLayers.Observable (Observable, RawObservable, Target, on, once, un) as Observable
import OpenLayers.Events.Event (BaseEvent, RawBaseEvent) as Event

--
-- Foreign data types
-- 
foreign import data RawBaseObject :: Type -> Type
type BaseObject a = Observable.Observable (RawBaseObject a)

foreign import data RawObjectEvent :: Type -> Type
type ObjectEvent a = Event.BaseEvent a

--
-- Functions
--

foreign import getImpl :: forall a . Fn2 String (BaseObject a) Foreign

-- |Take care, this has no type safety of objects stored on the javascript
-- side and gets transferred to the purescript side. It uses `unsafeFromForeign` to
-- do the conversion.
get :: forall o v . String -> BaseObject o -> Maybe v
get n self = do
    case isNull f || isUndefined f of
        true ->
            Nothing
        false ->
            Just $ unsafeFromForeign f
    where
        f = runFn2 getImpl n self

foreign import setImpl :: forall a . Fn4 String (Nullable Foreign) (FFI.NullableOrUndefined Boolean) (BaseObject a) (Effect Unit)

set :: forall o v . String -> Maybe v -> Boolean -> BaseObject o -> Effect Unit
set n v b self = runFn4 setImpl n (toNullable (unsafeToForeign <$> v)) (FFI.notNullOrUndefined b) self

-- |Sets a value to a parameter but uses the default value for event generation, see
-- `set` in the OpenLayers API documentation.
set' :: forall o v . String -> Maybe v -> BaseObject o -> Effect Unit
set' n v self = runFn4 setImpl n (toNullable (unsafeToForeign <$> v)) FFI.undefined self
