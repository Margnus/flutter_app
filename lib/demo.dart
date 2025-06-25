import 'package:flutter/material.dart';

void main() {
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: const MyFirstPage(title: "My home pager"),
    );
  }


}

class MyFirstPage extends StatefulWidget {

  const MyFirstPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() =>_myFadeTest();
// _MyFirstState();
}

class _MyFirstState extends State<MyFirstPage> {

  int _count = 0;
  String textToShow = 'Hello';
  bool _tigget = true;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _updateButton() {
    setState(() {
      textToShow = "Hello~";
    });
  }

  void toggleWidget() {
    setState(() {
      _tigget = !_tigget;
    });
  }

  Widget _getWidget() {
    if (_tigget) {
      return Text("I am Text");
    } else {
      return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 200, right: 30)
        ),
        child: const Text("I am ElevatedButton"),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_count', style: Theme
                .of(context)
                .textTheme
                .headlineLarge),
            ElevatedButton(
              onPressed: _updateButton,
              child: Text(textToShow),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(left: 200, right: 30),
              ),
            ),
            ElevatedButton(
              onPressed: toggleWidget,
              child: const Text("Toggit to change!"),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 200, right: 30)
              ),
            ),
            _getWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: 'Increment ',
        child: const Icon(Icons.add),
      ),

    );
  }

}

class _myFadeTest extends State<MyFirstPage> with TickerProviderStateMixin{
  
  late AnimationController controller;
  late CurvedAnimation curved;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(microseconds: 2000),
        vsync: this);
    curved = CurvedAnimation(parent: controller, curve: Curves.easeInQuad);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FadeTransition(opacity: curved, child:  const FlutterLogo(size: 100,),),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
          onPressed: (){
            controller.forward();
          },
        child: const Icon(Icons.brush),
      ),
    );
  }
  
}