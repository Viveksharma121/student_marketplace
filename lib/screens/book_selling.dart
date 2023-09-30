import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bookModel.dart';

class BookSellingScreen extends StatefulWidget {
  final String subjectName;
  // final String sellerName;
  final String department;
  final int semester;
  const BookSellingScreen({super.key, required this.subjectName, required this.department, required this.semester});

  @override
  State<BookSellingScreen> createState() => _BookSellingScreenState();
}

class _BookSellingScreenState extends State<BookSellingScreen> {

  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookEditionController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();

  void sell () async {

    try{
      String bookName = bookNameController.text.trim();
      String bookEdition = bookEditionController.text.trim();
      String authorName = authorNameController.text.trim();

      BookModel newBookModel = BookModel(
          subjectName: widget.subjectName,
          bookName: bookName,
          bookAuthor: authorName,
          bookEdition: bookEdition,
          department: widget.department,
          semester: widget.semester
      );

      CollectionReference booksCollection = FirebaseFirestore.instance.collection("books");
      await booksCollection.add(newBookModel.toMap());
      log("Book added Successfully");
    }
    catch(e){
      log("Error adding Data: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Book"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CupertinoButton(onPressed: (){}, borderRadius: BorderRadius.circular(10), child: const Icon(Icons.book)),
            const SizedBox(height: 10),
            TextField(
              controller: bookNameController,
              decoration: const InputDecoration(
                labelText: "Enter Book Name",
                icon: Icon(Icons.book)
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bookEditionController,
              decoration: const InputDecoration(
                  labelText: "Enter Book Edition",
                  icon: Icon(Icons.book)
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: authorNameController,
              decoration: const InputDecoration(
                  labelText: "Enter Author Name",
                  icon: Icon(Icons.book)
              ),
            ),
            ElevatedButton(onPressed: (){sell();}, child: const Text("Sell Book"))
          ],
        ),
      ),
    );
  }
}
