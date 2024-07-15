class ApiResponse<T> {
  final T? data;
  final ApiStatus status;
  final String successMessage;
  final String errorMessage;

  ApiResponse.success(this.data, {this.successMessage = 'Success'})
      : status = ApiStatus.success,
        errorMessage = 'No error';

  ApiResponse.error(this.errorMessage)
      : status = ApiStatus.error,
        data = null,
        successMessage = 'No success';
}

enum ApiStatus {
  success,
  error,
}
