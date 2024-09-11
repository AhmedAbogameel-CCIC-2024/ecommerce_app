import 'package:ecommerce_app/core/caching_utils/caching_utils.dart';
import 'package:ecommerce_app/core/route_utils/route_utils.dart';
import 'package:ecommerce_app/views/login/view.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(title: 'Home'),
        actions: [
          IconButton(
            onPressed: () {
              CachingUtils.clearCache();
              RouteUtils.pushAndRemoveAll(LoginView());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
