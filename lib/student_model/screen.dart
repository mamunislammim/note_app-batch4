import 'package:flutter/material.dart';
import 'package:note_app/student_model/student_data.dart';

class StudentDataScreen extends StatefulWidget {
  const StudentDataScreen({super.key});

  @override
  State<StudentDataScreen> createState() => _StudentDataScreenState();
}

class _StudentDataScreenState extends State<StudentDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: CustomWidget()),
      body: ListView.builder(
        itemCount: StudentData.datas.length,
        itemBuilder: (context, i) => ListTile(
          leading: Text("${StudentData.datas[i].roll}"),
          title: Text("${StudentData.datas[i].name}"),
          subtitle: Text("${StudentData.datas[i].department} - ${StudentData.datas[i].session}"),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "data",
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
    );
  }
}
