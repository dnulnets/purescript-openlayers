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
module OpenLayers.Control.Control (
    module Object

    -- Control
    , Control
    , RawControl
    , create) where

-- Standard import
import Prelude

-- Data imports
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Effect imports
import Effect (Effect)

-- Own import
import OpenLayers.Object (BaseObject, get) as Object

--
-- Foreign data types
-- 
foreign import data RawControl :: Type
type Control = Object.BaseObject RawControl

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 {|r} (Effect Control)

-- |Creates a new Control, see `new Control` in the Openlayers API documentation.
create :: forall r . {|r} -> Effect Control
create o = runFn1 createImpl o
