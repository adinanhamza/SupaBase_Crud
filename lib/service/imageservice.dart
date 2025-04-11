import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Imageservice {

Future<String?>uploadImageToDataBase(File imageFile)async{
try {
  final filename = 'student${DateTime.now().millisecondsSinceEpoch}.jpg';

  final storageResponse = await Supabase.instance.client.storage.from("student-image").upload(filename, imageFile);

  final imageUrl = Supabase.instance.client.storage.from("student-image").getPublicUrl(filename);

  return imageUrl;
} catch (e) {
  log('uoload error : $e');
  return null;
}
}



//   Future<String?> uploadImageToSupabase(File imageFile) async {
//   try {
//     final fileName = 'student_${DateTime.now().millisecondsSinceEpoch}.jpg';

//     final storageResponse = await Supabase.instance.client.storage
//         .from('student-images') // your Supabase bucket name
//         .upload(fileName, imageFile);

//     // Get the public URL after upload
//     final imageUrl = Supabase.instance.client.storage
//         .from('student-images')
//         .getPublicUrl(fileName);

//     return imageUrl;
//   } catch (e) {
//     print('Upload Error: $e');
//     return null;
//   }
// }

Future<File?> pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}


}