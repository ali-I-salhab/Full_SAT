import 'package:equatable/equatable.dart';

class AddressModel extends Equatable{
  const AddressModel({required this.addressId,required this.addressName,required this.regions});

  final int addressId;
  final String addressName;
  final List<RegionModel> regions;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      addressId: json['id'],
    addressName: json['name'],
      regions: json['regions'] != null ? List<RegionModel>.from(
          json['regions'].map((x) => RegionModel.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "name":addressName,
    "id":addressId,
    "regions":List<RegionModel>.from(regions.map((e) => e.toJson()))
  };

  @override
  List<Object?> get props =>[this.addressId];
}

class RegionModel extends Equatable{
  const RegionModel({required this.regionId,required this.regionName,});

  final int regionId;
  final String regionName;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
      regionId: json['id'],
    regionName: json['name'],
  );

  Map<String, dynamic> toJson() => {
    "name":regionName,
    "id":regionId,
  };

  @override
  List<Object?> get props =>[this.regionId];
}