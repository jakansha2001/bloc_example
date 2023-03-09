import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/counter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.status == CounterStatus.error) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('error')));
            }
          },
          builder: (context, state) {
            if (state.status == CounterStatus.loading) {
              return const CircularProgressIndicator();
            }
            return Text(
              state.counter.toString(),
            );
          },
        ),
      ),
    );
  }
}
