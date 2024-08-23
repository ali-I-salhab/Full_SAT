
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/logic/join_us/worker_application_cubit/worker_application_state.dart';

class WorkerApplicationCubit extends Cubit<WorkerApplicationState> {
  WorkerApplicationCubit() : super(WorkerApplicationInitial());

  static WorkerApplicationCubit get(BuildContext context) => BlocProvider.of<WorkerApplicationCubit>(context);

  String? workerContractCompany ;
  String? workerJob ;
  String? workerDriverLic ;
  String? workerVehicle ;

  String? workerEducation ;

  TextEditingController workerAge = TextEditingController();
  TextEditingController workerfullName = TextEditingController();
  TextEditingController expecedSalary = TextEditingController();

  File? workerImage;


}
