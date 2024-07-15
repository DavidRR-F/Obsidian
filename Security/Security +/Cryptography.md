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

**DH - Diffie-Hellman**: Used to conduct key exchanges and secure key distribution over an insecure network. Used for the key exchange inside of creating a VPN tunnel establishment as part of IPSec

**RSA - Rivest, Shamir, and Adleman**: Relies on the mathematical difficult of factoring large prime numbers. Supports key sizes between 1024-bits and 4096-bits

**ECC - Elliptic Curve Cryptography**: Heavily used in mobile devices and it's based on the algebraic structure if elliptical curves over finite field to define its keys with a 256-bit key and just as secure as RSA with 2048-bit keys

- **ECDH**: ECC version of the popular Diffie-Hellman key exchange protocol
- **ECDHE**: Uses a different key for each portion of the key establishment process inside the Diffie-Hellman key exchange
- **ECDSA**: Used as a public key encryption algorithm by the US Government in their digital signatures
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

## Hashing 

### Algorithms

**MD5**: Creates a 128-bit hash value that is unique to the input file. Has a limited number of hash values which can lead to a collision

**SHA-1**: Creates a 160-bit hash digest, which significantly reduces the number of collisions that occur over md5

**SHA-2**: Family of hash functions that contain longer hash digests such as SHA-224, SHA-256, SHA-384, and SHA-512. Uses 64-80 rounds of computations to create its hash digests

**SHA-3**: Newer family of hash functions and its has digest can go between 224 bits and 512 bits. It has a major increase in security because of the 120 rounds of computations to create its digests

**RIPEMD-160** 160-bit open-source hashing algorithm that was created as a competitor to the SHA family. Also comes in RIPEMD-256 and RIPEMD-320 sizes

**HMAC**: Used to check the integrity of a message and provides some level of assurance that its authenticity is real Often pair with other algorithms to do the work like HMAC-MD5, HMAC-SHA1, or HMAC-SHA256 depending on the underlying hash used with it.

### DSS - Digital Security Standard
Relies upon 160-bit message digest by the Digital Security Algorithm

### Increasing Hash Security

#### Hash Attacks 

**Pass the Hash Attack**: Hacking technique that allows the attacker to authenticate to a remote server or service by using the underlying hash of a user's password instead of requiring the associated plaintext password. 

- tools like Mimkatz can be used to automate the process of harvesting the hashes and conducting the attack

**Birthday Attack**: Occurs when a attacker is able to send two different messages through a hash algorithm and it results in the same identical hash digest, referred to as a collision

- For example if I have a users password hash, if I can find a character string that creates a collision (same hash digest) I can use that string to authenticate as that user

#### Hash Protection

**Key Stretching**: Technique that is used to mitigate a weaker key by increasing the time needed to crack it 

**Salting**: Adding random data into a one-way cryptographic hash to help protect against password cracking techniques

**Nonce**: Stands for "number used once", is a unique, often random number that is added to password-based authentication processes

## PKI - Public Key Infrastructure
An entire system of hardware, software, policies, procedures, and people that is based on asymmetric encryption. for example a https request. It is a Framework for managing digital keys and certificates that facilitate secure data transfer, authentication, and encrypted communication over networks

![[Pasted image 20240714203122.png]]

- PKI and Public Key Cryptography are closely related, but they are not the same thing because 
	- PKI is the systems that create the asymmetrical key pairs that consist of those public and private keys that are used in the encryption and decryption process
	- Public Key Cryptography is just the encryption and decryption process not the overall architecture

### Certificate Authority
Issues digital certificates and keeps the level of trust between all of the certificate authorities around the would

### Key Escrow
Process where cryptographic keys are stored in a secure, third-party location, which is effectively an "escrow"

- In the event that a person or organization loses access to there encryption keys or in cases of legal investigations, the keys can be retrieved from the escrow ensuring encrypted data will not be inaccessible 

**Key Recovery Agent Agent**: Specialized type of software that allows the restoration of a lost or corrupted key to be performed
## Digital Certificates
Digitally signed electronic document that binds a public key with a user's identity

**Wildcard Certificate**: Allows all of the subdomains to use the same public key certificate and have it displayed as valid. For example: `*.mydomain.io`

- **Advantages**: Ease of maintainability
- **Disadvantages**: If the certificate is revoked it affects all subdomains

**SAN Field Subject Alternate Name**: Certificate that specifies what additional domains and IP addresses are going to be supported. For example: same cert for `mydomain1.com` and `mydomain2.com`

**Singe-Sided Certificate**: Only requires the server to be validated

**Dual-Sided Certificate**: Requires both the server and the user to be validated

**Self-Signed Certificate**: Digital certificate that is signed by the same entity whose identity it certifies. AKA does not have a trusted certificate authority (trust me bro certificate)

**Third-Party Certificate**: Digital certificate issued and signed by a trusted certificate authority (CA)

### Root of Trust
Each Certificate is validated using the concept of a root of trust or the chain of trust

![[Pasted image 20240714205909.png]]

The root of trust for most certificates is going to be a verified third party provider such as:
- Verisign
- Amazon
- Google
- Cloudflare

**Certificate Authority**: Trusted third party who is going to issue these digital certificates

**Registration Authority**: Requests identifying information from the user and forwards that certificate request up to the certificate authority to create the digital certificate

**Certificate Signing Request**: A block of encoded text that contains information about the entity requesting the certificate

**Certificate Revocation List**: Serves as an online list of digital certificates that the certificate authority has already revoked

**OCSP - Online Certificate Status Protocol**: Allows you to determine the revocation status of any digital certificate using its serial number. Acts as an alternative to the Certificate Revocation List that operates more quickly because it does not use encryption and only looks up one certificate at a time

**OCSP Stapling** An alternative to OCSP that allows the certificate holder to get OCSP records from the server at regular intervals and include it as part of the ssl/tls handshake which eliminates an extra connection being required and speeds up the tunnel creation process

**Public Key Pinning**: Allows an HTTPS website to resist impersonation attacks from users who are trying to present fraudulent certificates by presenting a pair of public keys as part of the http header if the website does not get the matching public keys from the authority it will indicate the website has been compromised and will alert the user

## Blockchain
a shared immutable ledger for recording transactions, tracking assets, and building trust

- A blockchain is a really long series of information with each block containing information
- Each block also contains the hash of the block before it

![[Pasted image 20240714212323.png]]

**Public Ledger**: A record-keeping system that maintains participants' identities in a secure and anonymous format

**Smart Contracts**: Self-executing contracts where the terms of agreement or conditions are written directly into lines of code

**Permissioned Blockchain**: Used for business transactions and it promotes new levels of trust and transparency using immutable public ledgers

## Encryption Tools

**TPM - Trusted Platform Module**: Dedicated microcontroller designed to secure hardware through integrated cryptographic keys

**HSM - Hardware Security Module**: Physical device that safeguards and manages digital keys, primarily use for mission-critical situations like financial transactions

**KMS - Key Management System**: Integrated approach for generating, distributing, and managing cryptographic keys for devices and applications

**Secure Enclave**: Co-processor integrated into the main processor of some devices, designed with the sole purpose of ensuring protection

## Obfuscation

**Steganography**: Concealing a message within another so that the very existence of the message is hidden
- frequently used alongside encryption to add a extra layer of security

