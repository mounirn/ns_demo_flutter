import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/drawer.dart';
import '../providers/counter.dart';

class CounterWithProviderScreen extends StatelessWidget {
  const CounterWithProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildAppDrawer(context),
      appBar: AppBar(
        title: const Text('Counter With Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can access your providers anywhere you have access
          // to the context. One way is to use Provider.of<Counter>(context).
          //
          // The provider package also defines extension methods on context
          // itself. You can call context.watch<Counter>() in a build method
          // of any widget to access the current state of Counter, and to ask
          // Flutter to rebuild your widget anytime Counter changes.
          //
          // You can't use context.watch() outside build methods, because that
          // often leads to subtle bugs. Instead, you should use
          // context.read<Counter>(), which gets the current state
          // but doesn't ask Flutter for future rebuilds.
          //
          // Since we're in a callback that will be called whenever the user
          // taps the FloatingActionButton, we are not in the build method here.
          // We should use context.read().
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}