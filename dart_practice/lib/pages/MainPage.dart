import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void main() {

    num y = 3;
    y = 4.0;
    int number = 1;

    switch (number) {
      case 1:
        print('one');
    }

    const a = 'a';
    const b = 'b';

    var obj = 'a';

    switch(obj) {

      case [a, b]:
        print('$a, $b');
    }

  }

  void printInts(List<int> a) => print(a);

  @override
  Widget build(BuildContext context) {
    var hi = 'Hi \u{1f606}';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Practice"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    main();
                  },
                  child:
                      const Text("Main 실행"),
              ),
              const SizedBox(height: 20,),
              Text(hi)
            ],
          )
      ),
    );
  }
}
