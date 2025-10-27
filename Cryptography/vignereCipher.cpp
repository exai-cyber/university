#include <iostream>
#include <string>
#include <cctype>

using namespace std;

string szyfrVigenere(const string& tekst, const string& klucz) {
    string szyfrogram = "";
    int kluczLen = klucz.length();
    for (size_t i = 0, j = 0; i < tekst.length(); ++i) {
        if (isalpha(tekst[i])) {
            char litera = toupper(tekst[i]);
            char kluczLitera = toupper(klucz[j % kluczLen]);
            char zaszyfrowana = ((litera - 'A') + (kluczLitera - 'A')) % 26 + 'A';
            szyfrogram += zaszyfrowana;
            j++;
        } else {
            szyfrogram += tekst[i];
        }
    }
    return szyfrogram;
}

string odszyfrVigenere(const string& szyfrogram, const string& klucz) {
    string tekst = "";
    int kluczLen = klucz.length();
    for (size_t i = 0, j = 0; i < szyfrogram.length(); ++i) {
        if (isalpha(szyfrogram[i])) {
            char litera = toupper(szyfrogram[i]);
            char kluczLitera = toupper(klucz[j % kluczLen]);
            char odszyfrowana = ((litera - kluczLitera + 26) % 26) + 'A';
            tekst += odszyfrowana;
            j++;
        } else {
            tekst += szyfrogram[i];
        }
    }
    return tekst;
}

int main() {
    string tekstJawny, klucz;

    cout << "Podaj tekst jawny: ";
    getline(cin, tekstJawny);

    cout << "Podaj klucz: ";
    getline(cin, klucz);

    string szyfrogram = szyfrVigenere(tekstJawny, klucz);
    cout << "Szyfrogram: " << szyfrogram << endl;

    string odszyfrowany = odszyfrVigenere(szyfrogram, klucz);
    cout << "Odszyfrowany tekst: " << odszyfrowany << endl;

    return 0;
}
