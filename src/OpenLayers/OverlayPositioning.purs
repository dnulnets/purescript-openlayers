-- |
-- | The OpenLayers Overlaypositioning module, a purescript FFI mapping.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.OverlayPositioning (
  OverlayPositioning(..)
  , bottom_left
  , bottom_center
  , bottom_right
  , center_left
  , center_center
  , center_right
  , top_left
  , top_center
  , top_right

  ) where

-- Standard import
import Prelude

--
-- Foreign data types
-- 

newtype OverlayPositioning = Position String

instance showOverlayPositioning :: Show OverlayPositioning where
  show (Position s) = s

foreign import bottom_left::OverlayPositioning
foreign import bottom_center::OverlayPositioning
foreign import bottom_right::OverlayPositioning
foreign import center_left::OverlayPositioning
foreign import center_center::OverlayPositioning
foreign import center_right::OverlayPositioning
foreign import top_left::OverlayPositioning
foreign import top_center::OverlayPositioning
foreign import top_right::OverlayPositioning
