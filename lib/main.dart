import 'package:employees_app/features/employee_records/ui/screens/employees_list_page.dart';
import 'package:flutter/material.dart';

import 'constants/string.dart';
import 'features/employee_records/ui/screens/add_employee_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeListPage(),
      routes: {
        '/add-employee': (context) => const AddEmployeePage(),
      },
    );
  }
}
