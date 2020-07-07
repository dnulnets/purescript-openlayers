-- |
-- | The OpenLayers Vector module, a purescript FFI mapping. It also
-- | reexports functions based on the `Vector` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Source.Vector (
  module Source

  , VectorSource
  , RawVectorSource
  , create
  , create') where

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Standard imports
import Prim.Row (class Union)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Source.Source (BaseObject, RawSource, Source, get) as Source
import OpenLayers.Feature as Feature

--
-- Foreign data types
-- 
foreign import data RawVectorSource :: Type
type VectorSource = Source.Source RawVectorSource

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect VectorSource)

-- |The options for the creation of the Vector. See the `options` parameter in `new Vector(options)` in the OpenLayers API documentation.
type VectorSourceOptions = (features :: Array Feature.Feature)

-- |Creates a `Vector` source, see `new Vector(r)` in the Openlayers API documentation.
create :: forall l r . Union l r VectorSourceOptions => Record l -> Effect VectorSource
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Vector` source with defaults, see `new Vector()` in the OpenLayers API documentation.
create' :: Effect VectorSource
create' = runFn1 createImpl FFI.undefined
