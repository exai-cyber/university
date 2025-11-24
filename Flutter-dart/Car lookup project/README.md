Car Lookup



Aplikacja mobilna w flutter, wyświetlająca marki oraz modele samochodów z publicznego API NHTSA https://vpic.nhtsa.dot.gov/api/.



Funkcje aplikacji

* Lista marek samochodów
* Wyszukiwarka marek i modeli
* Lista modeli dla wybranej marki
* Ekran szczegółów modelu
* Cache offline w SQLite



Struktura folderu lib:
'''
lib/
├── main.dart
│
├── models/
│   ├── make.dart
│   └── car\_model.dart
│
├── services/
│   └── api\_service.dart
│
├── storage/
│   └── db\_provider.dart
│
├── viewmodels/
│   ├── make\_viewmodel.dart
│   └── model\_viewmodel.dart
│
├── screens/
│   ├── make\_list\_screen.dart
│   ├── model\_list\_screen.dart
│   └── model\_detail\_screen.dart
│
└── widgets/
    ├── make\_card.dart
    └── model\_card.dart

'''
**Instrukacja uruchomienia:**
1. Wymagania

* Flutter SDK >= 3.x
* DART SDK
* Android studio z emulatorem androida lub fizyczny telefon z Androidem

-Uwaga: aplikacja wymaga połączenia z internetem żeby pobierać dane z API, po pierwszym pobraniu i wejściu w daną markę i model dane są zapisane w cache.



2\. Pobieranie zależności

W folderze projektu (tam gdzie znajduje sie pubspec.yaml) należy wykonać komendę **flutter pub get**



3\. Uruchamianie aplikacji



**A. Android studio**

1. Uruchom emulator Androida lub podłącz telefon
2. Kliknij przycisk run w górnym prawym rogu(upewnij się że wybrałeś telefon na którym ma być uruchomiony program)



**B. Terminal**

1. Wykonaj komendę **flutter run**
