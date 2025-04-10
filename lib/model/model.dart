class StudentModel{

  String? id;
  String name;
  String age;
  String address;
  String image;

  StudentModel({required this.address,required this.age, this.id,required this.image,required this.name});

  factory StudentModel.fromDataBase(Map<String,dynamic>json, String id){
return StudentModel(
  id: id,
  name: json['name'] ?? '',
  age: json['age'].toString() ,
  address: json['address'] ?? '',
  image: json['image'] ?? '',


);
  }

Map<String,dynamic>toDataBase(){
return {
'id' : id,
'name' : name,
'age' : age,
'address' : address,
'image' : image,
};
}
}