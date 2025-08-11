import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(const XPertFundingWidgetTestApp());
}

class XPertFundingWidgetTestApp extends StatelessWidget {
  const XPertFundingWidgetTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPert Funding Widget Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const App(),
    );
  }
}
