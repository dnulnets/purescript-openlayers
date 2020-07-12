-- | The OpenLayers Point module, a purescript FFI mapping. It also
-- | reexports functions based on the `Point` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Geom.Point (
  Point
  , RawPoint 
  
  , create
  , create' ) where

-- Data imports
import Data.Maybe (Maybe)
import Data.Function.Uncurried (
  Fn2
  , runFn2)

-- Effect imports
import Effect (Effect)

-- Our own imports
import OpenLayers.FFI as FFI
import OpenLayers.Geom.SimpleGeometry as SimpleGeometry
import OpenLayers.Geom.GeometryLayout as GeometryLayout
import OpenLayers.Coordinate as Coordinate

--
-- Foreign data types
-- 
foreign import data RawPoint :: Type
type Point = SimpleGeometry.SimpleGeometry RawPoint

--
-- Function mapping
--
foreign import createImpl::Fn2 (Array Number) (FFI.NullableOrUndefined GeometryLayout.GeometryLayout) (Effect Point)

-- |Creates a new Point, see `new Point` in OpenLayers API documentation.
create::Coordinate.Coordinate->Maybe GeometryLayout.GeometryLayout->Effect Point
create c e = runFn2 createImpl c (FFI.toNullable e)

-- |Creates a new Point, but uses the default geometry layout, see `new Point` in OpenLayers API documentation.
create'::Coordinate.Coordinate->Effect Point
create' c = runFn2 createImpl c FFI.undefined
