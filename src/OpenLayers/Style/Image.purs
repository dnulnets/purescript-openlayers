-- |
-- | The OpenLayers Image module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.Image (
    ImageStyle
    , RawImageStyle) where

--
-- Foreign data types
-- 
foreign import data RawImageStyle :: Type -> Type

-- |The actual abstract basetype for geometry
type ImageStyle a = RawImageStyle a

--
-- Function mapping
--
