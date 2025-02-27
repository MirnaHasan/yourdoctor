import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


const supabaseUrl = 'https://hegshhijycsmmlaoktqq.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhlZ3NoaGlqeWNzbW1sYW9rdHFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2ODQwOTEsImV4cCI6MjA1NjI2MDA5MX0.M-QNwRXfzZ2gVXL_nA74Vm6Axaexa365c9W2usZF5HY';


SharedPreferences? shared;

Future<void> initService() async {
  shared = await SharedPreferences.getInstance();
await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  // if (Platform.isWindows || Platform.isLinux) {
  //   databaseFactory = databaseFactoryFfi;

  // }
}
