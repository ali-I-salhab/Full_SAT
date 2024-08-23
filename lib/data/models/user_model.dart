import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UserModel extends Equatable {
  const UserModel(
      {required this.userId,
      required this.phone,
      this.name,
      this.email,
        this.gps,
        this.addressId,
      this.addressDescription,
     this.image,
        required this.status
      });

  final int userId;
  final String? name;
  final String phone;
  final String? email;
  final List? gps;
  final String? addressId;
  final String? addressDescription;
  final String? image;
  final String? status;

  @override
  List<Object?> get props => [this.userId];

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  userId: json["id"] ,
    phone: json['phone'],
    name: json['name'],
    email: json['email'],
    gps: json['gps'] ?? [],
    addressId: json['address_id'],
    addressDescription: json['address_desc'],
    image: json['image'],
    status: json['status']
  );

  Map<String, dynamic> toJson() => {
    "id": userId,
    "phone": phone,
    "name": name,
    "email":email,
    "gps":gps,
    "address_id":addressId,
    "address_desc": addressDescription,
    "image":image,
    "status":status
  };

}
