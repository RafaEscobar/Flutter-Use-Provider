import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_provider/domain/providers/task_provider.dart';
import 'package:use_provider/screens/screen_one.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TaskProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenOne(),
      ),
    );
  }
}