
import '../api_service/characters_api.dart';
import '../models/character_model.dart';

class CharactersRepository
{
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);


  Future<List<Character>> getAllCharacters()async
  {
    final characters = await charactersApi.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}