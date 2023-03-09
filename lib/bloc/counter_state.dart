part of 'counter_bloc.dart';

enum CounterStatus {
  initial,
  loading,
  error,
  loaded,
}

class CounterState {
  
  final int counter;
  final CounterStatus status;

  CounterState({
    required this.counter,
    required this.status,
  });

  CounterState copyWith({
    int? counter,
    CounterStatus? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  }
}
