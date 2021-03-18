import 'package:flutter/material.dart';
import 'package:flutter_study/f09-state-manager/viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => CounterViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("_ADHomePageState - build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
        builder: (context, counterVM, child) {
          print("_ADHomePageState - Selector - builder");
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterVM.counter++;
            },
          );
        },
        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => false,
      ),
      // floatingActionButton: Consumer<CounterViewModel>(
      //   child: Icon(Icons.add),
      //   builder: (context, counterVM, child) {
      //     print("_ADHomePageState - Consumer - builder");
      //     return FloatingActionButton(
      //       child: child,
      //       onPressed: () {
      //         counterVM.counter++;
      //       },
      //     );
      //   },
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ADShowData01(),
            ADShowData02(),
          ],
        ),
      ),
    );
  }
}

class ADShowData01 extends StatefulWidget {
  @override
  _ADShowData01State createState() => _ADShowData01State();
}

class _ADShowData01State extends State<ADShowData01> {
  @override
  Widget build(BuildContext context) {
    print("_ADShowData01State - build");
    int counter = Provider.of<CounterViewModel>(context).counter;
    return Card(
      child: Text(
        "counter: $counter",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.red,
    );
  }
}

class ADShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ADShowData02 - build");
    return Card(
      child: Consumer<CounterViewModel>(
        builder: (context, counterVM, child) {
          print("ADShowData02- Consumer - builder");
          return Text(
            "counter: ${counterVM.counter}",
            style: TextStyle(fontSize: 30),
          );
        },
      ),
      color: Colors.green,
    );
  }
}
