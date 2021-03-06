-- |
-- | The OpenLayers Collection module, a purescript FFI mapping. It also
-- | reexports functions based on the `Collection` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Collection (
    Collection
    , RawCollection
    , Options(..)

    , create
    , create'

    , extend
    , getLength
    , item) where

-- Standard imports
import Prim.Row (class Union)

-- Data imports
import Data.Maybe (Maybe(..))
import Data.Function.Uncurried
  ( Fn1
  , Fn2
  , Fn4
  , runFn1
  , runFn2
  , runFn4)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 

-- |The FFI version of the Collection. For internal use only!
foreign import data RawCollection :: Type->Type
type Collection a = RawCollection a

-- |The options for the creation of the Collection. See the `options` parameter in `new Collection(options)` in the OpenLayers API documentation.
type Options = (unique::Boolean)
--
-- Function mapping
--
foreign import createImpl :: forall r t . Fn2 (Array t) (FFI.NullableOrUndefined (Record r)) (Effect (Collection t))

-- |Creates a `Collection`, see `new Collection(r)` in the OpenLayers API documentation.
create :: forall l r t . Union l r Options => Array t -> Record l -> Effect (Collection t)
create a o = runFn2 createImpl a (FFI.notNullOrUndefined o)

-- |Creates a `Collection` using the default options, see `new Collection(r)` in the OpenLayers API documentation.
create' :: forall t . Array t -> Effect (Collection t)
create' a = runFn2 createImpl a FFI.undefined

foreign import extendImpl :: forall t . Fn2 (Array t) (Collection t) (Collection t)

extend :: forall t . Array t -> Collection t -> Collection t
extend a c = runFn2 extendImpl a c

foreign import itemImpl :: forall t . Fn4 (t->Maybe t) (Maybe t) Int (Collection t) (Maybe t)

item::forall t . Int->Collection t->Maybe t
item i self = runFn4 itemImpl Just Nothing i self

--
-- Getters
--

foreign import getLengthImpl :: forall t . Fn1 (Collection t) Int

getLength:: forall t . Collection t -> Int
getLength self = runFn1 getLengthImpl self
