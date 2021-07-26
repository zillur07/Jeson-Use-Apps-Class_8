import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/pages/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
