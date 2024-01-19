import 'package:flutter/cupertino.dart';

class Bootstrapper{
  static initialize() async {
    // Initialize your app here
    WidgetsFlutterBinding.ensureInitialized();
  }
}