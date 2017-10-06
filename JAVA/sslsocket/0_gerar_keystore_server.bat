keytool -genkey -alias server -keyalg rsa -dname "cn=server, ou=unit, o=org, l=City, s=ST, c=US" -validity 365242 -keystore server_key_store_file -ext san=ip:127.0.0.1 -v
