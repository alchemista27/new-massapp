import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:massapp/providers/auth_provider.dart';
import 'package:massapp/routes.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MassApp());
}

class MassApp extends StatelessWidget {
  const MassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'MassApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
