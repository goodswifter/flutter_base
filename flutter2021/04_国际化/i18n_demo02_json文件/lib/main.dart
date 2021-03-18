import 'package:flutter/material.dart';
import 'package:i18n_demo/localizations_init.dart';

void main() => runApp(MyApp());

/// 初始化
/// 1. iOS需要单独设置info.plist

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADI18nPage(),
      localizationsDelegates: ADLocalizations.localizationsDelegates,
      supportedLocales: ADLocalizations.supportedLocales,
    );
  }
}

class ADI18nPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ADLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ADLocalizations.of(context).hello,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
              },
              child: Text(
                ADLocalizations.of(context).pickTime,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
