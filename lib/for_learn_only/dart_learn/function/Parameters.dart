/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {}

void enableFlags1({bool bold = false, bool hidden = false}) {}

void Scrollbar({int key = 1, required String child}){}
void Scrollbar1({int key = 1, required String? child}){}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String say2(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

void printElement(int element) {
  print(element);
}

void main(List<String> arguments) {
  enableFlags(bold: true, hidden: false);
  enableFlags(bold: true);
  enableFlags1(bold: true);

  assert(say('Bob', 'Howdy') == 'Bob says Howdy');

  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');

  assert(say2('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');

  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(printElement);

  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}