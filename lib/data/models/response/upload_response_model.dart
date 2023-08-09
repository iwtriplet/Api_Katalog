// To parse this JSON data, do
//
//     final uploadResponseModel = uploadResponseModelFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_model.freezed.dart';
part 'upload_response_model.g.dart';

@freezed
class UploadResponseModel with _$UploadResponseModel {
  const factory UploadResponseModel({
    required String originalname,
    required String filename,
    required String location,
  }) = _UploadResponseModel;

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseModelFromJson(json);
}
