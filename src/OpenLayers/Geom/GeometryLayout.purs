-- | The OpenLayers GeometryLayout module, a purescript FFI mapping. It also
-- | reexports functions based on the `GeometryLayout` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geom.GeometryLayout (
    GeometryLayout
    , xy
    , xyz
    , xym
    , xyzm ) where

--
-- Type definitions for gemoetry layout
--
newtype GeometryLayout = GeometryLayout String

--
-- Constants
--

-- |The XY coordinate layout
foreign import xy::GeometryLayout
-- |The XYX coordinate layout
foreign import xyz::GeometryLayout
-- |The XYM coordinate layout
foreign import xym::GeometryLayout
-- |The XYXM coordinate layout
foreign import xyzm::GeometryLayout
