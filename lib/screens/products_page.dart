import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/products_bloc/bloc/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Products".text.make(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsBloc>().add(ProductsLoadedEvent());
        },
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoadedState) {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.products.products!.length,
                      itemBuilder: (context, index) {
                        var data = state.products.products![index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data.thumbnail!,
                              ),
                              Text("${data.title}"),
                              Text("${data.description}"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is ProductsErrorState) {
              return Column(
                children: [
                  Center(
                    child: Text(state.message),
                  ),
                  IconButton(
                      onPressed: () async {
                        context.read<ProductsBloc>().add(ProductsLoadedEvent());
                      },
                      icon: const Icon(Icons.refresh)),
                ],
              );
            }
            return "Something went wrong".text.make();
          },
        ),
      ),
    );
  }
}
