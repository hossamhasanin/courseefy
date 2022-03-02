class DataException implements Exception{
  final String message;
  final String code;

  DataException(this.message, this.code);
}