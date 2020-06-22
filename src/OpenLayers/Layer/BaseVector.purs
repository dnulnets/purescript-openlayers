-- |
-- | The OpenLayers BaseVector module, a purescript FFI mapping. It also
-- | reexports functions based on the `BaseVector` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Layer.BaseVector (
  BaseVectorLayer
  , RawBaseVectorLayer ) where

-- Our own imports
import OpenLayers.Layer.Layer as Layer

--
-- Foreign data types
-- 
foreign import data RawBaseVectorLayer :: Type -> Type

-- |The actual abstract basetype for geometry
type BaseVectorLayer a = Layer.Layer (RawBaseVectorLayer a)

--
-- Function mapping
--
