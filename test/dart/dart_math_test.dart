import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

main(){
   test('numbers', () {
    assert(cos(pi) == -1.0);

    // Sine
    var degrees = 30;
    var radians = degrees * (pi / 180);
    // radians is now 0.52359.
    var sinOf30degrees = sin(radians);
    // sin 30° = 0.5
    assert((sinOf30degrees - 0.5).abs() < 0.01);
  });

  test('max and min', () {
    assert(max(1, 1000) == 1000);
    assert(min(1, -1000) == -1000);
    
    // See the Math library for additional constants.
    print("e: " + e.toString()); // 2.718281828459045
    print("pi: " + pi.toString()); // 3.141592653589793
    print("sqrt2: " + sqrt2.toString()); // 1.4142135623730951
    
  });

  test('Random class', () {
    var random = Random();
    random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
    random.nextInt(10); // Between 0 and 9.
    random.nextBool(); // true or false
  });


  /** Dot not edit -- keep for adding new tests 
  test('', () {

  });

  test('', () async {

  });*/

}