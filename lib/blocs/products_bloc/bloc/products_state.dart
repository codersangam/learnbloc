part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final ProductsModel products;
  const ProductsLoadedState(this.products);
  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String message;
  const ProductsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
