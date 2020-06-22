-- | The OpenLayers Target module, a purescript FFI mapping. It also
-- | reexports functions based on the `Target` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Events.Target (Target, RawTarget) where

--
-- Foreign data types
-- 
foreign import data RawTarget :: Type -> Type
type Target a = RawTarget a
