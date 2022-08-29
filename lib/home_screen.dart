import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/cubit/internet_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Internet Connection".text.make(),
        centerTitle: true,
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: "Internet Connected".text.make()));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: "Internet Lost".text.make()));
          }
        },
        builder: (context, state) {
          if (state is InternetGainedState) {
            return "Internet Gained".text.makeCentered();
          } else if (state is InternetLostState) {
            return "Internet Lost".text.makeCentered();
          } else {
            return "Loading...".text.makeCentered();
          }
        },
      ),
    );
  }
}
