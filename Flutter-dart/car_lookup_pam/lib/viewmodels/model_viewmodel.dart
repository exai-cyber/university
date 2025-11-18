import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/car_model.dart';
import '../services/api_service.dart';
import '../storage/db_provider.dart';

class ModelViewModel extends ChangeNotifier{
  final ApiService api = ApiService();
  final DBProvider db = DBProvider.instance;

  List<CarModel> allModels = [];
  List<CarModel> displayedModels = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadModels(String makeName) async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try{
      final cached = await db.getModelsForMake(makeName);
      if(cached.isNotEmpty){
        allModels = cached.map((r) => CarModel.fromDb(r)).toList();
        displayedModels = List.from(allModels);
        isLoading = false;
        notifyListeners();
        return;
      }
      final jsonList=await api.fetchModelsForMake(makeName);
      final toInsert=<Map<String, dynamic>>[];
      final temp=<CarModel>[];
      for (final item in jsonList) {
        final map=Map<String, dynamic>.from(item);
        final cm=CarModel.fromJson(map, makeName);
        temp.add(cm);
        toInsert.add(cm.toDb());
      }
      if(toInsert.isNotEmpty){
        await db.clearModelsForMake(makeName);
        await db.insertModels(toInsert);
      }
      allModels = temp;
      displayedModels = List.from(allModels);
    }
    catch (e){
      errorMessage = 'Błąd pobierania modeli: $e';
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }

  void clearModels() {
    allModels = [];
    displayedModels = [];
    notifyListeners();
  }

  void searchModels(String q) {
    final text = q.trim().toLowerCase();
    if (text.isEmpty) {
      displayedModels = List.from(allModels);
    } else {
      displayedModels = allModels.where((m) => m.modelName.toLowerCase().contains(text)).toList();
    }
    notifyListeners();
  }
}
