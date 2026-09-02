import sqlite3
import os

DB_FILE = "vault.db"

def init_db():
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS metadata (
            id INTEGER PRIMARY KEY,
            salt BLOB NOT NULL
        )
    """)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS credentials (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            service TEXT NOT NULL,
            username TEXT NOT NULL,
            nonce BLOB NOT NULL,
            ciphertext BLOB NOT NULL
        )
    """)
    conn.commit()
    conn.close()

def get_or_create_salt(conn) -> bytes:
    cursor = conn.cursor()
    cursor.execute("SELECT salt FROM metadata WHERE id = 1")
    row = cursor.fetchone()
    if row:
        return row[0]
    else:
        salt = os.urandom(16)
        cursor.execute("INSERT INTO metadata (id, salt) VALUES (1, ?)", (salt,))
        conn.commit()
        return salt

def get_db_connection():
    return sqlite3.connect(DB_FILE)
