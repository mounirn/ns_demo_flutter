import 'package:flutter/cupertino.dart';
import 'package:ns_demo/providers/settings_data.dart';
import 'package:ns_demo/serializables/app_client.dart';
import 'package:provider/src/provider.dart';

class NsClientSearch extends StatefulWidget {
  const NsClientSearch({Key? key}) : super(key: key);

  @override
  State<NsClientSearch> createState() => _NsClientSearchState();
}

class _NsClientSearchState extends State<NsClientSearch> {
  late NsAppClientDetails? _client;
  late TextEditingController _textController;
  String _searchTerm = '';

  @override
  void initState() {

    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<NsAppSettingsData>();
    _client = model.getSelectedClientDetails();

    return Column(children: [
      Text(getClientName()),
      CupertinoSearchTextField(
        controller: _textController,
        onChanged: (String value) {
          handleOnChanged(value);
        },
        onSubmitted: (String value) {
          handleOnSubmitted(value);
        }),
        Text(_searchTerm)
      ], 

    );
  }

  handleOnChanged(String value){
    _searchTerm = value;
     setState(() {
      
    });
  }
    handleOnSubmitted(String value){
    _searchTerm = value;
    setState(() {
      
    });
  }

  String getClientName() {
    if (_client != null) {
      return _client?.name as String;
    }
    return 'Loading...';
  }
}