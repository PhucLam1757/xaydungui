import "package:flutter/material.dart";

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CaculatorApp(),
  ));
}

class CaculatorApp extends StatefulWidget {
  const CaculatorApp({super.key});

  @override
  State<CaculatorApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CaculatorApp> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  var _result;

  void Sum(var a, var b) {
    setState(() {
      _result = '${a + b}';
    });

    ;
  }

  void Sub(var a, var b) {
    setState(() {
      _result = '${a - b}';
    });
  }

  void Mul(var a, var b) {
    setState(() {
      _result = '${a * b}';
    });
  }

  void Div(var a, var b) {
    setState(() {
      if (b == 0) {
        _result = " Khong ton tai phep chia cho 0 ";
      } else {
        _result = '${a / b}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Column(children: [
      SizedBox(height: 15),
      Container(
        child: Image.asset("assets/images/caculator.jpg"),
        padding: EdgeInsets.all(20.0),
        width: 500,
        height: 200,
      ),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: TextField(
                keyboardType: TextInputType.number,
                controller: myController1,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Nhập số A")),
          ),
        ),
        width: 200,
        height: 50,
      ),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: TextField(
                keyboardType: TextInputType.number,
                controller: myController2,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Nhập số B")),
          ),
        ),
        width: 200,
        height: 50,
      ),
      SizedBox(height: 10),
      Container(
          child: Text("Kết quả:$_result ",
              style: TextStyle(fontSize: 20, color: Colors.red[200]))),
      SizedBox(height: 10),
      Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text("+"),
                onPressed: () {
                  Sum(double.tryParse(myController1.text),
                      double.tryParse(myController2.text));

                  // setState(() {
                  //   var a = double.tryParse(myController1.text);
                  //   var b = double.tryParse(myController2.text);
                  //   _result = '${';
                  // });
                },
              )),
          SizedBox(width: 5),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text("-"),
                onPressed: () {
                  Sub(double.tryParse(myController1.text),
                      double.tryParse(myController2.text));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              )),
          SizedBox(width: 5),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text("x"),
                onPressed: () {
                  Mul(double.tryParse(myController1.text),
                      double.tryParse(myController2.text));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              )),
          SizedBox(width: 5),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text(":"),
                onPressed: () {
                  Div(double.tryParse(myController1.text),
                      double.tryParse(myController2.text));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
              ))
        ]),
      )),
    ])));
  }
}
