import 'package:flutter/material.dart';
import '../models/car_model.dart';

class ModelCard extends StatelessWidget{
  final CarModel model;
  final VoidCallback onTap;

  const ModelCard({required this.model, required this.onTap, super.key});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(model.modelName),
        subtitle: Text('Make: ${model.makeName} • Model ID: ${model.modelId}'),
        trailing: const Icon(Icons.info_outline),
        onTap: onTap,
      ),
    );
  }
}
