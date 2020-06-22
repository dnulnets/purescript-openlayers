-- |
-- | The OpenLayers FFI purescript helper functions.
-- |
module OpenLayers.FFI (
    NullableOrUndefined
    , null
    , undefined

    , notNullOrUndefined

    , toNullable
    , toUndefined
    , toMaybe) where

-- Data imports
import Data.Maybe (Maybe(..), maybe)
import Data.Function.Uncurried
  (Fn3
  , runFn3)

--
-- Foreign data types
-- 

-- |Holds a Javascript `null`, an `undefined` or a value
foreign import data NullableOrUndefined :: Type -> Type

-- |The javascript `null` value
foreign import null :: forall a. NullableOrUndefined a
-- |The javascript `undefined` value
foreign import undefined :: forall a. NullableOrUndefined a

foreign import nullableOrUndefined :: forall a r. Fn3 (NullableOrUndefined a) r (a -> r) r

-- |Wraps a value into a `NullableOrUndefined`.
foreign import notNullOrUndefined :: forall a. a -> NullableOrUndefined a

-- |Converts `Nothing` to `null` and `Just a` to `NullableOrUndefined a`.
toNullable :: forall a. Maybe a -> NullableOrUndefined a
toNullable = maybe null notNullOrUndefined

-- |Converts `Nothing` to `undefined` and `Just a` to `NullableOrUndefined a`.
toUndefined :: forall a. Maybe a -> NullableOrUndefined a
toUndefined = maybe undefined notNullOrUndefined

-- |Converts `null` or `undefined` to `Nothing`, and `NullableOrUndefined a` to `Just a`.
toMaybe :: forall a. NullableOrUndefined a -> Maybe a
toMaybe n = runFn3 nullableOrUndefined n Nothing Just
