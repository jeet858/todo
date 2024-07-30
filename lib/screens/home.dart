import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/controller/todo.dart';
import 'package:todo/widgets/input_form.dart';
import 'package:todo/widgets/todo_tile.dart';
import 'package:todo/widgets/top_appbar.dart';

import '../controller/demo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // showModalBottomSheet(
          //   context: context,
          //   isScrollControlled: true,
          //   builder: (context) => Padding(
          //     padding: EdgeInsets.only(
          //         bottom: MediaQuery.of(context).viewInsets.bottom),
          //     child: CustomInputForm(),
          //   ),
          // );
          // DatabaseHelper dbHelper = DatabaseHelper();
          // await dbHelper.createTasksTable();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('Tasks table created')),
          // );
          // createDatabase();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              activeColor: kPrimaryColor,
              dayProps: const EasyDayProps(
                activeDayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  dayStrStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  monthStrStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const TodoTile(),
          ],
        ),
      ),
    );
  }
}
