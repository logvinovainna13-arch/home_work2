class CounterRepository {
  int increment (int counter){
    int _count = counter;
    _count ++;
    return _count;
  }

  int decrement (int counter){
    return counter - 1;
  }
}
