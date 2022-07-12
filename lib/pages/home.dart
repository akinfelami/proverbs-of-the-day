import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import '../widgets/verse-card.dart';
import 'package:intl/intl.dart';



void main() => runApp(const Home());


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var bibleData;
  final cron = Cron();
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');


  @override
  void initState() {
    scheduleTask();
    super.initState();
  }

  fetchVerse() async {
    var data = await VerseProvider.verseOfTheDay();
    setState((){
      bibleData = data;
    });

    return bibleData;
  }

  // Schedule.parse('0 00 * * *')

  scheduleTask(){
    cron.schedule(Schedule.parse('0 00 * * *'), () async {
      var data = await VerseProvider.getVerse();
      setState(() {
        bibleData = data;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: FutureBuilder(
            future: fetchVerse(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return VerseCard(
                    chapter: bibleData['reference'],
                    date: formatter.format(now),
                    translation: bibleData['translation'],
                    content: bibleData['content']);
    }else{
                return Center(
                child: CircularProgressIndicator(
                color: Colors.deepOrange[500],
                )
                );
              }
    }
          ),
        ),
      ],
    );
  }
}

class VerseProvider{

  static Future<Map> getVerse() async {
    var endpoint = "https://pdbbackend.herokuapp.com/verses";
    var url = Uri.parse(endpoint);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;


  }

  static Future<Map> verseOfTheDay() async{
    var endpoint = "https://pdbbackend.herokuapp.com/verses/verse-of-the-day";
    var url = Uri.parse(endpoint);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;

  }
}