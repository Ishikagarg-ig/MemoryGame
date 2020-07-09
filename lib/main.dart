import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/data/data.dart';
import 'package:memorygame/model/tile_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    reStart();
  }

  void reStart(){
    pairs = getPairs();
    pairs.shuffle();

    visiblePairs=pairs;
    selected=true;
    Future.delayed(const Duration(seconds: 5), (){
      setState(() {
        visiblePairs=getQuestions();
        selected=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          children: <Widget>[
            points!=800 ? Column(
              children: <Widget>[
                Text("$points/800",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                Text("Points"),
              ],
            ) : Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
              child: Text(
                "Memory Game",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),),
            ),
            SizedBox(
              height:20,
            ),
            points!=800 ? GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,mainAxisSpacing: 0.0,
              ),
              children: List.generate(visiblePairs.length, (index){
                return Tile(
                  imageAssetPath: visiblePairs[index].getImageAssetPath(),
                  parent: this,
                  tileIndex: index,
                );
              }),
            ) : Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        points=0;
                        reStart();
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text("Replay", style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;
  int tileIndex;
  _HomePageState parent;

  Tile({this.imageAssetPath,this.parent,this.tileIndex});
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!selected){
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print("You Clicked me");
          if(selectedImageAssetPath == ""){
            selectedTileIndex=widget.tileIndex;
            selectedImageAssetPath=pairs[widget.tileIndex].getImageAssetPath();
          }
          else{
            if(selectedImageAssetPath==pairs[widget.tileIndex].getImageAssetPath()){
              //correct
              print("correct");
              points = points+100;
              selected=true;
              Future.delayed(const Duration(seconds: 2), (){
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");
                });
                setState(() {});
                selected=false;
                selectedImageAssetPath="";
              });
            }
            else{
              //wrong choice
              print("wrong");
              selected=true;
              Future.delayed(const Duration(seconds: 2), (){
                selected=false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                selectedImageAssetPath="";
              });
            }
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: pairs[widget.tileIndex].getImageAssetPath()!="" ? Image.asset(!pairs[widget.tileIndex].getIsSelected() ? widget.imageAssetPath : pairs[widget.tileIndex].getImageAssetPath()) : Image.asset("assets/images/correct.png"),
      ),
    );
  }
}


