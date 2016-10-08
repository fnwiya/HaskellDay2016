#!/usr/bin/env stack
-- stack runghc

main = do
  file <- readFile "hello.hs"
  putStrLn file
