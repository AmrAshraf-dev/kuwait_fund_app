// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_sector_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanSectorModel {
  @JsonKey(name: 'sectorName', defaultValue: "")
  String get sectorName;
  @JsonKey(name: 'number')
  String get number;
  @JsonKey(name: 'amount')
  String get amount;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoanSectorModelCopyWith<LoanSectorModel> get copyWith =>
      _$LoanSectorModelCopyWithImpl<LoanSectorModel>(
          this as LoanSectorModel, _$identity);

  /// Serializes this LoanSectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoanSectorModel &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sectorName, number, amount);

  @override
  String toString() {
    return 'LoanSectorModel(sectorName: $sectorName, number: $number, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class $LoanSectorModelCopyWith<$Res> {
  factory $LoanSectorModelCopyWith(
          LoanSectorModel value, $Res Function(LoanSectorModel) _then) =
      _$LoanSectorModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'sectorName', defaultValue: "") String sectorName,
      @JsonKey(name: 'number') String number,
      @JsonKey(name: 'amount') String amount});
}

/// @nodoc
class _$LoanSectorModelCopyWithImpl<$Res>
    implements $LoanSectorModelCopyWith<$Res> {
  _$LoanSectorModelCopyWithImpl(this._self, this._then);

  final LoanSectorModel _self;
  final $Res Function(LoanSectorModel) _then;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorName = null,
    Object? number = null,
    Object? amount = null,
  }) {
    return _then(_self.copyWith(
      sectorName: null == sectorName
          ? _self.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoanSectorModel extends LoanSectorModel {
  const _LoanSectorModel(
      {@JsonKey(name: 'sectorName', defaultValue: "") required this.sectorName,
      @JsonKey(name: 'number') required this.number,
      @JsonKey(name: 'amount') required this.amount})
      : super._();
  factory _LoanSectorModel.fromJson(Map<String, dynamic> json) =>
      _$LoanSectorModelFromJson(json);

  @override
  @JsonKey(name: 'sectorName', defaultValue: "")
  final String sectorName;
  @override
  @JsonKey(name: 'number')
  final String number;
  @override
  @JsonKey(name: 'amount')
  final String amount;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoanSectorModelCopyWith<_LoanSectorModel> get copyWith =>
      __$LoanSectorModelCopyWithImpl<_LoanSectorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoanSectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanSectorModel &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sectorName, number, amount);

  @override
  String toString() {
    return 'LoanSectorModel(sectorName: $sectorName, number: $number, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class _$LoanSectorModelCopyWith<$Res>
    implements $LoanSectorModelCopyWith<$Res> {
  factory _$LoanSectorModelCopyWith(
          _LoanSectorModel value, $Res Function(_LoanSectorModel) _then) =
      __$LoanSectorModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sectorName', defaultValue: "") String sectorName,
      @JsonKey(name: 'number') String number,
      @JsonKey(name: 'amount') String amount});
}

/// @nodoc
class __$LoanSectorModelCopyWithImpl<$Res>
    implements _$LoanSectorModelCopyWith<$Res> {
  __$LoanSectorModelCopyWithImpl(this._self, this._then);

  final _LoanSectorModel _self;
  final $Res Function(_LoanSectorModel) _then;

  /// Create a copy of LoanSectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sectorName = null,
    Object? number = null,
    Object? amount = null,
  }) {
    return _then(_LoanSectorModel(
      sectorName: null == sectorName
          ? _self.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
