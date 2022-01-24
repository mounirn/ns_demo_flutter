//import 'package:flutter/material.dart';
// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';


class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using strategy from Effective Java,
  // Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  // You should generally implement operator == if you
  // override hashCode.
  @override
  bool operator ==(dynamic other) {
    if (other is! Person) return false;
    Person person = other;
    return (person.firstName == firstName &&
        person.lastName == lastName);
  }
}

/*
class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  @override
  Process get current => ...
  @override
  bool moveNext() => ...
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

*/


void main() {

  test('numbers', () {
    assert(int.parse('42') == 42);
    assert(int.parse('0x42') == 66);
    assert(double.parse('0.50') == 0.5);
  });
  test('', () {

  });

  test('numbers num class', () {
    assert(num.parse('42') is int);
    assert(num.parse('0x42') is int);
    assert(num.parse('0.50') is double);
  });

  test('parse numbers with radix', () {
      assert(int.parse('42', radix: 16) == 66);
  });

  test('toString ', () {
    // Convert an int to a string.
    assert(42.toString() == '42');

    // Convert a double to a string.
    assert(123.456.toString() == '123.456');

    // Specify the number of digits after the decimal.
    assert(123.456.toStringAsFixed(2) == '123.46');

    // Specify the number of significant figures.
    assert(123.456.toStringAsPrecision(2) == '1.2e+2');
    assert(double.parse('1.2e+2') == 120.0);
  });

  test('Search inside a string', () {
    // Check whether a string contains another string.
    assert('Never odd or even'.contains('odd'));

    // Does a string start with another string?
    assert('Never odd or even'.startsWith('Never'));

    // Does a string end with another string?
    assert('Never odd or even'.endsWith('even'));

    // Find the location of a string inside a string.
    assert('Never odd or even'.indexOf('odd') == 6);
  });

  test('Extract data from string', () {
    // Grab a substring.
    assert('Never odd or even'.substring(6, 9) == 'odd');

    // Split a string using a string pattern.
    var parts = 'structured web apps'.split(' ');
    assert(parts.length == 3);
    assert(parts[0] == 'structured');

    // Get a UTF-16 code unit (as a string) by index.
    assert('Never odd or even'[0] == 'N');

    // Use split() with an empty string parameter to get
    // a list of all characters (as Strings); good for
    // iterating.
    for (var char in 'hello'.split('')) {
      print(char);
    }

    // Get all the UTF-16 code units in the string.
    var codeUnitList =
        'Never odd or even'.codeUnits.toList();
    assert(codeUnitList[0] == 78);
  });

  test('Converting to uppercase or lowercase', () {
    // Convert to uppercase.
    assert('structured web apps'.toUpperCase() ==
        'STRUCTURED WEB APPS');

    // Convert to lowercase.
    assert('STRUCTURED WEB APPS'.toLowerCase() ==
        'structured web apps');
  });

  test('Trimming and empty strings', () {
    // Trim a string.
    assert('  hello  '.trim() == 'hello');

    // Check whether a string is empty.
    assert(''.isEmpty);

    // Strings with only white space are not empty.
    assert('  '.isNotEmpty);
  });
  test('Replacing part of a string', () {
    var greetingTemplate = 'Hello, NAME!';
    var greeting =
        greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

    // greetingTemplate didn't change.
    assert(greeting != greetingTemplate);
  });

  test('Building a string', () {
    var sb = StringBuffer();
    sb
      ..write('Use a StringBuffer for ')
      ..writeAll(['efficient', 'string', 'creation'], ' ')
      ..write('.');

    var fullString = sb.toString();

    assert(fullString ==
        'Use a StringBuffer for efficient string creation.');
  });

  test('Date and time', () {
    // Get the current date and time.
    var now = DateTime.now();
    print("Now:" + now.toString());
    // Create a new DateTime with the local time zone.
    var y2k = DateTime(2000); // January 1, 2000
    print("Y2K:" + y2k.toString());

    // Specify the month and day.
    y2k = DateTime(2000, 1, 2); // January 2, 2000

    // Specify the date as a UTC time.
    y2k = DateTime.utc(2000); // 1/1/2000, UTC

    // Specify a date and time in ms since the Unix epoch.
    y2k = DateTime.fromMillisecondsSinceEpoch(946684800000,
        isUtc: true);

    // Parse an ISO 8601 date.
    y2k = DateTime.parse('2000-01-01T00:00:00Z');
  });

  test('millisecondsSinceEpoch', () {
    // 1/1/2000, UTC
    var y2k = DateTime.utc(2000);
    assert(y2k.millisecondsSinceEpoch == 946684800000);

    // 1/1/1970, UTC
    var unixEpoch = DateTime.utc(1970);
    assert(unixEpoch.millisecondsSinceEpoch == 0);
  });

  test('Duration / Time Span', () {
    var y2k = DateTime.utc(2000);

    // Add one year.
    var y2001 = y2k.add(const Duration(days: 366));
    assert(y2001.year == 2001);

    // Subtract 30 days.
    var december2000 = y2001.subtract(const Duration(days: 30));
    assert(december2000.year == 2000);
    assert(december2000.month == 12);

    // Calculate the difference between two dates.
    // Returns a Duration object.
    var duration = y2001.difference(y2k);
    assert(duration.inDays == 366); // y2k was a leap year.
  });

  test('Comparable Interface/Abstract class', () {
    var short = const Line(1);
    var long = const Line(100);
    assert(short.compareTo(long) < 0);
  });

  test('Hascode and Equality of Objects', () {
    var p1 = Person('Bob', 'Smith');
    var p2 = Person('Bob', 'Smith');
    var p3 = 'not a person';
    assert(p1.hashCode == p2.hashCode);
    assert(p1 == p2);
    assert(p1 != p3);
  });

  /** Dot not edit -- keep for adding new tests 
  test('', () {

  });

  test('', () async {

  });*/
  test ('URI encode/decode', () {
    var uri = 'https://example.org/api?foo=some message';

    var encoded = Uri.encodeComponent(uri);
    assert(encoded ==
        'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

    var decoded = Uri.decodeComponent(encoded);
    assert(uri == decoded);
 
  });
}