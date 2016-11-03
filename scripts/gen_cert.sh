#openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
openssl req -x509 -nodes -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
