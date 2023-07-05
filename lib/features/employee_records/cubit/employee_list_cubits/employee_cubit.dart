import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/local_db_repository.dart';
import '../../../../core/models/employee.dart';

part 'employee_cubit.freezed.dart';
part 'employee_state.dart';

@injectable
class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(const EmployeeState.initial());

  getEmployees() async {
    emit(const EmployeeState.loading());
    try {
      final employees = await DatabaseProvider.dbProvider.getEmployees();
      final currentEmployees =
          employees.where((e) => e.dateLeft == null).toList();
      final previousEmployees =
          employees.where((e) => e.dateLeft != null).toList();
      emit(EmployeeState.loaded(
        currentEmployees: currentEmployees,
        previousEmployees: previousEmployees,
      ));
    } catch (e) {
      emit(EmployeeState.error(e.toString()));
      rethrow;
    }
  }

  addEmployee(Employee employee) async {
    try {
      final id = await DatabaseProvider.dbProvider.addEmployee(employee);
      employee = employee.copyWith(id: id);
      final employees = List<Employee>.from(state.map(
          initial: (s) => [],
          loading: (s) => [],
          loaded: (s) => s.currentEmployees,
          error: (s) => []));
      employees.add(employee);
      emit(EmployeeState.loaded(
        currentEmployees: employees,
        previousEmployees: state.map(
            initial: (s) => [],
            loading: (s) => [],
            loaded: (s) => s.previousEmployees,
            error: (s) => []),
      ));
    } catch (e) {
      emit(EmployeeState.error(e.toString()));
    }
  }

  deleteEmployee(Employee employee) async {
    try {
      final newEmployee =
          employee.copyWith(dateLeft: DateTime.now(), isDeleted: true);
      await DatabaseProvider.dbProvider.updateEmployee(newEmployee);
      final employees = List<Employee>.from(state.map(
          initial: (s) => [],
          loading: (s) => [],
          loaded: (s) => s.currentEmployees,
          error: (s) => []));
      employees.remove(employee);
      final previousEmployees = List<Employee>.from(state.map(
          initial: (s) => [],
          loading: (s) => [],
          loaded: (s) => s.previousEmployees,
          error: (s) => []));
      previousEmployees.add(newEmployee);
      emit(EmployeeState.loaded(
        currentEmployees: employees,
        previousEmployees: previousEmployees,
      ));
    } catch (e) {
      emit(EmployeeState.error(e.toString()));
      rethrow;
    }
  }
}
