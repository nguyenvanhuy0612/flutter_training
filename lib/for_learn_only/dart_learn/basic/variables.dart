void main() {
  var name = 'Bob';
  Object name1 = 'Bob';
  String name2 = 'Bob';

  String? name3;  // Nullable type. Can be `null` or string.
  String name4;   // Non-nullable type. Cannot be `null` but can be string.

  int? lineCount;
  assert(lineCount == null);

  int lineCount1 = 0;

  int lineCount2;

  bool weLikeToCount = true;

  if (weLikeToCount) {
    lineCount2 = countLines();
  } else {
    lineCount2 = 0;
  }

  print(lineCount2);


  late String description;
  description = 'Feijoada!';
  print(description);

  //In the following example, if the temperature variable is never used, then the expensive readThermometer() function is never called:

  // This is the program's only call to readThermometer().
  late String temperature = readThermometer(); // Lazily initialized.

  final name5 = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';

  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere

  var foo = const [];
  final bar1 = const [];
  const baz = []; // Equivalent to `const []`

  foo = [1, 2, 3]; // Was const []

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.

  print(name);
  print(name1);
  print(name2);
  print(name3);
  //print(name4);
}

String readThermometer() {
  return '';
}

int countLines() {
  return 1;
}