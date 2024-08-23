import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/worker_model.dart';

class WorkerRepo{

  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();


  Future<Either<Failure, List<WorkerModel>>> getAllWorkers(int pageNum) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final response = await DioHelper.dio!.get(EndPoints.allWorkers+'?page=$pageNum',
        );
        if(response.statusCode==200){
          print('response of dio call get all workers $response');
          final List<WorkerModel> allWorkers =
           List<WorkerModel>.from(response.data['data'].map((x)=> WorkerModel.fromJson(x))) ?? [] ;
          return Right(allWorkers);}
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