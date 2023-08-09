part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductLoaded extends AddProductState {
  final ProductResponseModel model;
  AddProductLoaded({
    required this.model,
  });
}

class AddProductError extends AddProductState {
  final String message;
  AddProductError({
    required this.message,
  });
}
