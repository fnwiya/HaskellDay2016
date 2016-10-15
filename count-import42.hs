#!/usr/bin/env stack
-- stack runghc

{-# LANGUAGE OverloadedStrings #-}
import Turtle
import qualified Control.Foldl as Fold

main = do
  (mPath', isShow) <- options "Count imported modules" parser
  let path' = case mPath' of Nothing -> "."
                             Just p -> p
      path = fromText path'
      sink = if isShow then dump else wc
  find (suffix ".hs") path
    & grepImport
    & sink

grepImport upstream = do
  path <- upstream
  input path & grep (prefix "import ")

parser = (,) <$> optional (optText "dir" 'd' "the root of search directories")
             <*> switch "show" 's' "Show tha name of all modules"

wc src = src & (`fold` Fold.length) & view

dump src = src
           & sed (prefix (importDef *> moduleName))
           & stdout
  where
    importDef = "import" <> spaces1 <> ("qualified" <> spaces1 <|> "")
    moduleName = plus (notChar ' ')
