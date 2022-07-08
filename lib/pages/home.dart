import 'package:flutter/material.dart';
import '../widgets/verse-card.dart';
import '../widgets/bottom-app-bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        shadowColor: Colors.orangeAccent,
        backgroundColor: Colors.deepOrange[500],
        leading: Image.asset('assets/bible.png'),
        title: const Text('Proverbs Daily'),
      ),
      body: const Center(child: VerseCard()),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}

