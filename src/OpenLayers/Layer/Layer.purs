-- |
-- | The OpenLayers Layer module, a purescript FFI mapping. It also
-- | reexports functions based on the `Layer` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Layer.Layer (
  Layer
  , RawLayer ) where

-- Our own imports
import OpenLayers.Layer.Base as Base

--
-- Foreign data types
-- 
foreign import data RawLayer :: Type -> Type

-- |The actual abstract basetype for geometry
type Layer a = Base.Base (RawLayer a)

--
-- Function mapping
--
