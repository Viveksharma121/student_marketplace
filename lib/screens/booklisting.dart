import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_marketplace/models/bookModel.dart';
import 'package:student_marketplace/screens/bookDetails.dart';
import 'package:student_marketplace/screens/book_selling.dart';
import 'package:student_marketplace/screens/homepage.dart';
import '../models/UserModel.dart';
import 'package:share_plus/share_plus.dart';

class BookListingScreen extends StatefulWidget {
  final BookModel bookModel;
  final UserModel userModel;
  final User firebaseUser;

  const BookListingScreen({
    Key? key,
    required this.bookModel,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  State<BookListingScreen> createState() => _BookListingScreenState();
}

class _BookListingScreenState extends State<BookListingScreen> {
  late Future<List<BookModel>> _books;

  @override
  void initState() {
    super.initState();
    _books = listBooks();
  }

  Future<List<BookModel>> listBooks() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("books");
    List<BookModel> books = [];

    QuerySnapshot querySnapshot = await collectionReference
        .where("subjectname", isEqualTo: widget.bookModel.subjectName)
        .where("department", isEqualTo: widget.bookModel.department)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      BookModel book = BookModel.fromMap(doc.data() as Map<String, dynamic>);
      books.add(book);
    }

    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _books,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error displaying data: ${snapshot.error}",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      "No Books yet.",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      BookModel book = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookDetailScreen(book: book)),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("${book.imageUrl}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Book Name: ${book.bookName ?? ' '}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Price: ${book.bookPrice ?? ' '}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(height: ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    },
                                    child: Text("Chat with Seller"),
                                  ),
                                  SizedBox(
                                    width: 96.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        //share
                                      },
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookSellingScreen(
                      bookModel: widget.bookModel,
                      firebaseUser: widget.firebaseUser,
                      userModel: widget.userModel,
                    ),
                  ),
                );
              },
              child: Text(
                "Sell a Book",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
