import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/character_model.dart';
import '../data/repositary/characters_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {

  final CharactersRepository charactersRepository;
    List<Character>characters =[];

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());


  List<Character>getAllCharacters()
  {
    charactersRepository.getAllCharacters().then((characters)
    {
      emit(CharactersSuccess(characters));
      this.characters = characters;
    });

    return characters;
  }

}
