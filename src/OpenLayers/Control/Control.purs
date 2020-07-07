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
    , ControlOptions(..)
    , create) where

-- Data imports
import Data.Function.Uncurried
  ( Fn1
  , runFn1)

-- Standard imports
import Prim.Row (class Union)

-- Effect imports
import Effect (Effect)

-- Web imports
import Web.DOM.Element (Element)

-- Own import
import OpenLayers.Object (BaseObject, get) as Object

--
-- Foreign data types
-- 

-- |The FFI version of the Control. For internal use only!
foreign import data RawControl :: Type
type Control = Object.BaseObject RawControl

--
-- Function mapping
--
foreign import createImpl :: forall r . Fn1 (Record r) (Effect Control)

-- |The options for the creation of the Control. See the `options` parameter in `new Control(options)` in the OpenLayers API documentation.
type ControlOptions = (element::Element)

-- |Creates a new Control, see `new Control` in the Openlayers API documentation.
create :: forall l r . Union l r ControlOptions => Record l -> Effect Control
create o = runFn1 createImpl o
