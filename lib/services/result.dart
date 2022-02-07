class NsResult {
    int status;  
    String? error;
    Object? exception;
    NsResult({this.status = -1, this.error, this.exception});

    @override
    String toString() {
      return ("$status: $error - ${exception != null? exception?.toString() : ''}");
    }

    bool get notSuccess{
      return status != 0;
    }
}

// Defines the result of an action 
// status: 
//   -1 not executed
//   0 success
//   1 error 
//   >  error code (TBD)
class Result<T> extends NsResult{
  T? data; 
  
  Result({required int status, this.data, String? error, Object? exception}) : 
    super (status: status, error: error, exception: exception);

  @override
  bool get notSuccess{
      return status != 0 || data == null;
  }
}

class QueryResult<T> extends NsResult{
  List<T>? data; 
  
  QueryResult({required int status, this.data, String? error, Object? exception}) : 
    super (status: status, error: error, exception: exception);
}

/// Defines an action error condition
/// related to an API call
enum ErrorCode {
  none,
  processingError,
  invalidInput,
  objectNotFound,
  networkNotAvailable,
}