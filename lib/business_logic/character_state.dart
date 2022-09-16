part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharactersSuccess extends  CharacterState
{
  final List<Character>characters;

  CharactersSuccess(this.characters);
}
