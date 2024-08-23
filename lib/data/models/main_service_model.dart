import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MainService extends Equatable{

  const MainService({
  required this.serviceId,
  required this.serviceName,
  required this.serviceLogo,
  });

  final int serviceId;
  final String serviceName;
  final String serviceLogo;


  // factory MainService.fromJson(Map<String,dynamic> json)=>MainService(
  //     sectionId: json['id'],
  //     sectionName: json['name'],
  //     sectionDescription: json['desc'],
  //     sectionStatus: json['status'],
  //     createdAt: DateFormat("EEE, MMM d, yyyy").format(DateTime.parse(json['created_at']??''))
  // );

  // Map<String, dynamic> toJson() => {
  //   "id": sectionId,
  //   "name": sectionName,
  //   "desc": sectionDescription,
  //   "status": sectionStatus,
  //   "created_at": createdAt
  // };

  @override
  // TODO: implement props
  List<Object?> get props => [this.serviceId];
}