import 'package:flutter/material.dart';
import 'package:restorable/page_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RestorationMixin {
  late final PageViewModel _viewModel;

  @override
  void initState() {
    _viewModel = PageViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _viewModel.counter.notifier,
        builder: (context, counter, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _viewModel.counter2.notifier,
                  builder: (context, counter2, child) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Counter 2:'),
                          Text(
                            '$counter2',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String? get restorationId => "app";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_viewModel.counter, "counter");
    registerForRestoration(_viewModel.counter2, "counter2");
  }

  @override
  void dispose() {
    _viewModel.counter.dispose();
    super.dispose();
  }
}
