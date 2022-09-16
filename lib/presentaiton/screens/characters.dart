
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/character_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';
import '../widgets/charcter_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool isSearching = false;

  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: isSearching? BackButton(color: MyColors.myGrey,) : Container(),
        title: isSearching ? buildSearchFild() : buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersSuccess) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndecator();
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty? allCharacters.length : searchedForCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: searchTextController.text.isEmpty ? allCharacters[index] : searchedForCharacters[index],
        );
      },
    );
  }

  Widget showLoadingIndecator() {
    return Center(
        child: CircularProgressIndicator(
      color: MyColors.myYellow,
    ));
  }


  Widget buildAppBarTitle() {

    return Text(
      'Characters',
      style: TextStyle(
        color: MyColors.myGrey,
      ),
    );
  }

  Widget buildSearchFild() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character ...',
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18.0,
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: MyColors.myGrey,
        fontSize: 18.0,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where(
          (character) =>
              character.name!.toLowerCase().startsWith(searchedCharacter)
        )
        .toList();
    setState(() {

    });
  }


  List<Widget> buildAppBarActions()
  {
    if(isSearching)
    {
      return
        [
          IconButton(onPressed: ()
          {
            clearSearch();
            Navigator.pop(context);
          },
              icon: Icon(
            Icons.clear,
            color: MyColors.myGrey,
          )),
        ];
    }else
      {
        return
          [
          IconButton(onPressed: startSearch,


            icon: Icon(
              Icons.search,
               color: MyColors.myGrey,
          ),),
        ];
      }
  }

  void startSearch()
  {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void stopSearching()
  {
    clearSearch;

    setState(() {
      isSearching = false;
    });


  }

  void clearSearch()
  {
    searchTextController.clear();
  }
}
