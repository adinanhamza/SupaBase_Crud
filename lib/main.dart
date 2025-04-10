import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/view/home.dart';
import 'package:supabase_crud/viewmodel/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: 'https://qtsayjcmcxggstikenqp.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0c2F5amNtY3hnZ3N0aWtlbnFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQyNzkzMjMsImV4cCI6MjA1OTg1NTMyM30.t4Ui32wfU17pVPczM_tMpGhse10FFreZvVF9yIh6zhM');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
         home: Home(),
      ),
    );
  }
}