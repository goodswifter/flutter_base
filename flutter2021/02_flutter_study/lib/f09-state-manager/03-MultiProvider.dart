import 'package:flutter/material.dart';
import 'package:flutter_study/f09-state-manager/viewmodel/counter_view_model.dart';
import 'package:flutter_study/f09-state-manager/viewmodel/initialize_providers.dart';
import 'package:flutter_study/f09-state-manager/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: providers,
    child: MyApp(),
  ));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ADShowData01(),
          ],
        ),
      ),
    );
  }
}

class ADShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ADShowData02 - build");
    return Card(
      child: Consumer2<CounterViewModel, UserInfoViewModel>(
        builder: (context, counterVM, userInfoVM, child) {
          print("ADShowData02- Consumer - builder");
          return Text(
            "counter: ${counterVM.counter} name: ${userInfoVM.userInfo.name}",
            style: TextStyle(fontSize: 30),
          );
        },
      ),
      color: Colors.green,
    );
  }
}
