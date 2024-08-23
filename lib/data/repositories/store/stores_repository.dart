import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/store_model.dart';
import 'package:osta/data/models/store_product.dart';

class StoreRepo{

  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();


  Future<Either<Failure, List<StoreModel>>> getAllStores({required int pageNum,String? category}) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final Response response ;
        if(category == null){
       response  = await DioHelper.dio!.get(EndPoints.stores+'?page=$pageNum',
        );}
        else{
          response  = await DioHelper.dio!.get(EndPoints.stores+'?type=$category&page=$pageNum',);
        }
        if(response.statusCode==200){
          print('response of dio call get stores $response');
          final List<StoreModel> stores =
              List<StoreModel>.from(response.data['data'].map((x)=> StoreModel.fromJson(x))) ?? [] ;
          return Right(stores);}
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

  Future<Either<Failure, List<StoreProductModel>>> getAllStoreProducts(int pageNum,int storeId) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final response = await DioHelper.dio!.get(EndPoints.stores+'/$storeId?page=$pageNum',
        );
        if(response.statusCode==200){
          print('response of dio call get products $response');
          final List<StoreProductModel> products =
              List<StoreProductModel>.from(response.data['data'].map((x)=> StoreProductModel.fromJson(x))) ?? [] ;
          return Right(products);
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

}