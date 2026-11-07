

const ALPHABET = collect("qwertzuiopüasdfghjklöäyxcvbnmQWERTZUIOPÜASDFGHJKLÖÄYXCVBNM123456789 !\"\\/+-'#`,;.<>") # Vielen Zeichen eine Zahl zuordnen



"""
    encryption(message, key, alphabet = ALPHABET)

Encrypts a message using the Vigenère cipher.

# Arguments
- `massage::String`: The message to encrypt.
- `key::String`: The encryption key.
- `alphabet::Vector{Char}`: Alphabet containing the characters to encrypt.
  Defaults to `ALPHABET`.

# Returns
- `String`: The encrypted message.

# Notes
- The same key and alphabet need to be used for successful decryption.
- Characters not included in the alphabet remain unchanged.
- The key advances with every character position, including characters that are not part of the alphabet.

# Throws
- `ArgumentError`: If the key is empty or contains characters not included in the alphabet, or the alphabet ist empty.

# Examples
```julia
julia> encryption("Hallo","Key")
"üdS9ü"
"""
function encryption(massage::String, key::String , alphabet::Vector{Char} = ALPHABET)
    massage = collect(massage)
    key = collect(key)

    if isempty(alphabet)
        throw(ArgumentError("The alphabet must not be empty!"))
    end

    if isempty(key)
        throw(ArgumentError("The key must not be empty!"))
    end

    for c in key
        if isnothing(findfirst(isequal(c),alphabet))
            throw(ArgumentError("The key contains an invalid character: $c"))
        end
    end

    for i in eachindex(massage)
        index_old = findfirst(isequal(massage[i]),alphabet)
        if isnothing(index_old)
            continue
        end
        key_index = mod(i-1,length(key)) + 1 # i-1 da mod bei null beginnt am ende +1 um wieder richtigen index ab 1 zu haben
        shift = findfirst(isequal(key[key_index]),alphabet) - 1
        index_old -= 1
        index_new = mod(index_old + shift ,length(alphabet)) + 1
        massage[i] = alphabet[index_new]
    end
    return String(massage)
end


"""
    decryption(message, key, alphabet = ALPHABET

Decrypts a message using the Vigenère cipher.

# Arguments
- `massage::String`: The message to decrypt.
- `key::String`: The decryption key.
- `alphabet::Vector{Char}`: Alphabet containing the characters to decrypt.
  Defaults to `ALPHABET`.

# Returns
- `String`: The decrypted message.

# Throws
- `ArgumentError`: If the key is empty or contains characters not included in the alphabet, or the alphabet ist empty.

# Notes
- The same key and alphabet used for encryption must be used for successful decryption.
- Characters not included in the alphabet remain unchanged.
- The key advances with every character position, including characters that are not part of the alphabet.

# Examples
```julia
julia> decryption("üdS9ü","Key")
"Hallo"
"""
function decryption(Note::String, key::String , alphabet::Vector{Char}=ALPHABET)
    Note = collect(Note)
    key = collect(key)

    if isempty(alphabet)
        throw(ArgumentError("The alphabet must not be empty!"))
    end


    if isempty(key)
        throw(ArgumentError("Use a key!"))
    end

    for c in key
        if isnothing(findfirst(isequal(c),alphabet))
            throw(ArgumentError("Wrong key or wrong alphabet!"))
        end
    end

    for i in eachindex(Note)
        index_old = findfirst(isequal(Note[i]),alphabet)
        if isnothing(index_old)
            continue
        end
        key_index = mod(i-1,length(key)) + 1 
        shift = findfirst(isequal(key[key_index]),alphabet) - 1
        index_old -= 1
        index_new = mod(index_old - shift ,length(alphabet)) + 1
        Note[i] = alphabet[index_new]

    end
    return String(Note)
end