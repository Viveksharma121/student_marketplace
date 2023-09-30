class UserModel{

  String? uid;
  String? fullName;
  String? prn;
  String? email;
  String? iCardPic;

  UserModel({this.uid, this.email, this.prn, this.fullName, this.iCardPic});

  UserModel.fromMap(Map<String, dynamic> map){
    uid = map["uid"];
    fullName = map["fullname"];
    prn = map["prn"];
    email = map["email"];
    iCardPic = map["icard"];
  }

  Map<String, dynamic> toMap() {
    return{
      "uid" : uid,
      "fullname" : fullName,
      "prn" : prn,
      "email" : email,
      "icard" : iCardPic
    };
  }
}