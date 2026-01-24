# Intro: Basic Contract Structure

This folder introduces the simplest Solidity contract anatomy using `Identity.sol`.

## Code Overview

- `identity` defines two state variables (`name`, `age`) stored on-chain.
- The constructor initializes `name` to `"OpenGuild"` and `age` to `25`.
- `getName()` and `getAge()` are `view` functions that read state.
- `setAge()` increments `age` by 1.
- `setName()` resets `name` to an empty string.

## Files

- `Identity.sol`: basic contract with state, constructor, getters, and setters.
