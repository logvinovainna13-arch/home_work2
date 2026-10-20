part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class LoadingCatState extends CatState {}

final class ErrorCatState extends CatState {}

final class LoadedCatImageState extends CatState{
  LoadedCatImageState({required this.img});
  final String img;
}
