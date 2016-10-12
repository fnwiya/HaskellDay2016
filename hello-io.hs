#!/usr/bin/env stack
-- stack runghc

{-# LANGUAGE OverloadedStrings #-}
import Turtle

nestedIO = do
  putStr "Hello, "
  return (putStrLn "I/O!")

main = do
  printIO <- nestedIO
  printIO
