import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/address_model.dart';
import 'package:osta/data/models/category_model.dart';
import 'package:osta/data/models/language_key_model.dart';

class CategoriesRepo{
  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();

  Future<Either<Failure, ServiceCategory>> getCategories(String type) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final response = await DioHelper.dio!.get(EndPoints.categories+'/$type',);
        if(response.statusCode==200){
          print('response of dio call get categories $response');
          final ServiceCategory serviceCategories = ServiceCategory.fromJson(response.data);
          return Right(serviceCategories);}
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

}