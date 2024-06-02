import 'package:blocappf/countpage/bloc/counter_bloc.dart';
import 'package:blocappf/crudpage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final int count = state.count;
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  icon: const Icon(Icons.add, size: 50),
                ),
                Text('$count', style: const TextStyle(fontSize: 40)),
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 50,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
        },
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
