class NsResult {
    int status;  
    String? error;
    Object? execption;
    NsResult({this.status = -1, this.error, this.execption});
}

// Defines the result of an action 
// status: 
//   -1 not executed
//   0 success
//   1 error 
//   >  error code (TBD)
class Result<T> extends NsResult{
  T? data; 
  
  Result({required int status, this.data, String? error, Object? excpetion}) : 
    super (status: status, error: error, execption: excpetion);
}

class QueryResult<T> extends NsResult{
  List<T>? data; 
  
  QueryResult({required int status, this.data, String? error, Object? excpetion}) : 
    super (status: status, error: error, execption: excpetion);
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