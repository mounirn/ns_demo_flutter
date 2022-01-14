// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

main(){
   test('Read text file', () async {
      var config = File('assets/config.json');
      var contents;

      // Put the whole file in a single string.
      contents = await config.readAsString();
      print('The file is ${contents.length} characters long.');

      // Put each line of the file into its own string.
      contents = await config.readAsLines();
      print('The file is ${contents.length} lines long.');
  });

  test('Read as binary file', () async {
    var config = File('assets/config.json');

    var contents = await config.readAsBytes();
    print('The file is ${contents.length} bytes long.');
  });

  test('Handling errors', () async {
    var config = File('config.txt');
    try {
      var contents = await config.readAsString();
      print(contents);
    } catch (e) {
      print(e);
    }
  });

  test('Streaming file content', () async {
      var config = File('assets/config.txt');
      Stream<List<int>> inputStream = config.openRead();

      var lines =
          utf8.decoder.bind(inputStream).transform(LineSplitter());
      try {
        await for (var line in lines) {
          print('Got ${line.length} characters from stream');
        }
        print('file is now closed');
      } catch (e) {
        print(e);
      }
  });

  test('writing file contents', () async {
    var logFile = File('logs/log.txt');
    var sink = logFile.openWrite();
    sink.write('FILE ACCESSED ${DateTime.now()}\n');
    await sink.flush();
    await sink.close();
  });

  test('append to file contents', () async {
    var logFile = File('logs/log.txt');
    var sink = logFile.openWrite(mode: FileMode.append);;
    sink.write('FILE ACCESSED ${DateTime.now()}\n');
    await sink.flush();
    await sink.close();
  });

  test('lsit files in a directory', () async {
    var dir = Directory('logs');

    try {
      var dirList = dir.list();
      await for (FileSystemEntity f in dirList) {
        if (f is File) {
          print('Found file ${f.path}');
        } else if (f is Directory) {
          print('Found dir ${f.path}');
        }
      }
    } catch (e) {
      print(e.toString());
    }
  });


  /** Dot not edit -- keep for adding new tests 
  test('', () {

  });

  test('', () async {

  });*/

}