import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomInputForm extends StatefulWidget {
  @override
  _CustomInputFormState createState() => _CustomInputFormState();
}

class _CustomInputFormState extends State<CustomInputForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;
  String? _priority;
  String? _status;
  String? _assignedUser;
  List<String> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      setState(() {
        _users = data
            .map((user) => '${user['first_name']} ${user['last_name']}')
            .toList();
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            ListTile(
              title: Text(_dueDate == null
                  ? 'Select Due Date'
                  : 'Due Date: ${_dueDate!.toLocal()}'.split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDueDate(context),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Priority'),
              value: _priority,
              items: ['High', 'Medium', 'Low']
                  .map((priority) => DropdownMenuItem(
                        child: Text(priority),
                        value: priority,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _priority = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a priority';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Status'),
              value: _status,
              items: ['To-Do', 'In Progress', 'Done']
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _status = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a status';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Assigned User'),
              value: _assignedUser,
              items: _users
                  .map((user) => DropdownMenuItem(
                        value: user,
                        child: Text(user),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _assignedUser = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an assigned user';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the data
                    print('Title: ${_titleController.text}');
                    print('Description: ${_descriptionController.text}');
                    print('Due Date: $_dueDate');
                    print('Priority: $_priority');
                    print('Status: $_status');
                    print('Assigned User: $_assignedUser');
                  } else {
                    print('Title: ${_titleController.text}');
                    print('Description: ${_descriptionController.text}');
                    print('Due Date: $_dueDate');
                    print('Priority: $_priority');
                    print('Status: $_status');
                    print('Assigned User: $_assignedUser');
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
