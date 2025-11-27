import 'model.dart';

class StudentData {
  // static List<dynamic> data = [
  //   {"roll": "1010", "name": "Sabbir", "session": "2018 - 2019", "dep": "CSE"},
  //   {"roll": 1011, "name": "Janntun", "session": "2016 - 2017", "dep": "CSE"},
  // ];

  static List<StudentDataModel> datas = [
    StudentDataModel(roll: 10, name: "Sabbir Ahmed", session: "2018 - 2019", department: "CSE"),
    StudentDataModel(roll: 11, name: "Maria Khan", session: "2019 - 2020", department: "EEE"),
    StudentDataModel(roll: 12, name: "Tarik Hasan", session: "2018 - 2019", department: "CSE"),
    StudentDataModel(roll: 13, name: "Lamiya Akter", session: "2020 - 2021", department: "BBA"),
  ];
}
