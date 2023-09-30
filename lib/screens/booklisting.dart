import 'dart:core';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_marketplace/models/bookModel.dart';
import 'package:student_marketplace/screens/book_selling.dart';

class BookListingScreen extends StatefulWidget {
  final String subjectName;
  // final String sellerName;
  final String department;
  final int semester;
  const BookListingScreen({super.key, required this.subjectName, required this.department, required this.semester});

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

    CollectionReference collectionReference = FirebaseFirestore.instance.collection("books");
    List<BookModel> books=[];

    // try{
      QuerySnapshot querySnapshot = await collectionReference
          .where("subjectname", isEqualTo: widget.subjectName)
          .where("department", isEqualTo: widget.department)
          .get();

      for(QueryDocumentSnapshot doc in querySnapshot.docs){
        BookModel book = BookModel.fromMap(doc.data() as Map<String, dynamic>);
        books.add(book);
      }

      return books;
    // }
    // catch(e){
    //   log("Error retrieving data: $e");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _books,
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                else if (snapshot.hasError){
                  return Text("Error displaying data: ${snapshot.error}");
                }
                else if (snapshot.hasData && snapshot.data!.isEmpty){
                  return const Text("No Books yet.");
                }
                else{
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            BookModel book = snapshot.data![index];
                            // return ListTile(
                            //   title: Text(book.bookName ?? ''),
                            //   subtitle: Text(book.bookAuthor ?? ''),
                            // );
                            return Column(
                              children: [
                                const SizedBox(height: 50),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Book Name: ${book.bookName ?? ' '}"),
                                      Text("Author: ${book.bookAuthor ?? ' '}"),
                                      Text("Edition: ${book.bookEdition ?? ' '}"),
                                      ElevatedButton(onPressed: (){}, child: const Text("Chat with Seller"))
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                      )
                  );
                }
              }
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> BookSellingScreen(subjectName: widget.subjectName, department: widget.department, semester: widget.semester)
                ));
            }
          , child: Text("Sell a Book")
          ),
        ],
      )

    );
  }
}
