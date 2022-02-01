import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Defines an app message 
class NsAppMessage {
  late DateTime time;
  final String message;
  final bool? error;  // three value (info == null, error = 1, success = 0)
  NsAppMessage(this.message, this.error) {
    time = DateTime.now();
  }
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
class NsAppMessages with ChangeNotifier {
  List<NsAppMessage> messages = [];

  /// appends a message to the list and notifies listeners
  void add(NsAppMessage message) {
    messages.add(message);
    notifyListeners();
  }

  /// adds a success message to the list
  void addError(String message) {
    add (NsAppMessage(message,true));
  }

  /// add a success message to the ist
  void addSuccess(String message) {
    add (NsAppMessage(message,false));
  }
  void addInfo(String message) {
    add (NsAppMessage(message,null));
  }
}
