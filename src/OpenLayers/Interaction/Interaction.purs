-- |
-- | The OpenLayers Interaction module, a purescript FFI mapping. It also
-- | reexports functions based on the `Interaction` inheritance structure.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Interaction.Interaction
  ( module Object
    , Interaction
    , RawInteraction) where

-- Import our own stuff
import OpenLayers.Object (BaseObject) as Object

--
-- Foreign data types
-- 
foreign import data RawInteraction :: Type->Type
type Interaction a = Object.BaseObject (RawInteraction a)
