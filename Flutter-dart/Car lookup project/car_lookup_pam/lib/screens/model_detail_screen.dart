import 'package:flutter/material.dart';
import '../models/car_model.dart';

class ModelDetailScreen extends StatelessWidget{
  final CarModel model;
  const ModelDetailScreen({required this.model, super.key});

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children:[
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Szczegóły modelu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(model.modelName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _infoRow('ID modelu:', model.modelId.toString()),
            _infoRow('Producent:', model.makeName),
            _infoRow('ID producenta:', model.makeId.toString()),
          ],
        ),
      ),
    );
  }
}
