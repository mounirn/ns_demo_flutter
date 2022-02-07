import 'package:flutter/material.dart';
import 'package:ns_demo/widgets/loading.dart';

import '../../models/object_helper.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_data.dart';
import '../../serializables/app_client.dart';
class NsAppClients extends StatelessWidget {
  const NsAppClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.read<NsAppSettingsData>();
    if (model.participatingClients == null){
      return const Center(
        child: NsLoadingWidget("")
      );
    }
    return CustomScrollView(
        slivers: [
         // _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index),
                childCount: model.participatingClients?.length
            ),   
          ),
        ],
      );
  }
}

class _SelectButton extends StatelessWidget {
  final NsAppClient item;

  const _SelectButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isSelected = context.select<NsAppSettingsData, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (model) => model.selectedClientId == (item.id),
    );

    return TextButton(
      onPressed: isSelected
          ? null
          : () {
              // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var model = context.read<NsAppSettingsData>();
              model.setSelectedClient(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isSelected
          ? const Icon(Icons.check, semanticLabel: 'Selected')
          : const Text('Select'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<NsAppSettingsData, NsAppClient?>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (model) => model.participatingClients?.elementAt(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: 
                item.hasNoImage == true? 
                  Container(
                    color: Colors.blue,
                  ) :
                  Image.network(item.imageUrl!)
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name!, style: textTheme),
            ),
            const SizedBox(width: 24),
            _SelectButton(item: item),
          ],
        ),
      ),
    );
  }
}