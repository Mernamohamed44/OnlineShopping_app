class UserModel{
  String?name;
  String?email;
  String?phone;
  String?uId;
  String? image;
  UserModel(
      {
        this.name,
        this.email,
        this.phone,
        this.uId,
        this.image
      }
      );
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    image: json["image"] == null ? null : json["image"],
    uId: json["uId"] == null ? null : json["uId"],

  );
  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'UId':uId,
      'image':image
    };
  }
}