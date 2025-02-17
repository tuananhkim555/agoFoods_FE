class ApiError {
  final int? status;
  final String? message;
  final dynamic errorDetails;

  ApiError({
    this.status,
    this.message,
    this.errorDetails,
  });

  // Chuyển từ JSON sang đối tượng ApiError
  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      status: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorDetails: json['errorDetails'],
    );
  }

  // Chuyển từ đối tượng ApiError sang JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'errorDetails': errorDetails,
    };
  }

  @override
  String toString() {
    return 'ApiError(statusCode: $status, message: $message, errorDetails: $errorDetails)';
  }
}

// Hàm tiện ích để chuyển đổi phản hồi lỗi từ API
ApiError handleApiError(dynamic error) {
  if (error is Map<String, dynamic>) {
    // Nếu lỗi là JSON
    return ApiError.fromJson(error);
  } else if (error is String) {
    // Nếu lỗi là chuỗi
    return ApiError(message: error);
  } else {
    // Trường hợp lỗi không xác định
    return ApiError(
      message: 'An unexpected error occurred',
      errorDetails: error.toString(),
    );
  }
}