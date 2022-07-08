import 'package:flutter/material.dart';
import '../pages/feed.dart';
import '../main.dart';

void main () => runApp(const BottomAppBarWidget());

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepOrange[500],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    onPressed: (){
                      ModalRoute.of(context)?.settings.name == '/' ? {} :
                      Navigator.pushNamed(
                        context,
                        '/'
                      );
                    },
                    icon: const Icon(Icons.home, size: 40.0,)),
                const Text('Home')
              ]),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child: IconButton(
                  onPressed: (){
                    Navigator.pushNamed(
                        context,
                        '/feed'
                    );
                  },
                  icon: const Icon(Icons.feed, size: 40.0,))),
              const Center(child: Text('Verses'))
            ],
          )
        ],
      ),
    );
  }
}
