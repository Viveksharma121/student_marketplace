class BookModel {
  String? uid;
  // String? seller;
  String? subjectName;
  String? bookName;
  String? bookAuthor;
  String? bookEdition;
  String? department;
  int? semester;
  String? imageUrl;

  BookModel({this.subjectName, this.bookName, this.bookAuthor, this.bookEdition, this.department, this.semester, this.imageUrl, this.uid});

  BookModel.fromMap(Map<String, dynamic> map){
    uid = map["uid"];
    // seller = map["sellerid"];
    subjectName = map["subjectname"];
    bookName = map["bookname"];
    bookAuthor = map["author"];
    bookEdition = map["edition"];
    department = map["department"];
    semester = map["semester"];
    imageUrl = map["image"];
  }

  Map<String, dynamic> toMap() {
    return{
      "uid": uid,
      // "sellerid" : seller,
      "subjectname": subjectName,
      "bookname" : bookName,
      "author" : bookAuthor,
      "edition" : bookEdition,
      "department" : department,
      "image": imageUrl
    };
  }
}