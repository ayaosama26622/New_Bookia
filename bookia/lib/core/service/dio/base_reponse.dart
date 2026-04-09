class BaseReponse {
  dynamic data;
  String? message;
  List<dynamic>? error;
  int? status;

  BaseReponse({this.data, this.message, this.error, this.status});

  factory BaseReponse.fromJson(Map<String, dynamic> json) {
    return BaseReponse(
      data: json['data'],
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
