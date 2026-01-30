import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:corporate_ai_assistant/ui/screens/home_screen.dart';
import 'package:corporate_ai_assistant/config/constants.dart';

// Entry point for the Corporate AI Assistant App
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase connection for backend services
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  runApp(const CorporateAIApp());
}

class CorporateAIApp extends StatelessWidget {
  const CorporateAIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corporate AI Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
