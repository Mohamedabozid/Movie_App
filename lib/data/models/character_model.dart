class Character
{
  int? charId;
  String? name;
  String? nickName;
  String? image;
  String? statusDeadOrAlive;
  String? actorName;
  String? categoryForTowSeries;
  List<dynamic>? jobs;
  List<dynamic>? appearanceOfSeasons;
  List<dynamic>? betterCallSaulAppearance;


  Character.fromJson(Map<String ,dynamic>json)
  {
    charId =json['char_id'];
    name =json['name'];
    nickName =json['nickname'];
    image =json['img'];
    statusDeadOrAlive =json['status'];
    actorName =json['portrayed'];
    categoryForTowSeries =json['category'];
    jobs =json['occupation'];
    appearanceOfSeasons =json['appearance'];
    betterCallSaulAppearance =json['better_call_saul_appearance'];
  }




}