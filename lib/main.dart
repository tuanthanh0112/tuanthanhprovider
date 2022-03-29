import 'package:flutter/material.dart';
import 'package:provider_state_management/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/screens/home/home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  late HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     value: homeViewModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(homeViewModel: homeViewModel),
        },
      ),
    );
  }
}
