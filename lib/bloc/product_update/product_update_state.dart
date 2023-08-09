part of 'product_update_cubit.dart';

@freezed
class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState.initial() = _Initial;
  const factory ProductUpdateState.loading() = _Loading;
  const factory ProductUpdateState.loaded(ProductResponseModel model) = _Loaded;
  const factory ProductUpdateState.error(String message) = _Error;
}
