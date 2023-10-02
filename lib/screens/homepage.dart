import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/bookModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<BookModel>> _books;

  @override
  void initState() {
    super.initState();
    _books = listAllBooks();
  }

  Future<List<BookModel>> listAllBooks() async {
    try {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("books");
      QuerySnapshot querySnapshot = await collectionReference.get();

      return querySnapshot.docs
          .map((doc) => BookModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error retrieving data: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 12, 8),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Find books and more ',
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _books,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error displaying data: ${snapshot.error}");
                      } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                        return const Text("No Books yet.");
                      } else {
                        return SizedBox(
                          height: 5000,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              BookModel book = snapshot.data![index];
                              return Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network("${book.imageUrl}"),
                                    ),
                                    Column(
                                      children: [
                                        Text("Book Name: ${book.bookName ?? ' '}"),
                                        Text("Author: ${book.bookAuthor ?? ' '}"),
                                        Text("Edition: ${book.bookEdition ?? ' '}"),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Chat with Seller"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
