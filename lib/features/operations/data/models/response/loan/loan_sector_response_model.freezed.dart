// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_sector_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanSectorModel _$LoanSectorModelFromJson(Map<String, dynamic> json) {
  return _LoanSectorModel.fromJson(json);
}

/// @nodoc
mixin _$LoanSectorModel {
  @JsonKey(name: 'sectorName', defaultValue: "")
  String get sectorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;

  /// Serializes this LoanSectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanSectorModelCopyWith<LoanSectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanSectorModelCopyWith<$Res> {
  factory $LoanSectorModelCopyWith(
          LoanSectorModel value, $Res Function(LoanSectorModel) then) =
      _$LoanSectorModelCopyWithImpl<$Res, LoanSectorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sectorName', defaultValue: "") String sectorName,
      @JsonKey(name: 'number') String number,
      @JsonKey(name: 'amount') String amount});
}

/// @nodoc
class _$LoanSectorModelCopyWithImpl<$Res, $Val extends LoanSectorModel>
    implements $LoanSectorModelCopyWith<$Res> {
  _$LoanSectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorName = null,
    Object? number = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanSectorModelImplCopyWith<$Res>
    implements $LoanSectorModelCopyWith<$Res> {
  factory _$$LoanSectorModelImplCopyWith(_$LoanSectorModelImpl value,
          $Res Function(_$LoanSectorModelImpl) then) =
      __$$LoanSectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sectorName', defaultValue: "") String sectorName,
      @JsonKey(name: 'number') String number,
      @JsonKey(name: 'amount') String amount});
}

/// @nodoc
class __$$LoanSectorModelImplCopyWithImpl<$Res>
    extends _$LoanSectorModelCopyWithImpl<$Res, _$LoanSectorModelImpl>
    implements _$$LoanSectorModelImplCopyWith<$Res> {
  __$$LoanSectorModelImplCopyWithImpl(
      _$LoanSectorModelImpl _value, $Res Function(_$LoanSectorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorName = null,
    Object? number = null,
    Object? amount = null,
  }) {
    return _then(_$LoanSectorModelImpl(
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanSectorModelImpl extends _LoanSectorModel {
  const _$LoanSectorModelImpl(
      {@JsonKey(name: 'sectorName', defaultValue: "") required this.sectorName,
      @JsonKey(name: 'number') required this.number,
      @JsonKey(name: 'amount') required this.amount})
      : super._();

  factory _$LoanSectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanSectorModelImplFromJson(json);

  @override
  @JsonKey(name: 'sectorName', defaultValue: "")
  final String sectorName;
  @override
  @JsonKey(name: 'number')
  final String number;
  @override
  @JsonKey(name: 'amount')
  final String amount;

  @override
  String toString() {
    return 'LoanSectorModel(sectorName: $sectorName, number: $number, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanSectorModelImpl &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sectorName, number, amount);

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanSectorModelImplCopyWith<_$LoanSectorModelImpl> get copyWith =>
      __$$LoanSectorModelImplCopyWithImpl<_$LoanSectorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanSectorModelImplToJson(
      this,
    );
  }
}

abstract class _LoanSectorModel extends LoanSectorModel {
  const factory _LoanSectorModel(
          {@JsonKey(name: 'sectorName', defaultValue: "")
          required final String sectorName,
          @JsonKey(name: 'number') required final String number,
          @JsonKey(name: 'amount') required final String amount}) =
      _$LoanSectorModelImpl;
  const _LoanSectorModel._() : super._();

  factory _LoanSectorModel.fromJson(Map<String, dynamic> json) =
      _$LoanSectorModelImpl.fromJson;

  @override
  @JsonKey(name: 'sectorName', defaultValue: "")
  String get sectorName;
  @override
  @JsonKey(name: 'number')
  String get number;
  @override
  @JsonKey(name: 'amount')
  String get amount;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanSectorModelImplCopyWith<_$LoanSectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
