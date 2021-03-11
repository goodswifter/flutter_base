import 'package:flutter/material.dart';
import 'package:i18n_demo02/i18n/localizations_init.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: ADHomePage(),
      localizationsDelegates: ADLocalizations.localizationsDelegates,
      supportedLocales: ADLocalizations.supportedLocales,
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(ADLocalizations.of(context).pickTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(ADLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ADLocalizations.of(context).hello, style: TextStyle(fontSize: 20),),
            RaisedButton(
              child: Text(ADLocalizations.of(context).pickTime, style: TextStyle(fontSize: 20),),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000)
                );
              },
            )
          ],
        ),
      ),
    );
  }
}