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
  , Features
  , features
  , RawVectorSource
  , Options(..)
  , create
  , create'
  , removeFeature ) where

-- Data imports
import Prelude
import Data.Function.Uncurried
  ( Fn1
  , Fn2
  , runFn1
  , runFn2 )

-- Standard imports
import Prim.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI
import OpenLayers.Source.Source (BaseObject, RawSource, Source, get) as Source
import OpenLayers.Feature as Feature
import OpenLayers.Collection as Collection
--
-- Foreign data types
-- 
foreign import data RawVectorSource :: Type
type VectorSource = Source.Source RawVectorSource

foreign import data Features :: Type
--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (FFI.NullableOrUndefined (Record r)) (Effect VectorSource)

-- |The options for the creation of the Vector. See the `options` parameter in `new Vector(options)` in the OpenLayers API documentation.
type Options = (features :: Features)

-- |Constructors for the features element in `Options`
features::{asArray::Array Feature.Feature->Features, asCollection::Collection.Collection Feature.Feature->Features}
features = {asArray:unsafeCoerce, asCollection:unsafeCoerce}

-- |Creates a `Vector` source, see `new Vector(r)` in the Openlayers API documentation.
create :: forall l r . Union l r Options => Record l -> Effect VectorSource
create o = runFn1 createImpl (FFI.notNullOrUndefined o)

-- |Creates a `Vector` source with defaults, see `new Vector()` in the OpenLayers API documentation.
create' :: Effect VectorSource
create' = runFn1 createImpl FFI.undefined

foreign import removeFeatureImpl :: Fn2 Feature.Feature VectorSource (Effect Unit)
removeFeature::Feature.Feature->VectorSource->Effect Unit
removeFeature f s = runFn2 removeFeatureImpl f s
