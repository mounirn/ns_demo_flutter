import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

main(){
   test('JSON String', () {
    // NOTE: Be sure to use double quotes ("),
    // not single quotes ('), inside the JSON string.
    // This string is JSON, not Dart.
    var jsonString = '''
      [
        {"score": 40},
        {"score": 80}
      ]
    ''';

    var scores = jsonDecode(jsonString);
    assert(scores is List);

    var firstScore = scores[0];
    assert(firstScore is Map);
    assert(firstScore['score'] == 40);
  });

  test('JSON Encode', () {
    // Only objects of type int, double, String, bool, null, List, or 
    // Map (with string keys) are directly encodable into JSON. 
    // List and Map objects are encoded recursively.

    var scores = [
      {'score': 40},
      {'score': 80},
      {'score': 100, 'overtime': true, 'special_guest': null}
    ];

    var jsonText = jsonEncode(scores);
    assert(jsonText ==
        '[{"score":40},{"score":80},'
            '{"score":100,"overtime":true,'
            '"special_guest":null}]');
  });

  test('Decoding and encoding UTF-8 characters', () {
    List<int> utf8Bytes = [
      0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
      0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
      0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
      0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
      0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
    ];

    var funnyWord = utf8.decode(utf8Bytes);

    assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');
  });


  /** Dot not edit -- keep for adding new tests 
  test('', () {

  });

  test('', () async {

  });*/

}