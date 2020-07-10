-- |
-- | The OpenLayers Source module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.Source (
  module Object

  , Source
  , RawSource ) where

-- Our own imports
import OpenLayers.Object (BaseEvent, BaseObject, ObjectEvent, Observable, RawBaseEvent
  , RawBaseObject, RawObjectEvent, RawObservable, Target, get, on, once, un) as Object

--
-- Foreign data types
-- 
foreign import data RawSource :: Type -> Type

-- |The actual abstract basetype for geometry
type Source a = Object.BaseObject (RawSource a)

--
-- Function mapping
--
