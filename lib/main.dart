import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/initialize_controllers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  InitializeControllers.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: Text('HEY')),
        )
    );
  }
}