// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanModel {
  String get divisionName;
  List<LoanCountryModel> get loanCountries;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoanModelCopyWith<LoanModel> get copyWith =>
      _$LoanModelCopyWithImpl<LoanModel>(this as LoanModel, _$identity);

  /// Serializes this LoanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoanModel &&
            (identical(other.divisionName, divisionName) ||
                other.divisionName == divisionName) &&
            const DeepCollectionEquality()
                .equals(other.loanCountries, loanCountries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, divisionName,
      const DeepCollectionEquality().hash(loanCountries));

  @override
  String toString() {
    return 'LoanModel(divisionName: $divisionName, loanCountries: $loanCountries)';
  }
}

/// @nodoc
abstract mixin class $LoanModelCopyWith<$Res> {
  factory $LoanModelCopyWith(LoanModel value, $Res Function(LoanModel) _then) =
      _$LoanModelCopyWithImpl;
  @useResult
  $Res call({String divisionName, List<LoanCountryModel> loanCountries});
}

/// @nodoc
class _$LoanModelCopyWithImpl<$Res> implements $LoanModelCopyWith<$Res> {
  _$LoanModelCopyWithImpl(this._self, this._then);

  final LoanModel _self;
  final $Res Function(LoanModel) _then;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? divisionName = null,
    Object? loanCountries = null,
  }) {
    return _then(_self.copyWith(
      divisionName: null == divisionName
          ? _self.divisionName
          : divisionName // ignore: cast_nullable_to_non_nullable
              as String,
      loanCountries: null == loanCountries
          ? _self.loanCountries
          : loanCountries // ignore: cast_nullable_to_non_nullable
              as List<LoanCountryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoanModel extends LoanModel {
  const _LoanModel(
      {required this.divisionName,
      required final List<LoanCountryModel> loanCountries})
      : _loanCountries = loanCountries,
        super._();
  factory _LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);

  @override
  final String divisionName;
  final List<LoanCountryModel> _loanCountries;
  @override
  List<LoanCountryModel> get loanCountries {
    if (_loanCountries is EqualUnmodifiableListView) return _loanCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loanCountries);
  }

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoanModelCopyWith<_LoanModel> get copyWith =>
      __$LoanModelCopyWithImpl<_LoanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanModel &&
            (identical(other.divisionName, divisionName) ||
                other.divisionName == divisionName) &&
            const DeepCollectionEquality()
                .equals(other._loanCountries, _loanCountries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, divisionName,
      const DeepCollectionEquality().hash(_loanCountries));

  @override
  String toString() {
    return 'LoanModel(divisionName: $divisionName, loanCountries: $loanCountries)';
  }
}

/// @nodoc
abstract mixin class _$LoanModelCopyWith<$Res>
    implements $LoanModelCopyWith<$Res> {
  factory _$LoanModelCopyWith(
          _LoanModel value, $Res Function(_LoanModel) _then) =
      __$LoanModelCopyWithImpl;
  @override
  @useResult
  $Res call({String divisionName, List<LoanCountryModel> loanCountries});
}

/// @nodoc
class __$LoanModelCopyWithImpl<$Res> implements _$LoanModelCopyWith<$Res> {
  __$LoanModelCopyWithImpl(this._self, this._then);

  final _LoanModel _self;
  final $Res Function(_LoanModel) _then;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? divisionName = null,
    Object? loanCountries = null,
  }) {
    return _then(_LoanModel(
      divisionName: null == divisionName
          ? _self.divisionName
          : divisionName // ignore: cast_nullable_to_non_nullable
              as String,
      loanCountries: null == loanCountries
          ? _self._loanCountries
          : loanCountries // ignore: cast_nullable_to_non_nullable
              as List<LoanCountryModel>,
    ));
  }
}

// dart format on
