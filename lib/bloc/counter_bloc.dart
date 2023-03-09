import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(CounterState(
          counter: 0,
          status: CounterStatus.initial,
        )) {
    on<IncrementEvent>(_handleIncrementEvent);
    on<DecrementEvent>(_handleDecrementEvent);
  }

  Future<void> _handleIncrementEvent(
    IncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CounterStatus.loading,
      ),
    );
    await Future.delayed(const Duration(seconds: 5));
    emit(
      state.copyWith(
        counter: state.counter + 1,
        status: CounterStatus.loaded,
      ),
    );
  }

  Future<void> _handleDecrementEvent(
    DecrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(
      status: CounterStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 5));
    emit(
      state.copyWith(
        status: CounterStatus.error,
      ),
    );
  }
}
