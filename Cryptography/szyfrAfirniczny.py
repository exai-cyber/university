import math

# Polski alfabet bez Q, V, X
alphabet = "AĄBCĆDEĘFGHIJKLŁMNŃOÓPRSŚTUVWYZŹŻ"
m = len(alphabet)  # 32

def egcd(a, b):
    if a == 0:
        return b, 0, 1
    g, y, x = egcd(b % a, a)
    return g, x - (b // a) * y, y

def mod_inverse(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise ValueError("NWD(a, m) != 1")
    return x % m

def affine_encrypt(text, a, b):
    result = ""
    for ch in text.upper():
        if ch in alphabet:
            x = alphabet.index(ch)
            y = (a * x + b) % m
            result += alphabet[y]
        else:
            result += ch
    return result

def affine_decrypt(cipher, a, b):
    a_inv = mod_inverse(a, m)
    result = ""
    for ch in cipher.upper():
        if ch in alphabet:
            y = alphabet.index(ch)
            x = (a_inv * (y - b)) % m
            result += alphabet[x]
        else:
            result += ch
    return result



print("Szyfr Afiniczny: Polski Alfabet\n")

tekst = input("Podaj tekst: ")

a = int(input("Podaj parametr a (NWD(a,32)=1): "))
if math.gcd(a, m) != 1:
    raise ValueError("BŁĄD: niedozwolone a. Wybierz inne (1,3,5,7,...,31).")

b = int(input("Podaj parametr b (0-31): ")) % m

tryb = input("Szyfrowanie (S) czy deszyfrowanie (D)? ").strip().upper()

if tryb == 'S':
    wynik = affine_encrypt(tekst, a, b)
    print("\nZaszyfrowany tekst:")
    print(wynik)

elif tryb == 'D':
    wynik = affine_decrypt(tekst, a, b)
    print("\nOdszyfrowany tekst:")
    print(wynik)

else:
    print("Niepoprawny wybór trybu!")
