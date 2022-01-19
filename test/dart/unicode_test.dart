// ignore_for_file: avoid_print

import 'package:characters/characters.dart';

main() {
  var hi = 'Hi \u2665. \u{1f606}';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');

}