import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proverbs_daily/widgets/bottom-app-bar.dart';
import '../widgets/verse-card.dart';


void main () => runApp(const Feed());

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  var bibleData;

  String? bibleChapter = 'Proverbs 27:14';
  String? bibleDate = '08/07/2022';
  String? bibleTranslation = 'World English Translation';
  String? bibleContent = 'Do not Sin';


  fetchBibleListData () async {
    var data = await VerseListProvider.getVerses();
    setState((){
      bibleData = data;
    });

    return bibleData;

}

  @override
  Widget build(BuildContext context) {
    // fetchBibleListData();
    return Scaffold(
      appBar: AppBar(
        elevation:5,
        shadowColor: Colors.orangeAccent,
        backgroundColor: Colors.deepOrange[500],
        title: const Text('Feed'),
        actions: [
          IconButton(onPressed: (){fetchBibleListData();}, icon: const Icon(Icons.refresh))
        ],

      ),
      body: ListView.builder(
          itemCount: bibleData == null ? 0 : bibleData.length,
          itemBuilder: (context, index){
            return  Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: bibleData == null ? const Text('Loading...') :
                Column(
                  children: <Widget> [
                    VerseCard(
                      chapter: bibleData[index]['reference'],
                      date: '08/07/2022',
                      translation: bibleData[index]['translation'],
                      content: bibleData[index]['content'],
                    ),
                  ]
                )
            );
          }
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}

class VerseListProvider{

  static Future<List> getVerses() async {
    var endpoint = "https://agile-savannah-64819.herokuapp.com/verses/feed";
    var url = Uri.parse(endpoint);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }
}


