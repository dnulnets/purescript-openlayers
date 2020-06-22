-- |
-- | The OpenLayers SimpleGeometry module, a purescript FFI mapping. It also
-- | reexports functions based on the `SimpleGeometry` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geom.SimpleGeometry ( SimpleGeometry, RawSimpleGeometry ) where

-- Our own imports
import OpenLayers.Geom.Geometry as Geometry

--
-- Foreign data types
-- 
foreign import data RawSimpleGeometry :: Type -> Type

-- |The actual abstract basetype for geometry
type SimpleGeometry a = Geometry.Geometry (RawSimpleGeometry a)

--
-- Function mapping
--
