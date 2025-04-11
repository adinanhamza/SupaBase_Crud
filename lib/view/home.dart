
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/view/add.dart';
import 'package:supabase_crud/view/profile.dart';
import 'package:supabase_crud/viewmodel/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentProvider>().fetchStudents();
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Addstudent()));
      },
      child: Icon(Icons.add),
      
      ),
      appBar: AppBar(
        title: Text('FireBase Details'),
        centerTitle: true,
        
      ),
      body: Column(
        children: [ 
          Expanded(child: Consumer<StudentProvider>(
          builder: (context, value, child) => 
         ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(height: 10,);
          },
            
            itemCount:value.studentlist.length,
            itemBuilder: 
          
          (context, index) {
            final data = value.studentlist[index];
            final image = value.imageUrl;
        
            return ListTile(
              tileColor: Colors.greenAccent[100],
        
        leading: CircleAvatar(
           backgroundImage: image == null && image!.isNotEmpty
           ? FileImage(File(image))
           : asset
        ),
              title: Text(data.name,style: TextStyle(
              
              ),),
              subtitle: Text(data.age),
              trailing: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Profile(address: data.address, age: data.age,  name: data.name,id:data.id??'no',image:image! ,)));
                
              }, icon: Icon(Icons.forward)),
            
            );
          
          }
          
          ),
          
        )),
        SizedBox(height: 40,),

        ]
      ),
    ));
  }
}