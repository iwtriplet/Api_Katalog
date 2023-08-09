part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {}

class ProductsInitial extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsLoaded extends ProductsState {
  final List<ProductResponseModel> data;
  final int offset;
  final int limit;
  final bool isNext;
  ProductsLoaded({
    required this.data,
    this.offset = 0,
    this.limit = 50,
    this.isNext = false,
  });

  ProductsLoaded copyWith({
    List<ProductResponseModel>? data,
    int? offset,
    int? limit,
    bool? isNext,
  }) {
    return ProductsLoaded(
      data: data ?? this.data,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      isNext: isNext ?? this.isNext,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [offset, limit, isNext];
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
