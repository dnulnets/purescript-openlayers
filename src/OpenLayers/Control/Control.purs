-- |
-- | The OpenLayers Control module
-- |
-- | Written by Tomas Stenlund, Sundsvall, Sweden (c) 2020
-- |
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

create :: forall r . {|r} -> Effect Control
create o = runFn1 createImpl o
