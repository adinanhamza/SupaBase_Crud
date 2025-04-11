class StudentModel{

  String? id;
  String name;
  String age;
  String address;
  String image;

  StudentModel({required this.address,required this.age, this.id,required this.name,required this.image});

  factory StudentModel.fromDataBase(Map<String,dynamic>json){
return StudentModel(
  id: json['id'].toString(),
  name: json['name'] ?? '',
  age: json['age'].toString() ,
  address: json['address'] ?? '',
 image: json['image'] ?? '',


);
  }

Map<String,dynamic>toDataBase(){
return {
'name' : name,
'age' : age,
'address' : address,
 'image' : image,
};
}
}