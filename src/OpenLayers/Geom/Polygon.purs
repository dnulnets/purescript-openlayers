-- |
-- | The OpenLayers Polygon module, a purescript FFI mapping. It also
-- | reexports functions based on the `Polygon` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geom.Polygon (
  Polygon

  , create
  , create'

  , RawPolygon ) where

-- Data imports
import Data.Maybe (Maybe)
import Data.Function.Uncurried (
  Fn2
  , runFn2)

-- Effect imports
import Effect (Effect)

-- Our own imports
import OpenLayers.Geom.SimpleGeometry as SimpleGeometry
import OpenLayers.Geom.GeometryLayout as GeometryLayout
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data RawPolygon :: Type

-- The Polygon type with an inheritance from Geometry
type Polygon = SimpleGeometry.SimpleGeometry RawPolygon

--
-- Function mapping
--
foreign import createImpl::Fn2 (Array (Array Number)) (FFI.NullableOrUndefined GeometryLayout.GeometryLayout) (Effect Polygon)
-- |Creates a Polygon, see `new Polygon` in OpenLayers API documentation.
create::Array (Array Number)->Maybe GeometryLayout.GeometryLayout->Effect Polygon
create ap l = runFn2 createImpl ap (FFI.toNullable l)

-- |Creates a new Polygon with no default, see `new Polygon` in OpenLayers API documentation.
create'::Array (Array Number)->Effect Polygon
create' ap = runFn2 createImpl ap FFI.undefined
