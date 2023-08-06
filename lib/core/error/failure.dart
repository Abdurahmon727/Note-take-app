import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String errorMessage;
  final num statusCode;

  ServerFailure({this.errorMessage = '', this.statusCode = 0});
}

class CacheFailure extends Failure {}
