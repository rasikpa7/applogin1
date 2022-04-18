import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedb/model/studentmodel.dart';
import 'package:hivedb/screenhome.dart';

Future <void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
  {
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenHome(),

    );
  }
}
 