import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class WorkerModel extends Equatable {
  const WorkerModel(
      {
    required this.userId,
        required this.workerId,
        required this.workerName,
        required this.jobType,
        required this.company,
        required this.cityId,
        required this.workerGps,
        required this.workerAddressDesc,
        required this.workerEducation,
         this.workerImage,
        required this.workerCv,
         this.driverLicence,
        required this.workerSalary,
        required this.workType,
        required this.workerNationality,
        required this.workerPhones,
        required this.workerLanuages,
        required this.workerAge,
        required this.workerGender,
        required this.workerStatus,
      });

  final int userId;
  final int workerId;
  final String workerName;
  final String jobType;
  final String company;
  final int cityId;
final List workerGps;
final String workerAddressDesc ;
final String workerEducation ;
final String? workerImage;
final String workerCv;
final String? driverLicence;
final int workerSalary;
final String workType;
final String workerNationality;
final List workerPhones;
final List workerLanuages;
final String workerAge;
final String workerGender;
final String workerStatus;



  @override
  List<Object?> get props => [this.userId];

  factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
      userId: json["user_id"],
      workerId: json['id'],
      workerName: json['name'],
      jobType: json['job_type'],
      company: json['company'],
      cityId: json['city_id'],
      workerGps: json['gps'] ?? [],
      workerAddressDesc: json['address_desc'],
      workerEducation: json['education'],
      workerImage: json['profile_image'],
      workerCv: json['cv_url'],
      driverLicence: json['driver_license_url'],
      workerSalary: json['salary'],
      workType: json['work_type'],
      workerNationality: json['nationality'],
      workerPhones: json['phones'],
      workerLanuages: json['languages'],
      workerAge: json['age'],
      workerGender: json['gender'],
      workerStatus: json['status']
  );

  Map<String, dynamic> toJson() => {
    "id": workerId,
    "user_id":userId,
    "name":workerName,
    "job_type":jobType,
    "company":company,
    "city_id":cityId,
    "gps":workerGps,
    "address_desc":workerAddressDesc,
    "education":workerEducation,
    "profile_image":workerImage,
    "cv_url":workerCv,
    "driver_license_url":driverLicence,
    "salary":workerSalary,
    "work_type":workType,
    "phones":workerPhones,
    "languages":workerLanuages,
    "age":workerAge,
    "gender":workerGender,
    "status":workerStatus

  };

}
