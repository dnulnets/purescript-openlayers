-- |
-- | The OpenLayers Layer module, a purescript FFI mapping. It also
-- | reexports functions based on the `Layer` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Layer.Layer (
  module Base

  , Layer
  , RawLayer,
  
  setSource ) where

import Prelude

-- Standard imports
import Data.Function.Uncurried
  ( Fn2
  , runFn2)

-- Import Effects
import Effect (Effect)

-- Our own imports
import OpenLayers.Layer.Base (Base, RawBase) as Base
import OpenLayers.Source.Source as Source

--
-- Foreign data types
-- 
foreign import data RawLayer :: Type -> Type

-- |The actual abstract basetype for geometry
type Layer a = Base.Base (RawLayer a)

--
-- Function mapping
--

foreign import setSourceImpl::forall s l . Fn2 (Source.Source s) (Layer l) (Effect Unit)
setSource::forall s l . Source.Source s->Layer l->Effect Unit
setSource src self = runFn2 setSourceImpl src self 
