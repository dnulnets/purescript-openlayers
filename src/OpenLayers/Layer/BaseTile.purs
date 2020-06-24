-- |
-- | The OpenLayers BaseTile module,, a purescript FFI mapping. It also
-- | reexports functions based on the `BaseTile` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Layer.BaseTile (
        module Layer

        , BaseTileLayer
        , RawBaseTileLayer ) where

-- Own imports
import OpenLayers.Layer.Layer (Base, Layer, RawBase, RawLayer, setSource) as Layer

--
-- Foreign data types
-- 
foreign import data RawBaseTileLayer :: Type -> Type

-- |The actual abstract basetype for geometry
type BaseTileLayer a = Layer.Layer (RawBaseTileLayer a)

--
-- Function mapping
--
