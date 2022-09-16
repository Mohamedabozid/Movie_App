import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {

  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0,),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoCharacter('job : ', character.jobs!.join(' / ')),
                    buildDivider(290),
                    buildInfoCharacter('Appeared in : ', character.categoryForTowSeries!),
                    buildDivider(220),
                    buildInfoCharacter('seasons : ', character.appearanceOfSeasons!.join(' / ')),
                    buildDivider(250),
                    buildInfoCharacter('status : ', character.statusDeadOrAlive!),
                    buildDivider(270),
                    character.betterCallSaulAppearance!.isEmpty ? Container() :
                    buildInfoCharacter('better call saul seasons : ', character.betterCallSaulAppearance!.join(' / ')),
                    character.betterCallSaulAppearance!.isEmpty ? Container() :
                    buildDivider(120),
                    buildInfoCharacter('Actor/Actress : ', character.actorName!),
                    buildDivider(200),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
              )
            ],
          )),

        ],
      ),
    );
  }

  Widget buildSliverAppBar()
  {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.nickName!,
          style: TextStyle(
            color: MyColors.myWhite,
          ),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(character.image!,fit: BoxFit.cover,),
        ),
      ),
    );
  }

  Widget buildInfoCharacter(String tittle ,String value,)
  {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: tittle,
              style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
              ),
            ),
          ],
        )
    );
  }

  Widget buildDivider(double endIndent,)
  {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,

    );
  }
}
