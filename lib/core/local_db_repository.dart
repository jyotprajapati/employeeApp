import 'dart:async';
import 'dart:io';
import 'package:employees_app/core/models/employee.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final employeesTable = 'employees';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "employees.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $employeesTable ("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "position TEXT, "
        "dateJoined TEXT, "
        "dateLeft TEXT, "
        "isDeleted INTEGER "
        ")");
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(employeesTable, row);
  }

  addEmployee(Employee employee) async {
    final db = await database;
    var res = await db.insert(employeesTable, employee.toJson());
    return res;
  }

  Future<List<Employee>> getEmployees() async {
    final db = await database;
    var res = await db.query(employeesTable);

    List<Employee> list = res.isNotEmpty
        ? res.map((c) {
            //create new map to handle isDeleted for boolean from 0 or 1
            final map = c.map((key, value) {
              if (key == 'isDeleted') {
                return MapEntry(key, value == 1);
              }
              return MapEntry(key, value);
            });

            return Employee.fromJson(map);
          }).toList()
        : [];
    return list;
  }

  updateEmployee(Employee employee) async {
    final db = await database;
    var employeeJson = employee.toJson();
    employeeJson["isDeleted"] = employee.isDeleted ? 1 : 0;
    var res = await db.update(employeesTable, employeeJson,
        where: "id = ?", whereArgs: [employee.id!]);
    return res;
  }
}
