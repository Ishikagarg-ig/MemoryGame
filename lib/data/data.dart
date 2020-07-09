import 'package:memorygame/model/tile_model.dart';

int points=0;
bool selected=false;
String selectedImageAssetPath="";
int selectedTileIndex;

List<TileModel> visiblePairs = new List<TileModel>();
List<TileModel> pairs = new List<TileModel>();

List<TileModel> getPairs(){
  List<TileModel> pairs=new List<TileModel>();
  TileModel tileModel=new TileModel();

  //1
  tileModel.setImageAssetPath("assets/images/fox.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/images/hippo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/images/horse.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/images/monkey.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //5
  tileModel.setImageAssetPath("assets/images/panda.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/images/parrot.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/images/rabbit.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/images/zoo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestions(){
  List<TileModel> pairs=new List<TileModel>();
  TileModel tileModel=new TileModel();

  //1
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //5
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}
