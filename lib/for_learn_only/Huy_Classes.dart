


void main() {
  Point p = Point(2, 2);
  p?.display();

  p ??= Point(1, 1);


}

class Point {
  int x, y;
  Point(this.x, this.y);

  void display() {
    print("$x - $y");
  }
}