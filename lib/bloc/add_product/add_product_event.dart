part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class DoAddProductEvent extends AddProductEvent {
  final ProductRequestModel model;
  DoAddProductEvent({
    required this.model,
  });
}
