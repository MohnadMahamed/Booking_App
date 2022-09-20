import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OffLineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCasheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
