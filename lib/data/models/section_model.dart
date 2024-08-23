import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Section extends Equatable{

  const Section({
    required this.sectionId,required this.sectionName,required this.sectionDescription,required this.sectionStatus,required this.createdAt
});

  final String sectionId;
  final String sectionName;
  final String sectionDescription;
  final String sectionStatus;
  final String createdAt;

  factory Section.fromJson(Map<String,dynamic> json)=>Section(
      sectionId: json['id'],
      sectionName: json['name'],
      sectionDescription: json['desc'],
      sectionStatus: json['status'],
      createdAt: DateFormat("EEE, MMM d, yyyy").format(DateTime.parse(json['created_at']??''))
  );

  Map<String, dynamic> toJson() => {
  "id": sectionId,
  "name": sectionName,
  "desc": sectionDescription,
  "status": sectionStatus,
  "created_at": createdAt
  };

  @override
  // TODO: implement props
  List<Object?> get props => [this.sectionId];
}