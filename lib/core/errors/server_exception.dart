class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Sever Error Occurred'});

}