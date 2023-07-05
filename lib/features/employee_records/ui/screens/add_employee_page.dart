// ignore_for_file: use_build_context_synchronously

import 'package:employees_app/constants/string.dart';
import 'package:employees_app/core/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit/add_employee_cubit.dart';
import '../widgets/date_picker.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final List<String> _positions = [
    Strings.flutterdeveloper,
    Strings.productDesigner,
    Strings.qaTester,
    Strings.productQwner
  ];

  final cubit = AddEmployeeCubit();

  bool isItTodaysDate({required DateTime givenDate}) {
    return DateTime(givenDate.year, givenDate.month, givenDate.day) ==
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(Strings.addEmployeeTitle),
      ),
      body: BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
        bloc: cubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isSaving) const LinearProgressIndicator(),
                _buildNameTextField(state),
                const SizedBox(height: 16.0),
                _buildPositionTextField(state),
                const SizedBox(height: 16.0),
                _buildDateRow(context, state),
                const SizedBox(height: 16.0),
                const Spacer(),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                _buildButtonRow(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNameTextField(AddEmployeeState state) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIconColor: Colors.blue,
        labelText: Strings.employeeNameLabel,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      onChanged: (value) {
        cubit.nameChanged(value);
      },
      enabled: !state.isSaving,
    );
  }

  Widget _buildPositionTextField(AddEmployeeState state) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        if (!state.isSaving) {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: _positions.map((position) {
                  return ListTile(
                    title: Center(child: Text(position)),
                    onTap: () {
                      cubit.positionChanged(position);
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              );
            },
          );
        }
      },
      decoration: InputDecoration(
        labelText: Strings.selectRoleLebel,
        prefixIcon: const Icon(Icons.work),
        prefixIconColor: Colors.blue,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        suffixIconColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      controller: TextEditingController(text: state.position),
      enabled: !state.isSaving,
    );
  }

  Widget _buildDateRow(BuildContext context, AddEmployeeState state) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!state.isSaving) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDatePicker(
                      cubit: cubit,
                      isStartDate: true,
                    );
                  },
                );
              }
            },
            child: TextField(
              enabled: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                prefixIconColor: Colors.blue,
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: isItTodaysDate(givenDate: state.startDate)
                    ? Strings.todaylebel
                    : state.startDate.toString().split(' ')[0],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!state.isSaving) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDatePicker(
                      cubit: cubit,
                      isStartDate: false,
                    );
                  },
                );
              }
            },
            child: TextField(
              enabled: false,
              decoration: const InputDecoration(
                prefixIconColor: Colors.blue,
                labelText: Strings.noDatelebel,
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: state.endDate != null
                    ? state.endDate.toString().split(' ')[0]
                    : '',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context, AddEmployeeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            if (!state.isSaving) {
              Navigator.pop(context);
            }
          },
          child: Text(Strings.cancel),
        ),
        SizedBox(width: 16.0),
        TextButton(
          onPressed: () async {
            if (!state.isSaving) {
              Navigator.pop(
                context,
                Employee(
                  name: state.name,
                  position: state.position,
                  dateJoined: state.startDate,
                  dateLeft: state.endDate,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(Strings.employeeAddedSucessfully),
                ),
              );
            }
          },
          child: Text('Save'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
