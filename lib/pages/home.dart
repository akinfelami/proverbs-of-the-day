import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widgets/verse-card.dart';
import '../widgets/bottom-app-bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? bibleChapter = 'Proverbs 27:14';
  String? bibleDate = '08/07/2022';
  String? bibleTranslation = 'World English Translation';
  String? bibleContent = 'Who has ascended up into heaven, and descended? Who has gathered the wind in his fists? Who has bound the waters in his garment? Who has established all the ends of the earth? What is his name, and what is his son’s name, if you know? ';

  fetchBibleData () async {
    var bibleData = await VerseProvider.getVerse();

    setState((){
      bibleChapter = bibleData['reference'];
      bibleContent = bibleData['content'];
      bibleTranslation= bibleData['translation'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
      appBar: AppBar(
        shadowColor: Colors.orangeAccent,
        backgroundColor: Colors.deepOrange[500],
        leading: Image.asset('assets/bible.png'),
        title: const Text('Proverbs Daily'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.sunny, size: 30,),
                SizedBox(width: 10,),
                Text('Verse of the Day', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: VerseCard(
                chapter: bibleChapter,
                date: '08/05/2022',
                translation: bibleTranslation,
                content: bibleContent),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}

class VerseProvider{

  static Future<Map> getVerse() async {
    var endpoint = "https://agile-savannah-64819.herokuapp.com/verses";
    var url = Uri.parse(endpoint);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }
}