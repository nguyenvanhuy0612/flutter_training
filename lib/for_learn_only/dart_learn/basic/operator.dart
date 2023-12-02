import 'package:flutter/material.dart';

void main() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0

  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  var employee;
  (employee as Person).firstName = 'Bob';

  if (employee is Person) {
    // Type check
    employee.firstName = 'Bob';
  }

  //Assignment operators

  // Assign value to a
  int value = 0;
  a = value;
  // Assign value to b if b is null; otherwise, b stays the same
  b ??= value;

  a = 2; // Assign using =
  a *= 3; // Assign and multiply: a = a * 3
  assert(a == 6);

  var isPublic = true;
  var visibility = isPublic ? 'public' : 'private';

  String playerName(String? name) => name ?? 'Guest';

  // Slightly longer version uses ?: operator.
  String playerName1(String? name) => name != null ? name : 'Guest';

  // Very long version uses if-else statement.
  String playerName2(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }

  // Cascade notation
  var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  // The previous example is equivalent to this code:
  paint = Paint();
  paint.color = Colors.black;
  paint.strokeCap = StrokeCap.round;
  paint.strokeWidth = 5.0;

  querySelector('#confirm') // Get an object.
    ?..text = 'Confirm' // Use its members.
    ..classes.add('important')
    ..onClick.listen((e) => print('Confirmed!'))
    ..scrollIntoView();

  //The previous code is equivalent to the following:
  var button = querySelector('#confirm');
  button?.text = 'Confirm';
  button?.classes.add('important');
  button?.onClick.listen((e) => print('Confirmed!'));
  button?.scrollIntoView();

  final addressBook = (AddressBookBuilder()
    ..name = 'jenny'
    ..email = 'jenny@example.com'
    ..phone = (PhoneNumberBuilder()
      ..number = '415-555-0100'
      ..label = 'home')
        .build())
      .build();


}

class PhoneNumberBuilder {
  set label(String label) {}

  set number(String number) {}

  build() {}
}

class AddressBookBuilder {
  set phone(phone) {}

  set email(String email) {}

  set name(String name) {}

  build() {}
  
}

querySelector(String s) {
}

class Person {
  String? _firstName;

  set firstName(String firstName) {
    _firstName = firstName;
  }
}

class Paint {
  set strokeWidth(double strokeWidth) {}

  set strokeCap(StrokeCap strokeCap) {}

  set color(color) {}
  
}
