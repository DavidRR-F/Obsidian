## Cryptography
The practice and study of writing and solving codes to hide the true meaning of information

## Encryption
Process of converting ordinary information into unintelligible forms of ciphertext

## Symmetric vs Asymmetric Encryption

### Symmetric Key Encryption
Encryption algorithm in which both the sender and receiver must know the same shared secret using a privately held key
- Single Key
- Key distribution does not scale
-  Faster Than Asymmetric Keys
#### Symmetric Key Algorithms

##### DES

**DES - Data Encryption Standard**: Encryption algorithm which breaks the input into 64-bit blocks and uses transposition and substitution to create ciphertext using an effective key strength of only 56-bits

**3DES - Triple DES**: Encryption algorithm which uses three separate symmetric keys to encrypt, decrypt, then encrypt the plaintext into ciphertext in order to increase the strength of DES

##### DES Replacements

**IDEA - International Data Encryption Algorithm**: Symmetric block cipher, which uses 64-bit blocks to encrypt plaintext into ciphertext ***Contender***

**RC6 - Rivest Cipher**: Symmetric block cipher that was introduced as a replacement for DES but AES was chosen instead ***Contender***

**AES - Advanced Encryption Standard**: Symmetric block cipher that uses 128-bit, 192-bit, or 256-bit blocks and a matching encryption key size to encrypt plaintext into ciphertext ***Winner***
##### Fish

**Blowfish**: Symmetric block cipher that uses 64-bit blocks and a variable length encryption key to encrypt plaintext to ciphertext

**Twofish**: Provides the ability to use 128-bit blocks in its encryption algorithm and uses 128-bit, 192-bit, or 256-bit encryption keys 

##### RC Cipher Suite

**RC4**: Symmetric stream cipher using a variable key size from 40-bits to 2048-bits that is used in ***SSL*** and ***WEP***

**RC5**: Symmetric block cipher that uses key sizes up to 2048-bits

**RC6**: Symmetric block cipher that was introduced as a replacement for DES but AES was chosen instead
### Asymmetric Key Encryption
Encryption algorithms where different keys are used to encrypt and decrypt data
- Public and Private Key
- Key distribution scales
- Slower than symmetric algorithms

#### Asymmetric Key Algorithms

![[Pasted image 20240714133126.png]]


### Hybrid Implementation
Utilizes asymmetric encryption to securely transfer a private key that can then be used with symmetric encryption


## Stream vs Block Cipher

### Stream Cipher
Utilizes a key-stream generator to encrypt data bit by bit using a mathematical XOR function to create ciphertext
- Often Symmetric Algorithms
- Used in streaming data encryption
- Use same key for encryption and decryption
- Used in hardware based solutions
### Block Cipher
Breaks the input into fixed-length blocks of data and performs the encryption on each block
- Easy to implement in software solutions
- Less susceptible to security issues


