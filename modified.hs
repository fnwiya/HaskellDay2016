#!/usr/bin/env stack
-- stack runghc

{-# OPTIONS_GHC -fwarn-name-shadowing #-}
{-# LANGUAGE OverloadedStrings #-}
import Turtle

main = do
  args <- arguments
  let firstArg = head(args)
  let f = fromText(firstArg)
  updateDate <- datefile(f)
  let d = repr(updateDate)
  echo d
