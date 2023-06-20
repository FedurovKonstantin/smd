import 'package:diagnosticable_annotation/diagnosticable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'person_item.g.dart';

@diagnosticable
class PersonItem extends StatelessWidget with _Diagnosticable {
  final String firstName;
  final String lastName;

  const PersonItem({
    required this.firstName,
    required this.lastName,
    super.key,
  });

  @override
  void debugFillProperties(properties) => _describe(
        properties,
        this,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurpleAccent.withOpacity(0.3),
      ),
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(
          '$firstName $lastName',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
