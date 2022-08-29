import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../cubits/cubit/counter_cubit.dart';

class CounterCubitPage extends StatefulWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  State<CounterCubitPage> createState() => _CounterCubitPageState();
}

class _CounterCubitPageState extends State<CounterCubitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Counter".text.make(),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: "Increment".text.make(),
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                  ),
                  10.widthBox,
                  "${state.counter}".text.bold.xl3.make(),
                  10.widthBox,
                  ElevatedButton(
                    child: "Decrement".text.make(),
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                  ),
                ],
              ),
              // ElevatedButton(
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const CounterSecondPage())),
              //     child: "Go to Counter second Page".text.make()),
            ],
          );
        },
      ),
    );
  }
}
