void main() {
  var list0 = [1, 2, 3];

  var list1 = [
    'Car',
    'Boat',
    'Plane',
  ];

  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // This line will cause an error.

  // Sets

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // This line will cause an error.

  // Maps

  var gifts0 = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases0 = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var gifts = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var gifts1 = {'first': 'partridge'};
  gifts1['fourth'] = 'calling birds'; // Add a key-value pair

  var gifts2 = {'first': 'partridge'};
  assert(gifts2['first'] == 'partridge');

  var gifts3 = {'first': 'partridge'};
  assert(gifts3['fifth'] == null);

  var gifts4 = {'first': 'partridge'};
  gifts4['fourth'] = 'calling birds';
  assert(gifts4.length == 2);

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // constantMap[2] = 'Helium'; // This line will cause an error.
}

class Operators {
  void spread_operators() {
    var list = [1, 2, 3];
    var list2 = [0, ...list];
    assert(list2.length == 4);

    var list3 = null;
    var list4 = [0, ...?list3];
    assert(list4.length == 1);
  }

  void sontrol_flow_operators() {
    var promoActive = false;
    var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

    //var nav = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];

    var listOfInts = [1, 2, 3];
    var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
    assert(listOfStrings[1] == '#1');
  }
}
