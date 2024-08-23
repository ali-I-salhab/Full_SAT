

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_state.dart';

class JoinUsCubit extends Cubit<JoinUsState> {
  JoinUsCubit() : super(JoinUsInitial());
  static JoinUsCubit get(BuildContext context) => BlocProvider.of<JoinUsCubit>(context);

  bool newNumber = false ;
  bool newLanguage = false ;

  String selectedJob = 'worker';

  void changeSelectedJob(String job){
    selectedJob = job;
    emit(ChangeSelectedJobState(selectedJob :job));
  }

  Future<File?> pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then(
          (value) async {
        if (value != null) {
         final pickedImage = File(value.path);
          print(pickedImage);
          return pickedImage;
          // emit(PickImageFromGallery());
        }
      },
    );
    // });
  }

  // Future<void> pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,);
  //     // FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,);
  //
  //     if (result != null) {
  //
  //       emit(AddPickedFile(pickedFiles: pickedFiles));
  //     } else {
  //       // User canceled the picker
  //       return ;
  //     }
  //   } on PlatformException catch (e) {
  //     print('Failed to pick file: $e');
  //     return ;
  //   }
  // }


  void toggleAddNumber(){
    newNumber = !newNumber;
    emit(AddNewToggleState(addNew :newNumber));
  }
  void toggleAddLanguage(){
    newLanguage = !newLanguage;
    emit(AddNewToggleState(addNew :newLanguage));
  }
}
