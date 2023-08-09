
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductDataSource dataSource;
  ProductsBloc(
    this.dataSource,
  ) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result =
          await dataSource.getPaginationProduct(offset: 0, limit: 50);
      result.fold(
        (error) => emit(ProductsError(message: error)),
        (result) {
          bool isNext = result.length == 50;
          emit(ProductsLoaded(data: result, isNext: isNext));
        },
      );
    });
    on<NextProductsEvent>((event, emit) async {
      final currentState = state as ProductsLoaded;
      final result = await dataSource.getPaginationProduct(
          offset: currentState.offset + 50, limit: 50);
      result.fold(
        (error) => emit(ProductsError(message: error)),
        (result) {
          bool isNext = result.length == 50;
          // emit(ProductsLoaded(
          //     data: [...currentState.data, ...result],
          //     offset: currentState.offset + 50,
          //     isNext: isNext));
          emit(currentState.copyWith(
              data: [...currentState.data, ...result],
              offset: currentState.offset + 50,
              isNext: isNext));
        },
      );
    });

    on<AddSingleProductsEvent>((event, emit) async {
      final currentState = state as ProductsLoaded;

      emit(currentState.copyWith(
        data: [...currentState.data, event.data],
      ));
    });

    on<ClearProductsEvent>((event, emit) async {
      emit(ProductsInitial());
    });
  }
}
