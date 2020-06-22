-- | The OpenLayers Geometry module, a purescript FFI mapping. It also
-- | reexports functions based on the `Geometry` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geom.Geometry ( Geometry, RawGeometry ) where

--
-- Foreign data types
-- 
foreign import data RawGeometry :: Type -> Type
type Geometry a = RawGeometry a

--
-- Function mapping
--
