import 'package:flutter/material.dart';
import '../models/make.dart';

class MakeCard extends StatelessWidget{
  final Make make;
  final VoidCallback onTap;

  const MakeCard({required this.make, required this.onTap, super.key});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(make.name),
        subtitle: Text('ID: ${make.id}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
