class UserDataModel {
  final String id;
  final String Name;
  final String Jobs;
  final String Phone;
  final int Age;


  UserDataModel(
      {required this.id,
        required this.Name,
        required this.Jobs,
        required this.Phone,
        required this.Age});

  factory UserDataModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserDataModel(
      id: documentId,
      Name: data['name'] ?? "",
      Jobs: data['jobs'] ?? "",
      Phone: data['Phone'] ?? "",
      Age: data['Age'] ?? 0,
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'name' : Name,
      'jobs' : Jobs,
      'Phone' : Phone,
      'Age' : Age,
    };
  }
}

