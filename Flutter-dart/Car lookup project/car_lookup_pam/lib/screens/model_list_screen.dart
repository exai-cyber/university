import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/model_viewmodel.dart';
import '../widgets/model_card.dart';
import '../models/car_model.dart';
import 'model_detail_screen.dart';

class ModelListScreenWrapper extends StatelessWidget{
  final String makeName;
  const ModelListScreenWrapper({required this.makeName, super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<ModelViewModel>(
      create: (_) => ModelViewModel()..loadModels(makeName),
      child: ModelListScreen(makeName: makeName),
    );
  }
}

class ModelListScreen extends StatelessWidget{
  final String makeName;
  const ModelListScreen({required this.makeName, super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(makeName),
      ),
      body: Consumer<ModelViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage != null) {
            return Center(child: Text(vm.errorMessage!));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Szukaj modelu",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: vm.searchModels,
                ),
              ),

              Expanded(
                child: vm.displayedModels.isEmpty
                    ? const Center(child: Text('Brak wyników'))
                    : ListView.builder(
                  itemCount: vm.displayedModels.length,
                  itemBuilder: (context, index) {
                    final CarModel model = vm.displayedModels[index];

                    return ModelCard(
                      model: model,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ModelDetailScreen(model: model),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
