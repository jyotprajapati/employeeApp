// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_employee_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEmployeeState {
  String get name => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEmployeeStateCopyWith<AddEmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEmployeeStateCopyWith<$Res> {
  factory $AddEmployeeStateCopyWith(
          AddEmployeeState value, $Res Function(AddEmployeeState) then) =
      _$AddEmployeeStateCopyWithImpl<$Res, AddEmployeeState>;
  @useResult
  $Res call(
      {String name,
      String position,
      DateTime startDate,
      DateTime? endDate,
      bool isSaving,
      bool showErrorMessages});
}

/// @nodoc
class _$AddEmployeeStateCopyWithImpl<$Res, $Val extends AddEmployeeState>
    implements $AddEmployeeStateCopyWith<$Res> {
  _$AddEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isSaving = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddEmployeeStateCopyWith<$Res>
    implements $AddEmployeeStateCopyWith<$Res> {
  factory _$$_AddEmployeeStateCopyWith(
          _$_AddEmployeeState value, $Res Function(_$_AddEmployeeState) then) =
      __$$_AddEmployeeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String position,
      DateTime startDate,
      DateTime? endDate,
      bool isSaving,
      bool showErrorMessages});
}

/// @nodoc
class __$$_AddEmployeeStateCopyWithImpl<$Res>
    extends _$AddEmployeeStateCopyWithImpl<$Res, _$_AddEmployeeState>
    implements _$$_AddEmployeeStateCopyWith<$Res> {
  __$$_AddEmployeeStateCopyWithImpl(
      _$_AddEmployeeState _value, $Res Function(_$_AddEmployeeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isSaving = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_AddEmployeeState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddEmployeeState implements _AddEmployeeState {
  const _$_AddEmployeeState(
      {required this.name,
      required this.position,
      required this.startDate,
      this.endDate,
      required this.isSaving,
      required this.showErrorMessages});

  @override
  final String name;
  @override
  final String position;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final bool isSaving;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'AddEmployeeState(name: $name, position: $position, startDate: $startDate, endDate: $endDate, isSaving: $isSaving, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEmployeeState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, position, startDate,
      endDate, isSaving, showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEmployeeStateCopyWith<_$_AddEmployeeState> get copyWith =>
      __$$_AddEmployeeStateCopyWithImpl<_$_AddEmployeeState>(this, _$identity);
}

abstract class _AddEmployeeState implements AddEmployeeState {
  const factory _AddEmployeeState(
      {required final String name,
      required final String position,
      required final DateTime startDate,
      final DateTime? endDate,
      required final bool isSaving,
      required final bool showErrorMessages}) = _$_AddEmployeeState;

  @override
  String get name;
  @override
  String get position;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  bool get isSaving;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_AddEmployeeStateCopyWith<_$_AddEmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}
