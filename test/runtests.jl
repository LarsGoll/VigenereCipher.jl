using VigenereCipher
using Test

@testset "VigenereCipher.jl" begin
    
    @testset "Encryption()" begin
        @test encryption("Hallo","Key") == "üdS9ü"
        @test encryption("","Key") == ""
        @test encryption("Hallo","key",collect("Hallokey")) == "kyayl"
        @test_throws ArgumentError encryption("Hallo","")
        @test_throws ArgumentError encryption("Hallo","Ke%")
        @test_throws ArgumentError encryption("Hallo","Key",collect(""))

    end

    @testset "Decryption()" begin
        @test decryption("üdS9ü","Key") == "Hallo"
        @test encryption("","Key") == ""
        @test decryption("kyayl","key",collect("Hallokey")) == "Hallo"
        @test_throws ArgumentError decryption("üdS9ü","")
        @test_throws ArgumentError decryption("üdS9ü","Ke%")
        @test_throws ArgumentError decryption("üdS9ü","Key",collect(""))
        
    end

    @testset "Decryption(Encryption())" begin
        message = "Hallo Welt !%"
        key = "Key"
        @test decryption(encryption(message,key),key) == message

    end
end
