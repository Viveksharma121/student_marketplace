import 'package:flutter/material.dart';
import 'package:student_marketplace/screens/comps.dart';
import 'login.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {

  final List<String> arr = ["First year", "Computer", "IT", "AI & DS", "EXTC", "Chemical"];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                const Text(
                  "Select your Department",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 50),
                Department(department: arr[0], imageUrl: "assets/images/departments/fy.png"),
                const SizedBox(height: 50),
                Department(department: arr[1], imageUrl: "assets/images/departments/comp.jpg"),
                const SizedBox(height: 50),
                Department(department: arr[2], imageUrl: "assets/images/departments/it.jpg"),
                const SizedBox(height: 50),
                Department(department: arr[3], imageUrl: "assets/images/departments/aids.jpg"),
                const SizedBox(height: 50),
                Department(department: arr[4], imageUrl: "assets/images/departments/extc.jpg"),
                const SizedBox(height: 50),
                Department(department: arr[5], imageUrl: "assets/images/departments/chem.jpg"),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Department extends StatefulWidget {
  final String department;
  final String imageUrl;
  const Department({super.key, required this.department, required this.imageUrl});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CompsDepartmentScreen()));
      },
      child: Container(
        height: 150,
        width: deviceWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(6, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              height: 140.0,
              child: Image.asset(widget.imageUrl),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.department,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "Department",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
