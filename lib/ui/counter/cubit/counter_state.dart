part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class GetCounterState extends CounterState {
  GetCounterState({required this.count});
  final int count;

}
