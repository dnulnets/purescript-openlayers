-- |
-- | The OpenLayers RegularShape module, a purescript FFI mapping. It also
-- | reexports functions based on the `Source` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Style.RegularShape (
    module Image,

    RegularShape
    , RawRegularShape) where

-- Own imports
import OpenLayers.Style.Image (ImageStyle, RawImageStyle) as Image
--
-- Foreign data types
-- 
foreign import data RawRegularShape :: Type -> Type

-- |The actual abstract basetype for geometry
type RegularShape a = Image.ImageStyle (RawRegularShape a)

--
-- Function mapping
--
