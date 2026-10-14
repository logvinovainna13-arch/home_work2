import 'package:flutter/material.dart';
import 'package:home_work2/ui/counter/cubit/counter_cubit.dart';
import 'package:home_work2/data/repository/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterPage extends StatefulWidget {
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterRepository _repository = CounterRepository();
  int counter = 0;
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:
      Scaffold(
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
              bloc: _counterCubit,
              builder: (context, state) {
                if (state is GetCounterState) {
                  counter = state.count;
                  return Text(
                      state.count.toString(),
                      style: TextStyle(fontSize: 200)
                  );
                }
                return Text('count', style: TextStyle(fontSize: 200));
              }
          ),
        ),
        floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                  heroTag: 'Text',
                  child: Icon(Icons.add),
                  onPressed: () {
                    _counterCubit.increment(counter);
                  }
              ),
              const SizedBox(height: 14),
              FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    _counterCubit.increment(counter);
                  }
              ),
            ]
        ),
      ),
      );
  }

}