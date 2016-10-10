#!/usr/bin/env stack
-- stack runghc

{-# OPTIONS_GHC -fwarn-name-shadowing #-}
{-# LANGUAGE OverloadedStrings #-}
import Turtle

echoModified fname = do
  let file = fromText fname
  updateDate <- datefile file
  printf (s%"\t"%utc%"\n") fname updateDate

  
main = do
  args <- arguments
  mapM echoModified args
