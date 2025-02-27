import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yourdoctor/View/style/SizeApp/ScreenSize.dart';
import 'package:yourdoctor/View/style/SizeApp/SizeBuilder.dart';

const supabaseUrl = 'https://hegshhijycsmmlaoktqq.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhlZ3NoaGlqeWNzbW1sYW9rdHFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2ODQwOTEsImV4cCI6MjA1NjI2MDA5MX0.M-QNwRXfzZ2gVXL_nA74Vm6Axaexa365c9W2usZF5HY';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
late final supabase ;
Future<void> init() async {
await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SizeBuilder(
          baseSize: const Size(360, 690),
          height: context.screenHeight,
          width: context.screenWidth,
          child: const MyHomePage(title: 'Flutter')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
 try {
    await Supabase.instance.client
      .from('Patients')
      .insert({
     
        'name': 'iPhone 15',
      
      });
    print('تم إدخال البيانات بنجاح!');
  } catch (e) {
    print('حدث خطأ: $e');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: context.getFontSize(14)),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: context.getFontSize(18)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '++',
        child: const Icon(Icons.add),
      ),
    );
  }
}
