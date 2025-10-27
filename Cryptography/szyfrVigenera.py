def pobierz_alfabet(jezyk):
    if jezyk.lower() == "pl":
        return "AĄBCĆDEĘFGHIJKLŁMNŃOÓPRSŚTUVWYZŹŻ"
    else:
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def szyfr_vigenere(tekst, klucz, alfabet):
    szyfrogram = ""
    n = len(alfabet)
    j = 0

    for znak in tekst:
        is_lower = znak.islower()
        z = znak.upper()
        if z in alfabet:
            k = klucz[j % len(klucz)].upper()
            if k not in alfabet:
                continue
            i_text = alfabet.index(z)
            i_key = alfabet.index(k)
            litera = alfabet[(i_text + i_key) % n]
            szyfrogram += litera.lower() if is_lower else litera
            j += 1
        else:
            szyfrogram += znak
    return szyfrogram


def odszyfr_vigenere(szyfrogram, klucz, alfabet):
    tekst = ""
    n = len(alfabet)
    j = 0

    for znak in szyfrogram:
        is_lower = znak.islower()
        z = znak.upper()
        if z in alfabet:
            k = klucz[j % len(klucz)].upper()
            if k not in alfabet:
                continue
            i_text = alfabet.index(z)
            i_key = alfabet.index(k)
            litera = alfabet[(i_text - i_key + n) % n]
            tekst += litera.lower() if is_lower else litera
            j += 1
        else:
            tekst += znak
    return tekst


if __name__ == "__main__":
    print("Wybierz język (pl/en): ", end="")
    jezyk = input().strip()

    alfabet = pobierz_alfabet(jezyk)

    tekstJawny = input("Podaj tekst jawny: ")
    klucz = input("Podaj klucz: ")

    szyfrogram = szyfr_vigenere(tekstJawny, klucz, alfabet)
    print("Szyfrogram:", szyfrogram)

    odszyfrowany = odszyfr_vigenere(szyfrogram, klucz, alfabet)
    print("Odszyfrowany tekst:", odszyfrowany)
