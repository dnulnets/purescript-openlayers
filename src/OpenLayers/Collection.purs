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

    , create
    , create'

    , extend
    , getLength
    , item) where

-- Data imports
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , Fn2
  , runFn1
  , runFn2)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.FFI as FFI

--
-- Foreign data types
-- 
foreign import data RawCollection :: Type->Type
type Collection a = RawCollection a

--
-- Function mapping
--
foreign import createImpl :: forall r t . Fn1 (FFI.NullableOrUndefined {|r}) (Effect (Collection t))

-- |Creates a `Collection`, see `new Collection(r)` in the OpenLayers API documentation.
create :: forall r t . Maybe {|r} -> Effect (Collection t)
create o = runFn1 createImpl (FFI.toNullable o)

-- |Creates a `Collection` with defaults, see `new Collection()` in the Openlayers API documentation.
create' :: forall t . Effect (Collection t)
create' = runFn1 createImpl FFI.undefined

foreign import extendImpl :: forall t . Fn2 (Array t) (Collection t) (Collection t)

extend :: forall t . Array t -> Collection t -> Collection t
extend a c = runFn2 extendImpl a c

foreign import itemImpl :: forall t . Fn2 Int (Collection t) t

item::forall t . Int->Collection t->t
item i self = runFn2 itemImpl i self

--
-- Getters
--

foreign import getLengthImpl :: forall t . Fn1 (Collection t) Int

getLength:: forall t . Collection t -> Int
getLength self = runFn1 getLengthImpl self
