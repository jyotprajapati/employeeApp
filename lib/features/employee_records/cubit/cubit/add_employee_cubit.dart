import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/local_db_repository.dart';
import '../../../../core/models/employee.dart';

part 'add_employee_state.dart';
part 'add_employee_cubit.freezed.dart';

@injectable
class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit() : super(AddEmployeeState.initial());
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;

  void nameChanged(String name) {
    emit(
      state.copyWith(
        name: name,
        showErrorMessages: false,
      ),
    );
  }

  void positionChanged(String position) {
    emit(
      state.copyWith(
        position: position,
        showErrorMessages: false,
      ),
    );
  }

  void startDateChanged(DateTime startDate) {
    emit(
      state.copyWith(
        startDate: startDate,
        showErrorMessages: false,
      ),
    );
  }

  void endDateChanged(DateTime endDate) {
    emit(
      state.copyWith(
        endDate: endDate,
        showErrorMessages: false,
      ),
    );
  }

  Future<void> saveEmployee() async {
    emit(
      state.copyWith(
        isSaving: true,
      ),
    );
    final employee = Employee(
      name: state.name,
      position: state.position,
      dateJoined: state.startDate,
      dateLeft: state.endDate,
      isDeleted: false,
    );
    await _databaseProvider.addEmployee(employee);
    emit(
      state.copyWith(
        isSaving: false,
      ),
    );
  }
}
