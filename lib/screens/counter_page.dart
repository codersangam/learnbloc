import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/screens/counter_second_page.dart';
import 'package:learnbloc/screens/products_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/counter_bloc.dart';
import 'counter_cubit_page.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Counter".text.make(),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    child: "Increment".text.make(),
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterIncrementEvent());
                    },
                  ),
                  Text(state.count.toString()),
                  ElevatedButton(
                    child: "Decrement".text.make(),
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterDecrementEvent());
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterSecondPage())),
                  child: "Go to Counter second Page".text.make()),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterCubitPage())),
                  child: "Go to Counter Cubit Page".text.make()),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductsPage())),
                  child: "Go to Products Page".text.make()),
            ],
          );
        },
      ),
    );
  }
}
