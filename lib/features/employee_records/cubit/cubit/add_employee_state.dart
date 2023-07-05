part of 'add_employee_cubit.dart';

@freezed
class AddEmployeeState with _$AddEmployeeState {
  // constructor with named parameters
  const factory AddEmployeeState({
    required String name,
    required String position,
    required DateTime startDate,
    DateTime? endDate,
    required bool isSaving,
    required bool showErrorMessages,
  }) = _AddEmployeeState;

  factory AddEmployeeState.initial() => AddEmployeeState(
        name: '',
        position: '',
        startDate: DateTime.now(),
        isSaving: false,
        showErrorMessages: false,
      );

  factory AddEmployeeState.loading() => AddEmployeeState(
        name: '',
        position: '',
        startDate: DateTime.now(),
        isSaving: true,
        showErrorMessages: false,
      );

  factory AddEmployeeState.failure() => AddEmployeeState(
        name: '',
        position: '',
        startDate: DateTime.now(),
        isSaving: false,
        showErrorMessages: true,
      );

  factory AddEmployeeState.success() => AddEmployeeState(
        name: '',
        position: '',
        startDate: DateTime.now(),
        isSaving: false,
        showErrorMessages: false,
      );
}
