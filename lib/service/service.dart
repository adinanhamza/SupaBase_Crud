import 'dart:developer';

import 'package:supabase_crud/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentService{

final supabaseData = Supabase.instance.client.from('studenttable');



Future <void>addStudent(StudentModel student)async{
  try {
    await supabaseData.insert(student.toDataBase());
    log('added student data ');
  } catch (e) {
    log('error in add student : $e');
  }
}


Future<List<StudentModel>> getAllStudent()async{
try {
  final response = await supabaseData.select('*') as List<dynamic>;
  log('response from data : ${response.toString()}');
  return response.map((res)=> StudentModel.fromDataBase(res)).toList();
} catch (e) {
  throw Exception('error in get student : $e');
}
}


Future<void> updateStudent(StudentModel updatedStudent,String id)async{
  try {
    await supabaseData.update(updatedStudent.toDataBase()).eq('id', id);

    log('updated successfully $id');
  } catch (e) {
    log('error in update student : $e');
  }

}

Future <void>deleteStudent(String id)async{
try {
  await supabaseData.delete().eq('id', id);
  log('deleted student successfully $id');
} catch (e) {
  log('error in delete student : $e');
}
}
}