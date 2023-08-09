// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadResponseModel _$UploadResponseModelFromJson(Map<String, dynamic> json) {
  return _UploadResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UploadResponseModel {
  String get originalname => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadResponseModelCopyWith<UploadResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadResponseModelCopyWith<$Res> {
  factory $UploadResponseModelCopyWith(
          UploadResponseModel value, $Res Function(UploadResponseModel) then) =
      _$UploadResponseModelCopyWithImpl<$Res, UploadResponseModel>;
  @useResult
  $Res call({String originalname, String filename, String location});
}

/// @nodoc
class _$UploadResponseModelCopyWithImpl<$Res, $Val extends UploadResponseModel>
    implements $UploadResponseModelCopyWith<$Res> {
  _$UploadResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalname = null,
    Object? filename = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      originalname: null == originalname
          ? _value.originalname
          : originalname // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadResponseModelCopyWith<$Res>
    implements $UploadResponseModelCopyWith<$Res> {
  factory _$$_UploadResponseModelCopyWith(_$_UploadResponseModel value,
          $Res Function(_$_UploadResponseModel) then) =
      __$$_UploadResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String originalname, String filename, String location});
}

/// @nodoc
class __$$_UploadResponseModelCopyWithImpl<$Res>
    extends _$UploadResponseModelCopyWithImpl<$Res, _$_UploadResponseModel>
    implements _$$_UploadResponseModelCopyWith<$Res> {
  __$$_UploadResponseModelCopyWithImpl(_$_UploadResponseModel _value,
      $Res Function(_$_UploadResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalname = null,
    Object? filename = null,
    Object? location = null,
  }) {
    return _then(_$_UploadResponseModel(
      originalname: null == originalname
          ? _value.originalname
          : originalname // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadResponseModel implements _UploadResponseModel {
  const _$_UploadResponseModel(
      {required this.originalname,
      required this.filename,
      required this.location});

  factory _$_UploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_UploadResponseModelFromJson(json);

  @override
  final String originalname;
  @override
  final String filename;
  @override
  final String location;

  @override
  String toString() {
    return 'UploadResponseModel(originalname: $originalname, filename: $filename, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadResponseModel &&
            (identical(other.originalname, originalname) ||
                other.originalname == originalname) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, originalname, filename, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadResponseModelCopyWith<_$_UploadResponseModel> get copyWith =>
      __$$_UploadResponseModelCopyWithImpl<_$_UploadResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadResponseModelToJson(
      this,
    );
  }
}

abstract class _UploadResponseModel implements UploadResponseModel {
  const factory _UploadResponseModel(
      {required final String originalname,
      required final String filename,
      required final String location}) = _$_UploadResponseModel;

  factory _UploadResponseModel.fromJson(Map<String, dynamic> json) =
      _$_UploadResponseModel.fromJson;

  @override
  String get originalname;
  @override
  String get filename;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$_UploadResponseModelCopyWith<_$_UploadResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
