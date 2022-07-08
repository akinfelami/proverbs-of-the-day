import 'package:flutter/material.dart';
import 'package:proverbs_daily/widgets/bottom-app-bar.dart';
import '../main.dart';


void main () => runApp(const Feed());

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        shadowColor: Colors.orangeAccent,
        backgroundColor: Colors.deepOrange[500],
        title: const Text('Feed'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
