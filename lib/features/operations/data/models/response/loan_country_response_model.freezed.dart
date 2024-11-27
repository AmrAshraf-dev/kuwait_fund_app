// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_country_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanCountryModel _$LoanCountryModelFromJson(Map<String, dynamic> json) {
  return _LoanCountryModel.fromJson(json);
}

/// @nodoc
mixin _$LoanCountryModel {
  String? get countryName => throw _privateConstructorUsedError;
  List<LoanSectorModel?> get loanSectors => throw _privateConstructorUsedError;

  /// Serializes this LoanCountryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanCountryModelCopyWith<LoanCountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanCountryModelCopyWith<$Res> {
  factory $LoanCountryModelCopyWith(
          LoanCountryModel value, $Res Function(LoanCountryModel) then) =
      _$LoanCountryModelCopyWithImpl<$Res, LoanCountryModel>;
  @useResult
  $Res call({String? countryName, List<LoanSectorModel?> loanSectors});
}

/// @nodoc
class _$LoanCountryModelCopyWithImpl<$Res, $Val extends LoanCountryModel>
    implements $LoanCountryModelCopyWith<$Res> {
  _$LoanCountryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? loanSectors = null,
  }) {
    return _then(_value.copyWith(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      loanSectors: null == loanSectors
          ? _value.loanSectors
          : loanSectors // ignore: cast_nullable_to_non_nullable
              as List<LoanSectorModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanCountryModelImplCopyWith<$Res>
    implements $LoanCountryModelCopyWith<$Res> {
  factory _$$LoanCountryModelImplCopyWith(_$LoanCountryModelImpl value,
          $Res Function(_$LoanCountryModelImpl) then) =
      __$$LoanCountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? countryName, List<LoanSectorModel?> loanSectors});
}

/// @nodoc
class __$$LoanCountryModelImplCopyWithImpl<$Res>
    extends _$LoanCountryModelCopyWithImpl<$Res, _$LoanCountryModelImpl>
    implements _$$LoanCountryModelImplCopyWith<$Res> {
  __$$LoanCountryModelImplCopyWithImpl(_$LoanCountryModelImpl _value,
      $Res Function(_$LoanCountryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? loanSectors = null,
  }) {
    return _then(_$LoanCountryModelImpl(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      loanSectors: null == loanSectors
          ? _value._loanSectors
          : loanSectors // ignore: cast_nullable_to_non_nullable
              as List<LoanSectorModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanCountryModelImpl extends _LoanCountryModel {
  const _$LoanCountryModelImpl(
      {required this.countryName,
      required final List<LoanSectorModel?> loanSectors})
      : _loanSectors = loanSectors,
        super._();

  factory _$LoanCountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanCountryModelImplFromJson(json);

  @override
  final String? countryName;
  final List<LoanSectorModel?> _loanSectors;
  @override
  List<LoanSectorModel?> get loanSectors {
    if (_loanSectors is EqualUnmodifiableListView) return _loanSectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loanSectors);
  }

  @override
  String toString() {
    return 'LoanCountryModel(countryName: $countryName, loanSectors: $loanSectors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanCountryModelImpl &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            const DeepCollectionEquality()
                .equals(other._loanSectors, _loanSectors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryName,
      const DeepCollectionEquality().hash(_loanSectors));

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanCountryModelImplCopyWith<_$LoanCountryModelImpl> get copyWith =>
      __$$LoanCountryModelImplCopyWithImpl<_$LoanCountryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanCountryModelImplToJson(
      this,
    );
  }
}

abstract class _LoanCountryModel extends LoanCountryModel {
  const factory _LoanCountryModel(
          {required final String? countryName,
          required final List<LoanSectorModel?> loanSectors}) =
      _$LoanCountryModelImpl;
  const _LoanCountryModel._() : super._();

  factory _LoanCountryModel.fromJson(Map<String, dynamic> json) =
      _$LoanCountryModelImpl.fromJson;

  @override
  String? get countryName;
  @override
  List<LoanSectorModel?> get loanSectors;

  /// Create a copy of LoanCountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanCountryModelImplCopyWith<_$LoanCountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
