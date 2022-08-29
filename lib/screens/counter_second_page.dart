import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/counter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class CounterSecondPage extends StatefulWidget {
  const CounterSecondPage({Key? key}) : super(key: key);

  @override
  State<CounterSecondPage> createState() => _CounterSecondPageState();
}

class _CounterSecondPageState extends State<CounterSecondPage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Second Page"),
      ),
      body: Column(
        children: [
          "${counterBloc.state.count}".text.make(),
        ],
      ),
    );
  }
}
