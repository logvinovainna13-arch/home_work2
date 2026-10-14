import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_work2/data/repository/counter_repository.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  final CounterRepository _repository = CounterRepository();

  void increment(int counter) {
    int count = _repository.increment(counter);
    emit(GetCounterState(count: count));
  }

  void decrement(int counter) {
    int count = _repository.decrement(counter);
    emit(GetCounterState(count: count));
  }
}


