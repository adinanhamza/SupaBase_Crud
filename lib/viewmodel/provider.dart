import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:supabase_crud/model/model.dart';
import 'package:supabase_crud/service/imageservice.dart';
import 'package:supabase_crud/service/service.dart';

class StudentProvider extends ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  StudentService studentService = StudentService();
  List<StudentModel> studentlist = [];
  Imageservice imageservice = Imageservice();
  String? imageUrl;

  Future<void> fetchStudents() async {
    log('pro get datas ');
    studentlist = await studentService.getAllStudent();
    notifyListeners();
  }

  Future<void> addstudent() async {
    try {
      await studentService.addStudent(
        StudentModel(
          address: addresscontroller.text,
          age: agecontroller.text,
          name: namecontroller.text,
          image: imageUrl ?? '',
        ),
      );
      log('added student in pro');
    } catch (e) {
      log('failed add data pro : $e');
    }
    namecontroller.clear();
    agecontroller.clear();
    addresscontroller.clear();
    fetchStudents();
    notifyListeners();
  }

  Future<void> updateStudent(StudentModel updatedStudent, String id) async {
    await studentService.updateStudent(updatedStudent, id);
    log('updated student success');
    fetchStudents();
    notifyListeners();
  }

  Future<void> deleteStudent(String id) async {
    await studentService.deleteStudent(id);
    log('deleted student success');
    fetchStudents();
    notifyListeners();
  }

  void setImageUrl(String url) {
    imageUrl = url;
    notifyListeners();
  }
}
