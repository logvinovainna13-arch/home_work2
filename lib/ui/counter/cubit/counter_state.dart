part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class GetCountState extends CounterState{
  GetCountState({required this.count});
  final int count;
}
