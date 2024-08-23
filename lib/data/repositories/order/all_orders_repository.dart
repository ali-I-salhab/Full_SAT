import 'dart:convert';
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
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/language_key_model.dart';
import 'package:osta/data/models/order_models/order_details.dart';

class AllOrdersRepository{
  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();

  Future<Either<Failure, List<OrderDetails>>> getAllOrders() async {
    if (await networkConnectionInfo.isConnected) {
      try {

        final response = await DioHelper.dio!.get(EndPoints.createOrder );
        if(response.statusCode==200){
          print('response of dio call get all orders $response');
          final List<OrderDetails> orders = List<OrderDetails>.from(response.data['data'].map((x)=> OrderDetails.fromJson(x))) ?? [] ;;
          return Right(orders);
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
          // return Left(ServerFailure(errorMessage: e.toString()));
        }
      }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

  Future<Either<Failure, OrderDetails>> createClientOrder({required Map<String,Map<String,dynamic>> fields,required InvoiceModel invoice,required int id,required String updatedAt}) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        fields.map((k, v) {
          List<MultipartFile> uploadedFiles = [];
          if(v['value'] is List<File>) {
            v['value'].forEach((element) async{
              uploadedFiles.add(await MultipartFile.fromFile(element.path,filename: element.path.split('/').last ));
            });
            print(uploadedFiles);
            fields.update(k, (value) => value.update('value', (files) => uploadedFiles));
          }
          return MapEntry(k, v);
        });

        // print(fields);
        var data = {
          "form_id": id,
          "updated_at":updatedAt,
          "fields": fields,
          "invoice": invoice.toJson()
        };
        print(data);
        var formData = FormData.fromMap(data);

        final response = await DioHelper.dio!.post(EndPoints.createOrder ,data: formData,options: Options(contentType: 'multipart/form-data'));
        if(response.statusCode==201){
          print('response of dio call create order $response');
          final OrderDetails orderDetails = OrderDetails.fromJson(response.data['data']) ;
          return Right(orderDetails);
        }
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
          // return Left(ServerFailure(errorMessage: e.toString()));
        }
      }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

}