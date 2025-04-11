import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/view/edit.dart';
import 'package:supabase_crud/viewmodel/provider.dart';

class Profile extends StatelessWidget {
  String id;
  String name;
  String age;
  String address;
  String image;
  Profile({
    super.key,
    required this.address,
    required this.age,
   required this.image,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // log( "class : $clas");
    log(address);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('profile'),
          actions: [
            Row(
              children: [
                Consumer<StudentProvider>(
                  builder:
                      (context, value, child) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => Update(
                                    address: address,
                                    age: age,
                                    name: name,
                                    id: id,
                                    image: image,
                        
                                  ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                ),
                Consumer<StudentProvider>(
                  builder:
                      (context, value, child) => IconButton(
                        onPressed: () {
                          value.deleteStudent(id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('data deleted successfully'),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.delete),
                      ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('name : ${name}'),
              SizedBox(height: 10),
              Text('age : ${age}'),
              SizedBox(height: 10),
           
              Text('address : ${address}'),
              SizedBox(height: 30),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}