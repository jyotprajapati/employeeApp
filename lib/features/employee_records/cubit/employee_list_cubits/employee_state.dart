part of 'employee_cubit.dart';

@freezed
abstract class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = Initial;
  const factory EmployeeState.loading() = Loading;
  const factory EmployeeState.loaded({
    required List<Employee> currentEmployees,
    required List<Employee> previousEmployees,
  }) = Loaded;
  const factory EmployeeState.error(String message) = Error;
}
