# VigenereCipher.jl

[![Build Status](https://github.com/LarsGoll/VigenereCipher.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/LarsGoll/VigenereCipher.jl/actions/workflows/CI.yml?query=branch%3Amain)


A simple implementation of the Vigenère cipher in Julia.

## Project structure

- `src/VigenereCipher.jl`: Main module of the package. Exports the encryption and decryption functions.
- `src/cryption.jl`: Contains the implementation of the encryption and decryption algorithms.
- `test/runtests.jl`: Contains tests for the encryption and decryption functions.
- `main.jl`: Interactive script that asks the user for a message, a key and whether to encrypt or decrypt the message.

## Usage

The package provides two main functions:

- `encryption(message, key)`: Encrypts a message using the Vigenère cipher.
- `decryption(message, key)`: Decrypts a message using the Vigenère cipher.

To run the interactive program, execute `main.jl` in Julia.

## Testing

Run the package tests using:

```julia
using Pkg
Pkg.test()
```

