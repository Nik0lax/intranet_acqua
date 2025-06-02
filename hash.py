from werkzeug.security import generate_password_hash

senha = "Nik0lax_0605!"
hash_gerado = generate_password_hash(senha)
print(hash_gerado)
