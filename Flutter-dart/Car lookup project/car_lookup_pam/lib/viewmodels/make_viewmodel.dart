import 'package:flutter/material.dart';
import '../models/make.dart';
import '../services/api_service.dart';
import '../storage/db_provider.dart';

class MakeViewModel extends ChangeNotifier{
  final ApiService api = ApiService();
  final DBProvider db = DBProvider.instance;

  List<Make> allMakes = [];
  List<Make> displayedMakes = [];

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadMakes() async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1-pobieranie z lokalnej bazy
      final cached = await db.getMakes();

      if (cached.isNotEmpty) {
        allMakes = cached.map((e) => Make.fromDb(e)).toList();
        displayedMakes = List.from(allMakes);
        isLoading = false;
        notifyListeners();
        return;
      }

      // 2-brak w cache - pobierz z API
      final jsonList = await api.fetchMakesForCars();

      final toInsert = <Map<String, dynamic>>[];

      for (final item in jsonList) {
        final make = Make.fromJson(item);
        toInsert.add(make.toDb());
      }

      // 3-zapisz do bazy danych
      await db.clearMakes();
      await db.insertMakes(toInsert);

      // 4-wczytaj z bazy
      final fromDb = await db.getMakes();
      allMakes = fromDb.map((e) => Make.fromDb(e)).toList();
      displayedMakes = List.from(allMakes);

    }
    catch (e) {
      errorMessage = 'Błąd pobierania listy marek';
    }

    isLoading = false;
    notifyListeners();
  }

  void searchMakes(String query){
    final q = query.trim().toLowerCase();

    if(q.isEmpty){
      displayedMakes = List.from(allMakes);
    }
    else{
      displayedMakes = allMakes
          .where((m) => m.name.toLowerCase().contains(q))
          .toList();
    }

    notifyListeners();
  }
}
