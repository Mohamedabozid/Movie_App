import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/character_model.dart';

class CharacterItem extends StatelessWidget {

  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8,),
      padding: EdgeInsetsDirectional.all(4.0,),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8.0,),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen , arguments: character),
        child: GridTile(
          child:
        Hero(
            tag: character.charId!,
          child: Container(
            color: MyColors.myGrey,
            child: character.image!.isNotEmpty
                ?
            FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/image/loading.gif',
              image: character.image!,
              fit: BoxFit.cover,
            ): Image.asset('assets/image/tobic.jpg'),
          ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0,),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.name}',
            style: TextStyle(
              height: 1.3,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        ),
      ),
    );
  }
}
