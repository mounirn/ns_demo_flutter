// Defines the result of an action 
// status: 
//   -1 not executed
//   0  OK
//   > 0 error code (TBD)
class Result<T> {
  int status = -1;  
  T? data; 
  String? error;

  Result({required this.status, this.data,  this.error});
}