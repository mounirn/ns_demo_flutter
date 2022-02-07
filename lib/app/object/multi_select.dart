
import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';
import 'icon.dart';

/// Multi Select widget to allow the selection of multiple items from a list
/// Uses a dialog to display the list
class NsMultiSelectDialog extends StatefulWidget {
  final List<NsAppObject> items;
  const NsMultiSelectDialog({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<NsMultiSelectDialog> {
  // this variable holds the selected items
  final List<NsAppObject> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(NsAppObject itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item.code!),
                    subtitle: Text(item.name!),
                    secondary: NsIcon(object:item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
