Car Lookup



Aplikacja mobilna w flutter, wyświetlająca marki oraz modele samochodów z publicznego API NHTSA https://vpic.nhtsa.dot.gov/api/.



Funkcje aplikacji

* Lista marek samochodów
* Wyszukiwarka marek i modeli
* Lista modeli dla wybranej marki
* Ekran szczegółów modelu
* Cache offline w SQLite



Struktura folderu lib:
```
lib/
├── main.dart: Punkt startowy aplikacji. Provider’y i uruchamia pierwszy ekran.
│
├── models/
│ ├── make.dart - Klasa reprezentująca markę samochodu.
│ └── car_model.dart - Klasa reprezentująca pojedynczy model samochodu.
│
├── services/
│ └── api_service.dart - Obsługa połączenia do API.
│
├── storage/
│ └── db_provider.dart - Zapis i odczyt cache w SQLite
│
├── viewmodels/
│ ├── make_viewmodel.dart - Zarządzanie stanem ekranu.
│ └── model_viewmodel.dart - Pobieranie i filtrowanie modeli marki.
│
├── screens/
│ ├── make_list_screen.dart - Ekran wszystkich marek.
│ ├── model_list_screen.dart - Ekran modeli.
│ └── model_detail_screen.dart - Ekran szczegółów.
│
└── widgets/
├── make_card.dart - Wygląd marek.
└── model_card.dart - Wygląd modeli.
```
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
