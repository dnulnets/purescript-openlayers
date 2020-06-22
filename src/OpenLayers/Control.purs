-- |
-- | The OpenLayers Control module, a purescript FFI mapping. It also
-- | reexports functions based on the `Control` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Control (
    defaults
    , defaults') where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn0
  , Fn1
  , runFn0
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Own imports
import OpenLayers.Control.Control as Control
import OpenLayers.Collection as Collection
import OpenLayers.FFI as FFI
--
-- Function mapping
--
foreign import defaultsImpl :: forall r . Fn1 (FFI.NullableOrUndefined {|r}) (Effect (Collection.Collection Control.Control))

defaults :: forall r . Maybe {|r} -> Effect (Collection.Collection Control.Control)
defaults o = runFn1 defaultsImpl (FFI.toNullable o)

-- |Same as `defaults`, but uses the default interactions, see Openlayers API documentation.
defaults' :: Effect (Collection.Collection Control.Control)
defaults' = runFn1 defaultsImpl FFI.undefined
