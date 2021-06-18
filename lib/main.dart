import './routes.dart';
import './controllers/bindings/dio_bindings.dart';
import './widgets/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Case Devindo',
      defaultTransition: Transition.leftToRight,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeUi.textTheme,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple, elevation: 0),
      ),
      initialBinding: DioBindings(),
      initialRoute: '/home',
      getPages: Routes.routes,
    );
  }
}
