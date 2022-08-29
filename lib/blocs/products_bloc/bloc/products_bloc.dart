import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/data/repository/products_repo.dart';
import 'package:learnbloc/models/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try {
        var data = await productsRepo.productsApi.getProducts();
        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
