//class ServerExeption implements Exception {}

import '../network/error_message_model.dart';

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}



class ServerException implements Exception {

  final ErrorMessageModel errorMessageModel;

  ServerException({ required this.errorMessageModel});

}

// local
class LocalDataBaseException implements Exception{
  final String message;
  const LocalDataBaseException({required this.message});
}

