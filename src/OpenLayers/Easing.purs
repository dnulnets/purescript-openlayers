-- | The OpenLayers Easing module, a purescript FFI mapping.
-- |
-- | All functions and types of the OpenLayer API are currently not mapped.
-- |
-- | Functions, types or constants not part of the OpenLayers API or have
-- | a different semantics are documented in this module, otherwise they
-- | are documented in the OpenLayers API documentation.
-- |
-- | https://openlayers.org/en/latest/apidoc/
module OpenLayers.Easing (EasingFunction
  , easeIn
  , easeOut
  , inAndOut
  , linear
  , upAndDown) where

-- |The easing function that can be used in the Overlay element in `Options`.
type EasingFunction = Number->Number

-- The default easing functions
foreign import easeIn::EasingFunction
foreign import easeOut::EasingFunction
foreign import inAndOut::EasingFunction
foreign import linear::EasingFunction
foreign import upAndDown::EasingFunction
