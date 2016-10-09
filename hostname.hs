#!/usr/bin/env stack
-- stack runghc

{-# OPTIONS_GHC -fwarn-name-shadowing #-}
{-# LANGUAGE OverloadedStrings #-}
import Turtle

main = do
  name <- hostname
  echo name
