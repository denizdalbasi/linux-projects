import os
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives.ciphers.aead import AESGCM

def derive_key(master_password: str, salt: bytes) -> bytes:
    """Derives a 256-bit encryption key from the master password and salt using PBKDF2-HMAC."""
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=salt,
        iterations=600_000,
    )
    return kdf.derive(master_password.encode())

def encrypt_password(master_password: str, salt: bytes, plaintext: str) -> tuple[bytes, bytes]:
    """Encrypts a plaintext password using AES-GCM and returns (nonce, ciphertext)."""
    key = derive_key(master_password, salt)
    aesgcm = AESGCM(key)
    nonce = os.urandom(12)  # Standard 12-byte nonce for AES-GCM
    ciphertext = aesgcm.encrypt(nonce, plaintext.encode(), None)
    return nonce, ciphertext

def decrypt_password(master_password: str, salt: bytes, nonce: bytes, ciphertext: bytes) -> str:
    """Decrypts an AES-GCM ciphertext back into the original plaintext password."""
    key = derive_key(master_password, salt)
    aesgcm = AESGCM(key)
    plaintext_bytes = aesgcm.decrypt(nonce, ciphertext, None)
    return plaintext_bytes.decode()
