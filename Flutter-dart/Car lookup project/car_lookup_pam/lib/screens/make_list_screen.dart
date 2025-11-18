import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/make_viewmodel.dart';
import '../viewmodels/model_viewmodel.dart';
import '../widgets/make_card.dart';
import 'model_list_screen.dart';

class MakeListScreen extends StatefulWidget{
  const MakeListScreen({super.key});

  @override
  State<MakeListScreen> createState() => _MakeListScreenState();
}

class _MakeListScreenState extends State<MakeListScreen>{
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<MakeViewModel>().loadMakes();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wybierz markę"),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<MakeViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage != null){
            return Center(child: Text(vm.errorMessage!));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Szukaj marki...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: vm.searchMakes,
                ),
              ),
              Expanded(
                child: vm.displayedMakes.isEmpty
                    ? const Center(child: Text('Brak wyników'))
                    : ListView.builder(
                  itemCount: vm.displayedMakes.length,
                  itemBuilder: (_, index) {
                    final make = vm.displayedMakes[index];
                    return MakeCard(
                      make: make,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ModelListScreenWrapper(makeName: make.name),
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

// wrapper tworzy lokalny provider dla ModelViewModel i od razu ładuje modele
class ModelListScreenWrapper extends StatelessWidget {
  final String makeName;
  const ModelListScreenWrapper({required this.makeName, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelViewModel>(
      create: (_) => ModelViewModel()..loadModels(makeName),
      child: ModelListScreen(makeName: makeName),
    );
  }
}
