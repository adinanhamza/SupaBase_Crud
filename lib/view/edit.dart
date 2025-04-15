import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/model/model.dart';
import 'package:supabase_crud/service/imageservice.dart';
import 'package:supabase_crud/view/home.dart';
import 'package:supabase_crud/viewmodel/provider.dart';

class Update extends StatefulWidget {
  String id;
  String name;
  String age;
  String address;
  String image;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  Update({
    super.key,
    required this.address,
    required this.age,
    required this.name,
    required this.id,
    required this.image,
  });

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  File? selectedImage;
NetworkImage? netImage;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  
  @override
  void initState() {
    namecontroller = TextEditingController(text: widget.name);
    agecontroller = TextEditingController(text: widget.age);
    // selectedImage = File(widget.imag\
    //e );
netImage = NetworkImage(widget.image);
    addresscontroller = TextEditingController(text: widget.address);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('image for update : ${widget.image}'  ?? 'null');
    log("selected images as : $selectedImage");
    log('edit image : ${context.read<StudentProvider>().imageUrl}');
  // NetworkImage editImage =   context.read<StudentProvider>().imageUrl;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 229, 202, 154),
                backgroundImage:
                    selectedImage != null ? 
                    
                  NetworkImage(context.read<StudentProvider>().imageUrl ?? 'null')
                    
                     : NetworkImage(widget.image),
                child:
                    selectedImage == null && netImage == null
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
                  foregroundColor: const Color.fromARGB(167, 0, 0, 0),
                ),
                onPressed: () async {
                  final file = await Imageservice().pickImage();

                  if(file != null){
                    setState(() {
                         selectedImage = file;
                    });
                 
                  }

                  if (file != null) {
                    final url = await Imageservice().uploadImageToDataBase(
                      file,
                    );
                    
                    if (url != null) {
                      context.read<StudentProvider>().setImageUrl(url);
                      log('image url set in provider $url');
                    }
                  }
                },
                child: Text('Add Image'),
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: agecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'age',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              TextFormField(
                controller: addresscontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Consumer<StudentProvider>(
                builder:
                    (context, value, child) => ElevatedButton(
                      onPressed: () {
                        value.updateStudent(
                          StudentModel(
                            address: addresscontroller.text,
                            name: namecontroller.text,
                            image: context.read<StudentProvider>().imageUrl ?? widget.image,
                            age: agecontroller.text,
                          ),
                          widget.id,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('data updated successfully'),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text('submit'),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
