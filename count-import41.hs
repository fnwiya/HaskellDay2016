#!/usr/bin/env stack
-- stack runghc

{-# LANGUAGE OverloadedStrings #-}
import Turtle
import qualified Control.Foldl as Fold

main = do
  mPath' <- options "Count imported modules" parser
  let path' = case mPath' of Nothing -> "."
                             Just p -> p
      path = fromText path'
  find (suffix ".hs") path
    & grepImport
    & (`fold` Fold.length)
    & view

grepImport upstream = do
  path <- upstream
  input path & grep (prefix "import ")

parser = optional $ optText "dir" 'd' "the root of search directories"
