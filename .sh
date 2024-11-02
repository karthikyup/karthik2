# Generate and save a key to a file (only do this once and keep the key safe!)
def generate_key(filename="key.key"):
    key = Fernet.generate_key()
    with open(filename, "wb") as key_file:
        key_file.write(key)
    print("Encryption key generated and saved.")

# Load the key from a file
def load_key(filename="key.key"):
    with open(filename, "rb") as key_file:
        return key_file.read()

# Encrypt a message
def encrypt_message(message, key):
    fernet = Fernet(key)
    encrypted_message = fernet.encrypt(message.encode())
    return encrypted_message

# Decrypt a message
def decrypt_message(encrypted_message, key):
    fernet = Fernet(key)
    decrypted_message = fernet.decrypt(encrypted_message).decode()
    return decrypted_message

# Encrypt a file
def encrypt_file(file_path, key):
    fernet = Fernet(key)
    with open(file_path, "rb") as file:
        file_data = file.read()
    encrypted_data = fernet.encrypt(file_data)
    with open(file_path, "wb") as file:
        file.write(encrypted_data)
    print(f"File '{file_path}' encrypted successfully.")

# Decrypt a file
def decrypt_file(file_path, key):
    fernet = Fernet(key)
    with open(file_path, "rb") as file:
        encrypted_data = file.read()
    decrypted_data = fernet.decrypt(encrypted_data)
    with open(file_path, "wb") as file:
        file.write(decrypted_data)
    print(f"File '{file_path}' decrypted successfully.")

# Example usage:
# Uncomment the following lines to test the functions

# Step 1: Generate a key (only do this once)
# generate_key()

# Step 2: Load the key
key = load_key()

# Step 3: Encrypt and Decrypt a message
message = "This is a secret message."
encrypted = encrypt_message(message, key)
print("Encrypted message:", encrypted)

decrypted = decrypt_message(encrypted, key)
print("Decrypted message:", decrypted)

# Step 4: Encrypt and Decrypt a file
file_path = "example.txt"  # make sure this file exists before running
encrypt_file(file_path, key)
decrypt_file(file_path, key)
