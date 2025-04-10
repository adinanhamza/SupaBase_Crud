import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      },child: Text('add'),),
      appBar: AppBar(),
      body: Column(

      ),
    )
    );
  }
}