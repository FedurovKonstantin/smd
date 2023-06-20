import 'package:flutter/material.dart';
import 'package:fresh_tile/models/person.dart';

import 'view/person_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final persons = [
      Person(
        firstName: 'Иван',
        lastName: 'Иванов',
      ),
      Person(
        firstName: 'Дмитрий',
        lastName: 'Дмитриев',
      ),
      Person(
        firstName: 'Вася',
        lastName: 'Васильев',
      ),
      Person(
        firstName: 'Петр',
        lastName: 'Петров',
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: persons
                .map(
                  (person) => PersonItem(
                    firstName: person.firstName,
                    lastName: person.lastName,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
