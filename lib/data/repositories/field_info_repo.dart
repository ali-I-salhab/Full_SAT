import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/address_model.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/data/models/language_key_model.dart';

class FieldInfoRepository{
  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();

  Future<Either<Failure, ServiceFields>> getScreenFields(int catId) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final response = await DioHelper.dio!.get(EndPoints.screenFields+'/$catId',
        );
        if(response.statusCode==200){
          print('response of dio call get form $response');
          final ServiceFields serviceFields = ServiceFields.fromJson(response.data);
              // List<FieldInfo>.from(response.data['form']['columns'].map((x)=> FieldInfo.fromJson(x))) ?? [] ;
          return Right(serviceFields);}
        else{
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        print(e);
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // Left(ServerFailure(errorMessage: e.toString()));
        }
      }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

  Future<Either<Failure, void>> sendOrderDetails(Map<String,dynamic> fields,int id) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        fields.map((k, v) {
          List<MultipartFile> uploadedFiles = [];
          if(v is List<File>) {
            v.forEach((element) async{
              uploadedFiles.add(await MultipartFile.fromFile(element.path,filename: element.path.split('/').last ));
            });
            print(uploadedFiles);
            fields.update(k, (value) => uploadedFiles);
          }
          return MapEntry(k, v);
        });

    print(fields);
    var formData = FormData.fromMap(fields);
print(formData.fields);
        final response = await DioHelper.dio!.post(EndPoints.sendOrder+'/$id',data: formData,options: Options(contentType: 'multipart/form-data'));
        if(response.statusCode==200){
          print('response of dio call send form $response');
          // final List<FieldInfo> screenField = List<FieldInfo>.from(response.data.map((x)=> FieldInfo.fromJson(x))) ?? [] ;
          return Right(null);
        }
        else{
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // Left(ServerFailure(errorMessage: e.toString()));
        }
      }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

}