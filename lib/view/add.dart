
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/service/imageservice.dart';
import 'package:supabase_crud/viewmodel/provider.dart';

class Addstudent extends StatefulWidget {

   Addstudent({super.key});

  @override
  State<Addstudent> createState() => _AddstudentState();
}

class _AddstudentState extends State<Addstudent> {
  File? selectedImage;
   TextEditingController namecontroller = TextEditingController();

  TextEditingController agecontroller = TextEditingController();

  

  TextEditingController addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Consumer<StudentProvider>(
        builder: (context, valuefield, child) => 
         Padding(
          padding: EdgeInsets.all(18),
           child: Column(
            children: [

               CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color.fromARGB(255, 229, 202, 154),
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!) 
                              : null, 
                          child: selectedImage == null
                              ? Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                )
                              : null, 
                        ),
                      
                      SizedBox(height: 5),
                      
                        TextButton(
                        style: TextButton.styleFrom(
                           backgroundColor: const Color.fromARGB(63, 225, 210, 182),
                          foregroundColor: const Color.fromARGB(167, 0, 0, 0)

                        ),
                          onPressed: ()async{
                      
               final file = await     Imageservice().pickImage();  
              if(file != null){
                selectedImage = file;
              }
               if(file != null){
                final url = await Imageservice().uploadImageToDataBase(file);
                if(url != null){
                  context.read<StudentProvider>().setImageUrl(url);
                  log('image url set in provider $url');
                }
               }
                     }, child: 
                     Text('Add Image'),
                     ),SizedBox(height: 20,),
              TextFormField(
                controller:valuefield.namecontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'name',border: OutlineInputBorder( )
                  ),
              ),
              SizedBox(height: 20,),TextFormField(
              
                controller:valuefield.agecontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'age',border: OutlineInputBorder( )
           ,
                  ),
                  
              ),
        
              SizedBox(height: 20,),TextFormField(
                controller:valuefield.addresscontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'address',border: OutlineInputBorder( )
                  ),
              ),
              SizedBox(height: 20,),
              Consumer<StudentProvider>(
                builder: (context, value, child) => 
                 ElevatedButton(onPressed: (){

                  value.addstudent();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data added successfully')));
               Navigator.pop(context);
                }, child: Text('add')),
              )
            ],
                   ),
         ),
      ),
    ));
  }

// Gallery picker
  Future<void> pickGalleryImage() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path); 
    });
    
  }
}


 