import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proverbs Daily',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Proverbs Daily'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        shadowColor: Colors.orangeAccent,
        backgroundColor: Colors.deepOrange[500],
        leading: Image.asset('assets/bible.png'),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            VerseCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange[500],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.home, size: 40.0,)),
              const Text('Home')
            ]),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.feed, size: 40.0,))),
                const Center(child: Text('Verses'))
              ],
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VerseCard extends StatefulWidget {
  const VerseCard({
    Key? key,
  }) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Colors.deepOrange[500],
        // color: Colors.transparent,
        child: SizedBox(
        width: 400,
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0) ,
                    child: Center(
                        child: Text('Proverbs 27:14',
                style: TextStyle(fontSize: 20),))),
                subtitle: Center(child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("He who blesses his neighbor with a loud voice early in the morning, it will be taken as a curse by him.",
                  style:  TextStyle(fontSize: 18),),
                )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                // padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Text('08/05/2022',
                      style: TextStyle(fontSize: 16.0),),
                    Text('World English Bible',
                    style: TextStyle(fontSize: 16.0),),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
