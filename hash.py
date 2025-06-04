from werkzeug.security import generate_password_hash

senha = "sodre123"
hash_gerado = generate_password_hash(senha)
print(hash_gerado)

