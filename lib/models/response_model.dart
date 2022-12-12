class ResponseModel {
  ResponseModel(this._isSuccess, this._message);

  final bool _isSuccess;
  final String _message;

  /// getters
  bool get isSuccess => _isSuccess;
  String get message => _message;
}
