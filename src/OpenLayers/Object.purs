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

    , ObjectEvent
    , RawObjectEvent) where

-- Standard import
import Prelude
import Foreign

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe(..))
import Data.Function.Uncurried
  ( Fn1
  , Fn2

  , runFn1
  , runFn2)

-- Effect imports
import Effect (Effect)

-- Our own imports
import OpenLayers.Observable (Observable) as Observable
import OpenLayers.Events.Event(BaseEvent) as Event

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

-- TODO: This is a really ugly version of a get, no type safety :-(
-- Really, really, really need to fix this!!!!
foreign import getImpl :: forall a . Fn2 String (BaseObject a) (Effect Foreign)

-- |Take care, this has no type safety because of the `forall v` and
-- |I use `unsafeFromForeign`. It will be reworked.
get :: forall o v . String -> BaseObject o -> Effect (Maybe v)
get n self = do
    f <- runFn2 getImpl n self
    case isNull f || isUndefined f of
        true ->
            pure Nothing
        false ->
            pure $ Just $ unsafeFromForeign f
