-- |
-- | The OpenLayers Geolocation module, a purescript FFI mapping. It also
-- | reexports functions based on the `Geolocation` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geolocation (
    module Object
    , module Observable

    , Geolocation
    , RawGeolocation
    , create
    , create'

    , setTracking
    
    , getAccuracyGeometry
    , getPosition

    , onChangeAccuracyGeometry
    , onChangePosition
    , onError

    , onceChangePosition

    , unChangeAccuracyGeometry
    , unChangePosition
    , unError
    ) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , Fn2
  , Fn3
  , runFn1
  , runFn2
  , runFn3)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Geom.Polygon as Polygon
import OpenLayers.Object(BaseObject, ObjectEvent) as Object
import OpenLayers.Observable (on, un, once) as Observable
import OpenLayers.Events (EventsKey, ListenerFunction) as Events
import OpenLayers.Events.Event (BaseEvent) as Event

--
-- Foreign data types
-- 
foreign import data RawGeolocation :: Type
type Geolocation = Object.BaseObject RawGeolocation

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect Geolocation)

-- |Creates a `Geolocation`, see `new GeoLocation(r)` in the OpenLayers API documentation.
create :: forall r . (Maybe {|r}) -> Effect Geolocation
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Geolocation` with defaults, see `new Geolocation()` in the OpenLayers API documentation.
create' :: Effect Geolocation
create' = runFn1 createImpl FFI.undefined

--
-- Setters
--
foreign import setTrackingImpl :: Fn2 Boolean Geolocation (Effect Unit)
setTracking::Boolean->Geolocation->Effect Unit
setTracking onoff g = runFn2 setTrackingImpl onoff g

--
-- Getters
--
foreign import getAccuracyGeometryImpl :: Fn1 Geolocation (Effect Polygon.Polygon)
getAccuracyGeometry :: Geolocation -> Effect Polygon.Polygon
getAccuracyGeometry self = runFn1 getAccuracyGeometryImpl self

foreign import getPositionImpl :: Fn1 Geolocation (Effect (FFI.NullableOrUndefined (Array Number)))
getPosition :: Geolocation -> Effect (Maybe (Array Number))
getPosition self = FFI.toMaybe <$> runFn1 getPositionImpl self

foreign import getAltitudeImpl :: Fn1 Geolocation (Effect (FFI.NullableOrUndefined Number))
getAltitude :: Geolocation -> Effect (Maybe Number)
getAltitude self = FFI.toMaybe <$> runFn1 getAltitudeImpl self

foreign import getAltitudeAccuracyImpl :: Fn1 Geolocation (Effect (FFI.NullableOrUndefined Number))
getAltitudeAccuracy :: Geolocation -> Effect (Maybe Number)
getAltitudeAccuracy self = FFI.toMaybe <$> runFn1 getAltitudeAccuracyImpl self

foreign import getAccuracyImpl :: Fn1 Geolocation (Effect (FFI.NullableOrUndefined Number))
getAccuracy :: Geolocation -> Effect (Maybe Number)
getAccuracy self = FFI.toMaybe <$> runFn1 getAccuracyImpl self

--
-- Event handlers setup
--
--
-- All on_ functions
--

-- |Register an event handler for the error type, see `on` for `Geolocation` in the OpenLayers API documentation.
onError :: forall e . Events.ListenerFunction (Event.BaseEvent e) -> Geolocation -> Effect Events.EventsKey
onError fn self = Observable.on "error" fn self

-- |Register an event handler for the change:accuracyGeometry type, see `on` for `Geolocation` in the OpenLayers API documentation.
onChangeAccuracyGeometry :: forall e . Events.ListenerFunction (Object.ObjectEvent e) -> Geolocation -> Effect Events.EventsKey
onChangeAccuracyGeometry fn self = Observable.on "change:accuracyGeometry" fn self

-- |Register an event handler for the change:position type, see `on` for `Geolocation` in the OpenLayers API documentation.
onChangePosition :: forall e . Events.ListenerFunction (Object.ObjectEvent e) -> Geolocation -> Effect Events.EventsKey
onChangePosition fn self = Observable.on "change:position" fn self

-- |Register an event handler for single action on the change:position type, see `once` for `Geolocation` in the OpenLayers API documentation.
onceChangePosition :: forall e . Events.ListenerFunction (Object.ObjectEvent e) -> Geolocation -> Effect Events.EventsKey
onceChangePosition fn self = Observable.once "change:position" fn self
--
-- All un_ functions
--
--foreign import unImpl :: Fn3 String Key Geolocation (Effect Unit)

-- |Unregisters an event handler for the error type, see `un` for `Geolocation` in the OpenLayers API documentation.
unError :: Events.EventsKey -> Geolocation -> Effect Unit
unError key self = Observable.un "error" key self

-- |Unregisters an event handler for the change:accuracyGeometry type, see `un` for `Geolocation` in the OpenLayers API documentation.
unChangeAccuracyGeometry :: Events.EventsKey -> Geolocation -> Effect Unit
unChangeAccuracyGeometry key self = Observable.un "change:accuracyGeometry" key self

-- |Unregisters an event handler for the change:position type, see `un` for `Geolocation` in the OpenLayers API documentation.
unChangePosition :: Events.EventsKey -> Geolocation -> Effect Unit
unChangePosition key self = Observable.un "change:position" key self
