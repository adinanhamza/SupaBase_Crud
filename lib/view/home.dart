
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
        
            return ListTile(
              tileColor: Colors.blueGrey[100],
        
              title: Text(data.name,style: TextStyle(
              
              ),),
              subtitle: Text(data.age),
              trailing: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Profile(address: data.address, age: data.age,  name: data.name,id:data.id??'no',)));
                
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