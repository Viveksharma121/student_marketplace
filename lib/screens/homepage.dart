// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:classico/src/features/authentication/screens/login/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 12, 8),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Row(children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                    ),
                                    labelText: 'Find books and more ',
                                    labelStyle: TextStyle(fontSize: 12),
                                    contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(6))),
                              ),
                            ),
                            Icon(Icons.notifications_none)
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 2, 12, 8),
                          child: Column(
                            children: [
                              // BannerWidget(),
                              //categories
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}