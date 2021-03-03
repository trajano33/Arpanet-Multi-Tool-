import random

chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456!£$%^&*(`)"

while 1:
    password_len = int(input("Quantos caracteres voce quer que tenha sua senha : "))
    password_count = int(input("Quantas senhas voce quer : "))
    for x in range(0,password_count):
        password  = ""
        for x in range(0,password_len):
            password_char = random.choice(chars)
            password      = password + password_char
        print("Esta sao as senhas : ", password)