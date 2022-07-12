import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widgets/verse-card.dart';
import 'package:intl/intl.dart';



void main () => runApp(const Feed());

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  bool _showBackToTopButton = false;

  // scroll controller
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 300) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {

    _scrollController.jumpTo(0.0);
  }

  var bibleData;


  fetchBibleListData () async {
    var data = await VerseListProvider.getVerses();
    setState((){
      bibleData = data;
    });

    return bibleData;

  }


  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    return FutureBuilder(
      future: fetchBibleListData(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return Scaffold(
              backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
              floatingActionButton: _showBackToTopButton == false
                  ? null
                  : FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: _scrollToTop,
                child: const Icon(Icons.arrow_upward),
              ),

              body:ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: bibleData == null ? 0 : bibleData.length,
                  itemBuilder: (context, index){
                    return  bibleData == null ? Container(width: 100, height: 200, color: Colors.black, child: const Text('Loading...')) :
                    Column(
                        children: <Widget> [
                          VerseCard(
                            chapter: bibleData[index]['reference'],
                            date: formattedDate,
                            translation: bibleData[index]['translation'],
                            content: bibleData[index]['content'],
                          ),
                          const SizedBox(height: 20,),

                        ]
                    );
                  }
              ),
            );

          }else{
            return Scaffold(
              backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
              body:  Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),
                  SizedBox(height: 10,),
                  Text('Loading...', style: TextStyle(fontSize: 20),)
                ],
              )),
            );
          }
        }
    );

  }
}

class VerseListProvider{

  static Future<List> getVerses() async {
    var endpoint = "https://pdbbackend.herokuapp.com/verses/feed";
    var url = Uri.parse(endpoint);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }
}


