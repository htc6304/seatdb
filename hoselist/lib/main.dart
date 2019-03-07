
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'page2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sticky Header example',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SimpleScaffold(
      title: 'Flutter Sticky Header example',
      child: new Builder(builder: (BuildContext context) {
        return new CustomScrollView(
          slivers: _buildSlivers(context),
        );
      }),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = new List<Widget>();
    int i = 0;
    slivers.addAll(_buildLists(context, i, i += 5));
    return slivers;
  }

var uaHkList = ["銅鑼灣 UA Cine Times"];
// var uaKlnList = ["旺角 UA Cine Moko","尖沙咀 UA iSQUARE","九龍灣 UA MegaBox","九龍灣 UA 淘大"];

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: new SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, i) => TileDetail(context, listOfTiles[i]) ,
            childCount: 3,
          ),
        ),
      );
    });
  }

// Widget _buildTiles(){
//   return ExpansionTile(key: PageStorageKey(value),)
// }

var areaList = ["香港島","九龍" ,"新界","大嶼山及離島","澳門","kln" ,"NT","YL",];

  Widget _buildHeader(int index, {String text}) {
    return new Container(
       decoration: new BoxDecoration(
    color: Colors.amber,
    // borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
    boxShadow: [new BoxShadow(color: Colors.black54, offset: new Offset(2.0, 2.0),
    blurRadius: 5.0)]
  ),
      height: 20.0,
      // color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        text ?? areaList[index], 
        // style: const TextStyle(color: Colors.white),
      ),
    );
  }

}

class SimpleScaffold extends StatelessWidget {
  const SimpleScaffold({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: child,
    );
  }
}



  

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]] );
}

class TileDetail extends StatelessWidget {
   
  const TileDetail(this.context , this.t);
  final MyTile t;
  final BuildContext context;

Widget _buildTiles(  MyTile t ) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => Navigator.push( context, MaterialPageRoute(builder: ( context) => page2(index: 1,))),
          // subtitle: new Text("Subtitle"),
          leading: new Text("Leading"),
          selected: true,
          // trailing: new Text("trailing"),
          title: new Text(t.title));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }


  Widget build(BuildContext context){
    return _buildTiles(t);
  }
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    '旺角 UA Cine Moko',
    <MyTile>[
      new MyTile('House 1'),
      new MyTile('House 2'),
      new MyTile('House 3'),
      new MyTile('House 4'),
    ],
  ),
  new MyTile(
    '尖沙咀 UA iSQUARE',
    <MyTile>[
       new MyTile('House 1'),
      new MyTile('House 2'),
      new MyTile('House 3'),
      new MyTile('House 4'),
    ],
  ),
  new MyTile(
    '九龍灣 UA MegaBox',
    <MyTile>[
       new MyTile('House 1'),
      new MyTile('House 2'),
      new MyTile('House 3'),
      new MyTile('House 4'),
    ],
  ),
];
