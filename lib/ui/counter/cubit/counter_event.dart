part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class IncrementCountEvent extends CounterEvent{
  IncrementCountEvent({required this.count});

  final int count;

}
