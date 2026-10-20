part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}
final class GetCatImageEvent extends CatEvent {}

