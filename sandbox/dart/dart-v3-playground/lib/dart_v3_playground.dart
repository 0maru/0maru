int calculate() {
  (int x, int y)
  data = (6, 7);
  return data.$0 * data.$1;
}

(double, double)

getCode(String city) {
  return (1.0, 2.0);
}

sealed

class Either {}

class Left extends Either {
}

class Right extends Either {
}

test(Either either) {
  switch (either) {
    case Left():
      print("Left");
    case Right():
      print("Right");
  }
}