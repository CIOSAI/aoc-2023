# Advent of Code 2023 Solution Elixir

I'm doing AOC to practice Elixir. The code might not be the most optimized or orderly.

# Instructions

I made these on `iex` running in a Docker Image, then copied over. Might not run perfectly when pulled.

## Versions

Erlang version `Erlang/OTP 26 [erts-14.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]`

IEx version `Interactive Elixir (1.15.7)`

## Structure

Inside `aoc.ex` is the module `Aoc`

Every day is a function `dayN` that takes the input, and return the appropriate output as a tuple `{first_part, second_part}`

Answer for the first part is under variable `first_part` and the second `second_part`

Navigate the project with 4 section tags:

- `SHARED`
- `FIRST_PART`
- `SECOND_PART`
- `END`
