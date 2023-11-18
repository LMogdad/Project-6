import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://pdandgbudfsuxvsaahol.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBkYW5kZ2J1ZGZzdXh2c2FhaG9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyOTA1OTksImV4cCI6MjAxNTg2NjU5OX0.4ygQC49GCssmUlZ_1VwrKdj8R7mFS-jLP2Bl6HffR2Y",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
