import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _repository = CounterRepository();

  CounterBloc() : super(CounterInitial()) {
    on<IncrementCountEvent>((
        IncrementCountEvent event,
        Emitter<CounterState> emit,
        ) {
      final count = _repository.increment(event.count);
      emit(GetCountState(count: count));
    });
  }
}
