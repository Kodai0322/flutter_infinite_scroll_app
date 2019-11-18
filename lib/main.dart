import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("無限スクロール"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == items.length) {
            _load();
            return Center(child: CircularProgressIndicator());
          } else if (items.length < index) {
            return null;
          } else {
            return Container(
              child: ListTile(title: Text(items[index])),
            );
          }
        },
      ),
    );
  }

  void _load() async {
    await new Future.delayed(const Duration(microseconds: 5));
    setState(() {
      var s = items.length;
      for (var i = 0; i < 5000000; i++) {
        items.add("アイテム${s + i}");
      }
    });
  }
  // ScrollController controller;
  // List<String> items = new List.generate(100000, (index) => '- $index m');

  // @override
  // void initState() {
  //   super.initState();
  //   controller = new ScrollController()..addListener(_scrollListener);
  // }

  // @override
  // void dispose() {
  //   controller.removeListener(_scrollListener);
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     body: new Scrollbar(
  //       child: new ListView.builder(
  //         controller: controller,
  //         itemBuilder: (context, index) {
  //           return new Text(items[index]);
  //         },
  //         itemCount: items.length,
  //       ),
  //     ),
  //   );
  // }

  // void _scrollListener() {
  //   print(controller.position.extentAfter);
  //   if (controller.position.extentAfter < 50000) {
  //     setState(() {
  //       items.addAll(new List.generate(100000, (index) => '- $index .m'));
  //     });
  //   }
  // }
}
