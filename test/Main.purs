module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import OpenLayers.Style.Icon as Icon
import OpenLayers.Style.Style as Style

main :: Effect Unit
main = do
  log "🍝"
  log "play with the Icon."
  picon <- Icon.create'
  style <- Style.create { image : picon }
  pure unit
