import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:medicare/provider/providers.dart';
import 'package:medicare/screens/authentication.dart';
import 'package:provider/provider.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(fileName: ".env");
      Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY']!);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providers()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Authentication() ,
    );
  }
}
