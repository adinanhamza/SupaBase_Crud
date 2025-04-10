
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/model/model.dart';
import 'package:supabase_crud/view/home.dart';
import 'package:supabase_crud/viewmodel/provider.dart';

class Update extends StatefulWidget {
  String id;
  String name;
  String age;
  String address;
    TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
   Update({super.key, required this.address,required this.age,required this.name,required this.id,
   
   });

  @override
  State<Update> createState() => _updateState();
}

class _updateState extends State<Update> {
      TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  
  TextEditingController addresscontroller = TextEditingController();
  @override
  void initState(){
    namecontroller = TextEditingController(text: widget.name);
    agecontroller = TextEditingController(text: widget.age);

    addresscontroller = TextEditingController(text: widget.address);

super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
        TextFormField(
          controller: namecontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'name',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: agecontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'age',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
       
        SizedBox(height: 20,),
        TextFormField(
          controller: addresscontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'address',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        Consumer<StudentProvider>(
          builder: (context, value, child) => 
          ElevatedButton(onPressed: (){
            value.updateStudent(StudentModel(address: addresscontroller.text, name: namecontroller.text,  age: agecontroller.text),widget.id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data updated successfully')));
            Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
          }, child: Text('submit'),),
        
        )
          ],
        ),
      ),
    ));
  }
}