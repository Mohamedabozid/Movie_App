import 'package:breaking_bad/presentaiton/screens/characters.dart';
import 'package:breaking_bad/presentaiton/screens/charater_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/character_cubit.dart';
import 'constants/strings.dart';
import 'data/api_service/characters_api.dart';
import 'data/models/character_model.dart';
import 'data/repositary/characters_repository.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersApi());

    characterCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
            characterCubit ,
            child: CharactersScreen() ,
          ),
        );

      case charactersDetailsScreen:

        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
