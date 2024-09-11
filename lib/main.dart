import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/views/home/view.dart';
import 'package:ecommerce_app/views/login/view.dart';
import 'package:flutter/material.dart';

import 'core/caching_utils/caching_utils.dart';
import 'core/network_utils/network_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    NetworkUtils.init(),
    CachingUtils.init(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteUtils.navigatorKey,
      home: CachingUtils.isLogged ? HomeView() : LoginView(),
    );
  }
}
