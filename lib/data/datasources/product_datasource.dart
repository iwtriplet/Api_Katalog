import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecatalog/data/models/request/product_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';
import 'package:flutter_ecatalog/data/models/response/upload_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductDataSource {
  Future<Either<String, List<ProductResponseModel>>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/'));
    if (response.statusCode == 200) {
      return Right(List<ProductResponseModel>.from(jsonDecode(response.body)
          .map((x) => ProductResponseModel.fromMap(x))));
    } else {
      return const Left('get product error');
    }
  }

  //https://api.escuelajs.co/api/v1/products/?offset=40&limit=10
  Future<Either<String, List<ProductResponseModel>>> getPaginationProduct(
      {required int offset, required int limit}) async {
    final response = await http.get(Uri.parse(
        'https://api.escuelajs.co/api/v1/products/?offset=$offset&limit=$limit'));
    if (response.statusCode == 200) {
      return Right(List<ProductResponseModel>.from(jsonDecode(response.body)
          .map((x) => ProductResponseModel.fromMap(x))));
    } else {
      return const Left('get product error');
    }
  }

  Future<Either<String, ProductResponseModel>> createProduct(
      ProductRequestModel model) async {
    final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/products/'),
        body: model.toJson(),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('error add product');
    }
  }

//   var request = http.MultipartRequest('POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
// request.files.add(await http.MultipartFile.fromPath('file', '/Users/bahri/Desktop/Screenshot 2023-06-15 at 16.13.40.png'));

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

  Future<Either<String, UploadResponseModel>> uploadImage(XFile image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
    );

    final bytes = await image.readAsBytes();

    final multiPartFile =
        http.MultipartFile.fromBytes('file', bytes, filename: image.name);

    request.files.add(multiPartFile);

    http.StreamedResponse response = await request.send();

    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (response.statusCode == 201) {
      return Right(UploadResponseModel.fromJson(jsonDecode(responseData)));
    } else {
      return const Left('error upload image');
    }
  }
}
