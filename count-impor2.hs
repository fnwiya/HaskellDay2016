#!/usr/bin/env stack
-- stack runghc

{-# LANGUAGE OverloadedStrings #-}
import Turtle
import qualified Control.Foldl as Fold

main = do
  args <- arguments
  let path' = head args
      path = fromText path'
  find (suffix ".hs") path
    & grepImport
    & (`fold` Fold.length)
    & view

grepImport upstream = do
  path <- upstream
  input path & grep (prefix "import")
