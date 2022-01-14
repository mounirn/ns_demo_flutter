import 'package:flutter_test/flutter_test.dart';

Stream<int> countStream(int max) async* {
      for (int i = 0; i < max; i++) {
        yield i;
      }
    }

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}
void main() {
  
  test('stream test', () async{
    Stream<int> stream = countStream(10);
    /// Compute the sum of the stream of integers
    int sum = await sumStream(stream);
    /// Print the sum
    print(sum); // 45 
    assert (sum == 45, true);
  });
}
