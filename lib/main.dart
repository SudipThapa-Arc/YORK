import 'package:flutter/material.dart';
import 'package:personal_ai_assistant/screens/home_screen.dart';
import 'package:personal_ai_assistant/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:personal_ai_assistant/services/ai_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future <void> main() async {
     await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => AIService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal AI Assistant',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}

