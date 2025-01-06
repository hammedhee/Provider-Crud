import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:providercrud/controllers/noteprovider.dart';
import 'package:providercrud/model/crudmodel.dart';
import 'package:providercrud/view/homeScren.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotessAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Noteprovider() )],
      child: MaterialApp(
        home: Homescren(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
