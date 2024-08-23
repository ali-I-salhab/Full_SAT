

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/repositories/categories_repo.dart';
import 'package:osta/data/repositories/field_info_repo.dart';
import 'package:osta/data/repositories/order/order_repository.dart';
import 'package:osta/logic/main_cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context) => BlocProvider.of<MainCubit>(context);
  List<String> multipleFieldValues = [];
  String? choseDate;

  // List<FieldInfo> screenField =[
  //   FieldInfo.fromJson({
  //     "name": "name",
  //     "label": "name",
  //     "type": "text",
  //     "placeholder": "enter name"
  //   },),
  //   FieldInfo.fromJson({
  //     "name": "number_of_rooms",
  //     "label": "number of rooms",
  //     "type": "number",
  //     "placeholder": "Enter number of rooms",
  //     "min": 0
  //   },),
  //   FieldInfo.fromJson({
  //     "name": "date_input",
  //     "label": "Date Input",
  //     "type": "date",
  //     "date": "2024-02-26"
  //   },),
  //   FieldInfo.fromJson(  {
  //     "name": "more_details",
  //     "label": "more details",
  //     "type": "textarea",
  //     "placeholder": "Enter more details"
  //   },),
  //   FieldInfo.fromJson(  {
  //     "name": "sterilization_furnishings",
  //     "label": "Sterilization of home furnishings",
  //     "type": "checkbox",
  //     "value": false
  //   },),
  //   FieldInfo.fromJson( {
  //     "name": "furnishings",
  //     "label": "furnishings",
  //     "type": "radio",
  //     "options": [
  //       {
  //         "value": "1",
  //         "label": "Furnished"
  //       },
  //       {
  //         "value": ".",
  //         "label": "Unfurnished"
  //       }
  //     ],
  //     "selectedValue": 0
  //   }),
  //
  //
  // ];
  List<FieldInfo> screenField = [];
  Map<String,Map<String,dynamic>> userInputs = {};


  FieldInfoRepository fieldInfoRepository = FieldInfoRepository();
  CategoriesRepo categoriesRepo = CategoriesRepo();
  OrderRepository orderRepository = OrderRepository();

  List<PlatformFile> pickedFiles = [];

  void removeFile(int index){
    pickedFiles.removeAt(index);
    emit(RemovePickedFile());
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,);
      // FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,);

      if (result != null) {
        pickedFiles.add( result.files.single );
        // pickedFiles = result.paths.map((path) => File(path!)).toList();
        emit(AddPickedFile(pickedFiles: pickedFiles));
      } else {
        // User canceled the picker
        return ;
      }
    } on PlatformException catch (e) {
      print('Failed to pick file: $e');
      return ;
    }
  }

  Future<void> getCategories(String type) async{
    emit(GetCategoriesLoadingState());
    await categoriesRepo.getCategories(type).then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(GetCategoriesErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
        emit(GetCategoriesSuccessState(categories: r));
          } );
    });
  }

  Future<void> getScreenForm(int catId) async{
    userInputs.clear();
    multipleFieldValues.clear();
    choseDate = null;
    pickedFiles.clear();
    emit(GetScreenFormLoadingState());
    await fieldInfoRepository.getScreenFields(catId).then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(GetScreenFormErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
        r.serviceFields.forEach((element) {
          userInputs.addAll(
              {
                element.name: {
                  "value": element.defaultVal,
                  "cost": element.price ?? null
                }
              }
          );
        });
        // userInputs.addEntries(r.map((e) {return e.name ;}).iterator );
            print(userInputs);
        emit(GetScreenFormSuccessState(serviceFields: r));
          } );
    });
  }

  Future<void> sendOrderDate({required Map<String,Map<String,dynamic>> data,required int id,required String updated}) async{
    emit(SendDataLoadingState());

    await orderRepository.sendOrderDetails(data,id,updated).then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(SendDataErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
                emit(SendDataSuccessState(invoice: r));
          } );
    });
  }

  Future<void> createClientOrder({required Map<String,Map<String,dynamic>> data,required InvoiceModel invoice,required int id,required String updated}) async{
    emit(CreateClientOrderLoadingState());

    await orderRepository.createClientOrder(fields: data,id: id,updatedAt: updated,invoice: invoice).then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(CreateClientOrderErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
        pickedFiles.clear();
        multipleFieldValues.clear();
        choseDate = null;
        userInputs.clear();
                emit(CreateClientOrderSuccessState(orderDetails: r));
          } );
    });
  }


}
