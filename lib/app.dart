import 'package:dragbuilder_demo/home/controller/home_controller.dart';
import 'package:dragbuilder_demo/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  static HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: homeController),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Drag Drop Builder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
