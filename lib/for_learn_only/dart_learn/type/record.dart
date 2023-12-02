var record = ('first', a: 2, b: true, 'last');

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

// Record type annotation in a variable declaration:
// Initialize it with a record expression:
(String, int) record1 = ('A string', 123);

// Record type annotation in a variable declaration:
// Initialize it with a record expression:
({int a, bool b}) record2 = (a: 123, b: true);

({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);
// Compile error! These records don't have the same type.
// recordAB = recordXY;

(int a, int b) recordAB1 = (1, 2);
(int x, int y) recordXY1 = (3, 4);

bool isEqual = recordAB1 == recordXY1; // OK.