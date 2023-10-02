import 'package:flutter/material.dart';
import 'package:student_marketplace/models/bookModel.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
        backgroundColor: Colors.blue, // Set your preferred app bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  book.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Book Name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${book.bookName ?? ' '}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Author",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${book.bookAuthor ?? ' '}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue, // Set your preferred text color
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Edition",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${book.bookEdition ?? ' '}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Rs. ${book.bookPrice ?? ' '}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.green, // Set your preferred price color
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "${book.description ?? ' '}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add logic here to chat with the author
              },
              child: Text("Chat with Author"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set your preferred button color
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
