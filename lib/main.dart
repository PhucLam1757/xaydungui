import "package:flutter/material.dart";
import "dart:math";

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UiApp(),
  ));
}

class UiApp extends StatefulWidget {
  const UiApp({super.key});

  @override
  State<UiApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UiApp> {
  int _count = 0;
  Color? color;
  // @override
  void _setColor() {
    setState(() {
      if (_count % 2 == 0) {
        color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), Random().nextInt(256));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My app"),
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
            child: Center(
          child: ElevatedButton(
            onPressed: () {
              _setColor();
              final snackbar = SnackBar(
                  content: Text("Back ground color was changed! $color"),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {},
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: Text("Click Change!!"),
          ),
        )),
        backgroundColor: color);
  }
}
