using VigenereCipher




"""
    userinput()

Prompts the user to select an encryption or decryption operation
and enter a message and a key.

# Returns
- `Tuple{String, String, String}`: The message, key and selected action
  (`"e"` for encryption or `"d"` for decryption).
- `Tuple{Nothing, Nothing, Nothing}`: If the user enters an invalid action.

# Notes
- Reads input from the standard input using `readline()`.
- The function does not perform encryption or decryption itself.
"""
function userinput()
    print("Type e if you want to encrypt a massage or d to decrypt a massage: ")
    act = readline()

    if act == "e"
        print("Type the massage which you want to encrypt: ")
        massage = readline()
        print("Enter a Key, remember it!:")
        key = readline()
    elseif act == "d"
        print("Type the massage which you want to decrypt: ")
        massage = readline()
        print("Enter the Key: ")
        key = readline()
    else 
        println("you didn't enter e or d so we assume you want to do nothing")
        return nothing, nothing, nothing

    end

    return massage, key, act
end


keepgoing = "Yes"

while keepgoing == "Yes"
    massage, key, act = userinput()
    if act == "e"
        cryptmassage = encryption(massage,key)
        println("Here is the encrypted massage: $cryptmassage")
    elseif act == "d"
        cryptmassage = decryption(massage, key)
        println("Here is the decrypted massage: $cryptmassage")
    end

    println("do you want to continue en- or decrypt massanges? type Yes or No")
    global  keepgoing = readline()
end