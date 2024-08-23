import 'package:equatable/equatable.dart';

class StoreModel extends Equatable{

  const StoreModel({
    required this.storeId,
    required this.storeName,
    required this.storeSpecialization,
    required this.storeLogo,
    required this.workHours,
    this.storeDesc
});

  final int storeId;
  final String storeSpecialization;
  final String storeName;
  final String storeLogo;
  final String workHours;
  final String? storeDesc;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    storeId: json['id'],
    storeName: json['name'],
    storeSpecialization: json['specialization'],
    storeLogo: json['logo'],
    storeDesc: json['description'],
    workHours: json['work_hours']
      );

  Map<String, dynamic> toJson() => {
    "id": storeId,
    "name": storeName,
    "specialization":storeSpecialization,
    "logo":storeLogo,
    "work_hours":workHours

  };


  @override
  // TODO: implement props
  List<Object?> get props => [this.storeId];
}