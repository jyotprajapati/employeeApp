import 'package:employees_app/features/employee_records/cubit/cubit/add_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final AddEmployeeCubit cubit;
  final bool isStartDate;
  const CustomDatePicker({
    Key? key,
    required this.cubit,
    required this.isStartDate,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      if (widget.isStartDate) {
        widget.cubit.startDateChanged(selectedDate);
      } else {
        widget.cubit.endDateChanged(selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = DateTime.now();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: _selectedInString(selectedDate) ==
                                "Today"
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .primaryColorLight, // Set background color for not selected
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Today', textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = getNextWeekday(DateTime.now(), 1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor:
                            _selectedInString(selectedDate) == "Next Monday"
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'Next Monday',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = getNextWeekday(DateTime.now(), 2);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor:
                            _selectedInString(selectedDate) == "Next Tuesday"
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Next Tuesday',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate =
                              DateTime.now().add(const Duration(days: 7));
                          setState(() {});
                          print(selectedDate);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor:
                            _selectedInString(selectedDate) == "After 1 week"
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Text('After 1 week', textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Selected date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                ),
              ),
              // calendar here
              CalendarDatePicker(
                currentDate: selectedDate,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                  if (widget.isStartDate) {
                    widget.cubit.startDateChanged(selectedDate);
                  } else {
                    widget.cubit.endDateChanged(selectedDate);
                  }
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _selectedInString(DateTime date) {
    DateTime now = DateTime.now();
    DateTime todayDate = DateTime(now.year, now.month, now.day);
    DateTime inputDate = DateTime(date.year, date.month, date.day);
    int difference = inputDate.difference(todayDate).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference > 0 &&
        difference <= 7 &&
        inputDate.weekday == DateTime.monday) {
      return 'Next Monday';
    } else if (difference > 0 &&
        difference <= 7 &&
        inputDate.weekday == DateTime.tuesday) {
      return 'Next Tuesday';
    } else if (difference == 7) {
      return 'After 1 week';
    } else {
      return DateFormat('yyyy-MM-dd').format(inputDate);
    }
  }

  DateTime getNextWeekday(DateTime dt, int weekday) {
    DateTime d = dt.add(Duration(days: (weekday - dt.weekday) % 7));
    return d;
  }
}
