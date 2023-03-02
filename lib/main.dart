import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calcule o valor da sua contribuição'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _is_table_visible =  false;
  TextEditingController salarioController = TextEditingController();
  final double _salario_minimo = 1320.00;
  double _salario = 0;




  void _calculate() {
    setState(() {
    _salario = double.parse(salarioController.text);
    _is_table_visible = true;

    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/inss_logo.png', width: 300),
            const Text(
              'Digite aqui seu salário:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, height: 3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: TextFormField(
                controller: salarioController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '00,00',
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const Text(""),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("MEI ou baixa renda",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blue)),
                            Text("5% do salário mínimo",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        Text(
                            ((_salario_minimo * 0.05).toStringAsFixed(2) +
                                    ' R\$')
                                .replaceAll('.', ','),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                      ],
                    ),
                    const Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: const <Widget>[
                            Text("Plano Simplificado",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blue)),
                            Text("11% do salário mínimo",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        Text(
                            ((_salario_minimo * 0.11).toStringAsFixed(2) +
                                    ' R\$')
                                .replaceAll('.', ','),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                      ],
                    ),
                    const Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("Prestador de serviço a PJ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.blue)),
                            Text("11% do seu salário",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        Text(

                            ((_salario * 0.11).toStringAsFixed(2) +
                                ' R\$')
                                .replaceAll('.', ','),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                      ],
                    ),
                    const Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("Plano Normal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blue)),
                            Text("20% do seu salário",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        Text(
                            ((_salario * 0.20).toStringAsFixed(2) +
                                    ' R\$')
                                .replaceAll('.', ','),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        tooltip: 'Increment',
        child: const Icon(Icons.monetization_on_outlined, size: 35),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
