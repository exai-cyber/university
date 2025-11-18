class CarModel {
  final int modelId;
  final String modelName;
  final int makeId;
  final String makeName;
  final String? vehicleType;

  CarModel({
    required this.modelId,
    required this.modelName,
    required this.makeId,
    required this.makeName,
    this.vehicleType,
  });

  factory CarModel.fromJson(Map<String, dynamic> json, String makeNameFromArg){
    final modelId = json['Model_ID'] ??
        json['ModelId'] ??
        json['model_id'] ??
        (json['ModelId'] is int ? json['ModelId'] : null);
    int parsedId;
    if(modelId is int){
      parsedId=modelId;
    }
    else{
      parsedId=int.tryParse(modelId.toString()) ?? 0;
    }

    final modelName=(json['Model_Name'] ?? json['Model'] ?? json['model_name'] ?? '').toString().trim();
    final makeId=json['MakeId'] ?? json['Make_ID'] ?? json['make_id'];
    int parsedMakeId;
    if(makeId is int){
      parsedMakeId = makeId;
    }
    else{
      parsedMakeId = int.tryParse(makeId?.toString() ?? '') ?? 0;
    }

    final vehicleType=(json['VehicleTypeName'] ?? json['vehicle_type'])?.toString();

    return CarModel(
      modelId: parsedId,
      modelName: modelName,
      makeId: parsedMakeId,
      makeName: makeNameFromArg,
      vehicleType: vehicleType,
    );
  }

  factory CarModel.fromDb(Map<String, dynamic> db){
    return CarModel(
      modelId: db['model_id'] as int,
      modelName: db['model_name'] as String,
      makeId: db['make_id'] as int,
      makeName: db['make_name'] as String,
      vehicleType: (db['vehicle_type'] as String?)?.isEmpty == true ? null : db['vehicle_type'] as String?,
    );
  }

  Map<String, dynamic> toDb() => {
    'model_id': modelId,
    'model_name': modelName,
    'make_id': makeId,
    'make_name': makeName,
    'vehicle_type': vehicleType ?? '',
  };

  @override
  String toString() => 'CarModel(id: $modelId, name: $modelName, make: $makeName)';
}
