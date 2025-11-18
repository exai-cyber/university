import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
  static const String base='https://vpic.nhtsa.dot.gov/api/vehicles';

  Future<List<dynamic>> fetchMakesForCars() async {
    final uri=Uri.parse('$base/GetMakesForVehicleType/car?format=json');
    final res=await http.get(uri).timeout(const Duration(seconds: 10));
    if(res.statusCode == 200){
      final data = json.decode(res.body);
      return (data['Results'] as List<dynamic>);
    }
    throw Exception('Błąd pobierania marek (status: ${res.statusCode})');
  }

  Future<List<dynamic>> fetchModelsForMake(String make) async{
    final encoded=Uri.encodeComponent(make);
    final uri=Uri.parse('$base/GetModelsForMake/$encoded?format=json');
    final res=await http.get(uri).timeout(const Duration(seconds: 10));
    if (res.statusCode == 200){
      final data = json.decode(res.body);
      return (data['Results'] as List<dynamic>);
    }
    throw Exception('Błąd pobierania modeli (status: ${res.statusCode})');
  }
}
