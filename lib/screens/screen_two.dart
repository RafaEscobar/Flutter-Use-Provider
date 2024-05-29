import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina #2'),
      ),
      body: const Center(
        child: Text('Holis!!'),
      ),
    );
  }
}