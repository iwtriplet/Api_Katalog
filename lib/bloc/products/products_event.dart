part of 'products_bloc.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class NextProductsEvent extends ProductsEvent {}

class AddSingleProductsEvent extends ProductsEvent {
  final ProductResponseModel data;
  AddSingleProductsEvent({
    required this.data,
  });
}

class ClearProductsEvent extends ProductsEvent {}
