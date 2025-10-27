#Alfabety
polski_alfabet = "aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż"
polski_alfabet_upper = polski_alfabet.upper()

angielski_alfabet = "abcdefghijklmnopqrstuvwxyz"
angielski_alfabet_upper = angielski_alfabet.upper()

#szyfrowanie
def szyfr_cezara(text, klucz, jezyk="pl"):
    wynik = ""
    
    if jezyk == "pl":
        alfabet = polski_alfabet
        alfabet_upper = polski_alfabet_upper
    elif jezyk == "en":
        alfabet = angielski_alfabet
        alfabet_upper = angielski_alfabet_upper
    else:
        raise ValueError("Nieznany język. Użyj 'pl' lub 'en'.")
    
    n = len(alfabet)
    klucz = klucz % n  
    
    for znak in text:
        if znak in alfabet:
            idx = alfabet.index(znak)
            nowy_idx = (idx + klucz) % n
            wynik += alfabet[nowy_idx]
        elif znak in alfabet_upper:
            idx = alfabet_upper.index(znak)
            nowy_idx = (idx + klucz) % n
            wynik += alfabet_upper[nowy_idx]
        else:
            wynik += znak 
    return wynik

#deszyfrowanie
def deszyfruj_cezara(text, klucz, jezyk="pl"):
    return szyfr_cezara(text, -klucz, jezyk)

#użycie
tekst_pl = "Zażółć gęślą jaźń"
tekst_en = "Hello World"

klucz = 32

#szyfrowanie
zaszyfrowany_pl = szyfr_cezara(tekst_pl, klucz, "pl")
zaszyfrowany_en = szyfr_cezara(tekst_en, klucz, "en")

#deszyfrowanie
odszyfrowany_pl = deszyfruj_cezara(zaszyfrowany_pl, klucz, "pl")
odszyfrowany_en = deszyfruj_cezara(zaszyfrowany_en, klucz, "en")

print("Polski - Zaszyfrowany:", zaszyfrowany_pl)
print("Polski - Odszyfrowany:", odszyfrowany_pl)
print("Angielski - Zaszyfrowany:", zaszyfrowany_en)
print("Angielski - Odszyfrowany:", odszyfrowany_en)
