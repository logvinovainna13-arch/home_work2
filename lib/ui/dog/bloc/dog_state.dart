part of 'dog_bloc.dart';

@immutable
sealed class DogState {}

final class DogInitial extends DogState {}

final class LoadingDogState extends DogState {}

final class ErrorDogState extends DogState {}

final class LoadedDogImageState extends DogState{
  LoadedDogImageState({required this.img});
  final String img;
}
