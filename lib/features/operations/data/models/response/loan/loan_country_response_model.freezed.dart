// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_country_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanCountryModel {
  String? get countryName;
  List<LoanSectorModel?> get loanSectors;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoanCountryModelCopyWith<LoanCountryModel> get copyWith =>
      _$LoanCountryModelCopyWithImpl<LoanCountryModel>(
          this as LoanCountryModel, _$identity);

  /// Serializes this LoanCountryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoanCountryModel &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            const DeepCollectionEquality()
                .equals(other.loanSectors, loanSectors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryName,
      const DeepCollectionEquality().hash(loanSectors));

  @override
  String toString() {
    return 'LoanCountryModel(countryName: $countryName, loanSectors: $loanSectors)';
  }
}

/// @nodoc
abstract mixin class $LoanCountryModelCopyWith<$Res> {
  factory $LoanCountryModelCopyWith(
          LoanCountryModel value, $Res Function(LoanCountryModel) _then) =
      _$LoanCountryModelCopyWithImpl;
  @useResult
  $Res call({String? countryName, List<LoanSectorModel?> loanSectors});
}

/// @nodoc
class _$LoanCountryModelCopyWithImpl<$Res>
    implements $LoanCountryModelCopyWith<$Res> {
  _$LoanCountryModelCopyWithImpl(this._self, this._then);

  final LoanCountryModel _self;
  final $Res Function(LoanCountryModel) _then;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? loanSectors = null,
  }) {
    return _then(_self.copyWith(
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      loanSectors: null == loanSectors
          ? _self.loanSectors
          : loanSectors // ignore: cast_nullable_to_non_nullable
              as List<LoanSectorModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoanCountryModel extends LoanCountryModel {
  const _LoanCountryModel(
      {required this.countryName,
      required final List<LoanSectorModel?> loanSectors})
      : _loanSectors = loanSectors,
        super._();
  factory _LoanCountryModel.fromJson(Map<String, dynamic> json) =>
      _$LoanCountryModelFromJson(json);

  @override
  final String? countryName;
  final List<LoanSectorModel?> _loanSectors;
  @override
  List<LoanSectorModel?> get loanSectors {
    if (_loanSectors is EqualUnmodifiableListView) return _loanSectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loanSectors);
  }

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoanCountryModelCopyWith<_LoanCountryModel> get copyWith =>
      __$LoanCountryModelCopyWithImpl<_LoanCountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoanCountryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanCountryModel &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            const DeepCollectionEquality()
                .equals(other._loanSectors, _loanSectors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryName,
      const DeepCollectionEquality().hash(_loanSectors));

  @override
  String toString() {
    return 'LoanCountryModel(countryName: $countryName, loanSectors: $loanSectors)';
  }
}

/// @nodoc
abstract mixin class _$LoanCountryModelCopyWith<$Res>
    implements $LoanCountryModelCopyWith<$Res> {
  factory _$LoanCountryModelCopyWith(
          _LoanCountryModel value, $Res Function(_LoanCountryModel) _then) =
      __$LoanCountryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? countryName, List<LoanSectorModel?> loanSectors});
}

/// @nodoc
class __$LoanCountryModelCopyWithImpl<$Res>
    implements _$LoanCountryModelCopyWith<$Res> {
  __$LoanCountryModelCopyWithImpl(this._self, this._then);

  final _LoanCountryModel _self;
  final $Res Function(_LoanCountryModel) _then;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countryName = freezed,
    Object? loanSectors = null,
  }) {
    return _then(_LoanCountryModel(
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      loanSectors: null == loanSectors
          ? _self._loanSectors
          : loanSectors // ignore: cast_nullable_to_non_nullable
              as List<LoanSectorModel?>,
    ));
  }
}

// dart format on
