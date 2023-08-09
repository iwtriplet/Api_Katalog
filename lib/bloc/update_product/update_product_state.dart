part of 'update_product_bloc.dart';

@freezed
class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = _Initial;
  const factory UpdateProductState.loading() = _Loading;
  const factory UpdateProductState.loaded(ProductResponseModel model) = _Loaded;
  const factory UpdateProductState.error(String message) = _Error;
}
