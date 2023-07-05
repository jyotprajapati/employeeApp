import 'package:employees_app/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/models/employee.dart';
import '../../cubit/employee_list_cubits/employee_cubit.dart';
import 'add_employee_page.dart';

// Employee List Page
class EmployeeListPage extends StatelessWidget {
  final EmployeeCubit employeeCubit = EmployeeCubit();

  EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    employeeCubit.getEmployees();
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.employeeList),
      ),
      body: BlocProvider<EmployeeCubit>(
        create: (context) => employeeCubit,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<EmployeeCubit, EmployeeState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Loaded) {
                    if (state.currentEmployees.isEmpty &&
                        state.previousEmployees.isEmpty) {
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(Strings.linkToImage),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(Strings.noEmployeeRecord,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ));
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              Strings.currentEmployee,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor),
                            ),
                            tileColor: Theme.of(context).highlightColor,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.currentEmployees.length,
                            itemBuilder: (context, index) {
                              final employee = state.currentEmployees[index];
                              return Slidable(
                                key: Key(employee.id.toString()),
                                direction: Axis.horizontal,
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  dismissible: DismissiblePane(onDismissed: () {
                                    employeeCubit.deleteEmployee(employee);
                                  }),
                                  children: [
                                    SlidableAction(
                                      onPressed: (c) => employeeCubit
                                          .deleteEmployee(employee),
                                      backgroundColor: const Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: Strings.delete,
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(
                                    employee.name,
                                  ),
                                  subtitle: Text(employee.position),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              Strings.previousEmployee,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor),
                            ),
                            tileColor: Theme.of(context).highlightColor,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.previousEmployees.length,
                            itemBuilder: (context, index) {
                              final employee = state.previousEmployees[index];
                              return ListTile(
                                title: Text(
                                  employee.name,
                                ),
                                subtitle: Text(employee.position),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (state is Error) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        onPressed: () async {
          final employee = await Navigator.of(context).push(
              MaterialPageRoute<Employee?>(
                  builder: (context) => const AddEmployeePage()));
          if (employee != null) {
            employeeCubit.addEmployee(employee);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
