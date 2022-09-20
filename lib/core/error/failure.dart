import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object> get props=>[message];

}

class OffLineFailure extends Failure {
  const OffLineFailure(super.message);
}

class ServerFailure extends Failure {
   ServerFailure(super.message);
}

class EmptyCasheFailure extends Failure {
  EmptyCasheFailure(super.message);

}
