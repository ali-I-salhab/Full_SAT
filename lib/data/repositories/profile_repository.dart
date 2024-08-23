import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/user_model.dart';

class ProfileRepo{
  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();


  Future<Either<Failure,UserModel>> getUserInfo() async {
    if (await networkConnectionInfo.isConnected) {
      try {

        final response = await DioHelper.dio!.get(
          EndPoints.myAccount,);
        print('response of dio call get user info $response');
        if(response.statusCode == 200) {
          print(response.statusCode);
          print(response.data);
          print(response.data['user']['image']);
          final user = UserModel.fromJson(response.data['user']);
          return Right(user);
        }
        else{
          // throw DioException.badResponse(statusCode: response.statusCode!, requestOptions:RequestOptions(), response: response);
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // return Left(ServerFailure(errorMessage: e.toString()));
        }
      }
    }
    else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }


  Future<Either<Failure,UserModel>> editAccountInfo(
      {
         String? name,
         String? email,
         String? deviceToken,
         String? addressId,
         String? addressDesc,
         List<String>? gps,
      }) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        Map<String, dynamic> data = {
          "name": name,
          "email": email,
          "device_token":deviceToken,
          "address_id":addressId,
          "address_desc":addressDesc,
          "gps":gps
        };
        final response = await DioHelper.dio!.put(
            EndPoints.editAccount, data: data);
        print('response of dio call edit account $response');
        if(response.statusCode == 200) {
          final user = UserModel.fromJson(response.data['user']);
          return Right(user);
        }
        else{
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // return Left(ServerFailure(errorMessage: e.toString()));
          }
        }
      }
    else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }


  Future<Either<Failure,UserModel>> changeProfileImage(
      {
        required File image
      }) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        Map<String, dynamic> data = {
          "image": image
        };
        var formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(image.path, filename: 'profile'),
        });
        print(formData);
        final response = await DioHelper.dio!.post(
            EndPoints.changeProfileImage, data: formData,options: Options(contentType: 'multipart/form-data'));
        print('response of dio call change profile image $response');
        if(response.statusCode == 200) {
          print(response.data['user']);
          final user = UserModel.fromJson(response.data['user']);

          return Right(user);
        }
        else{
          // throw DioException.badResponse(statusCode: response.statusCode!, requestOptions:RequestOptions(), response: response);
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // return Left(ServerFailure(errorMessage: e.toString()));
        }
      }
    }
    else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }


  Future<Either<Failure,UserModel>> deleteProfileImage(
      {
        required String phoneNumber
      }) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        Map<String, dynamic> data = {
          "phoneNumber": phoneNumber
        };
        final response = await DioHelper.dio!.delete(
            EndPoints.deleteProfileImage, data: data,queryParameters: data);
        print('response of dio call change profile image $response');
        if(response.statusCode == 200) {
          final user = UserModel.fromJson(response.data['user']);
          return Right(user);
        }
        else{
          throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
          // return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }
        else{
          return Left(ServerFailure(errorMessage: e.toString()));
        }
      }
    }
    else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }



}