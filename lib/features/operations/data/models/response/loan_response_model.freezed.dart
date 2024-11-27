// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanModel _$LoanModelFromJson(Map<String, dynamic> json) {
  return _LoanModel.fromJson(json);
}

/// @nodoc
mixin _$LoanModel {
  String get divisionName => throw _privateConstructorUsedError;
  List<LoanCountryModel> get loanCountries =>
      throw _privateConstructorUsedError;

  /// Serializes this LoanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanModelCopyWith<LoanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanModelCopyWith<$Res> {
  factory $LoanModelCopyWith(LoanModel value, $Res Function(LoanModel) then) =
      _$LoanModelCopyWithImpl<$Res, LoanModel>;
  @useResult
  $Res call({String divisionName, List<LoanCountryModel> loanCountries});
}

/// @nodoc
class _$LoanModelCopyWithImpl<$Res, $Val extends LoanModel>
    implements $LoanModelCopyWith<$Res> {
  _$LoanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? divisionName = null,
    Object? loanCountries = null,
  }) {
    return _then(_value.copyWith(
      divisionName: null == divisionName
          ? _value.divisionName
          : divisionName // ignore: cast_nullable_to_non_nullable
              as String,
      loanCountries: null == loanCountries
          ? _value.loanCountries
          : loanCountries // ignore: cast_nullable_to_non_nullable
              as List<LoanCountryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanModelImplCopyWith<$Res>
    implements $LoanModelCopyWith<$Res> {
  factory _$$LoanModelImplCopyWith(
          _$LoanModelImpl value, $Res Function(_$LoanModelImpl) then) =
      __$$LoanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String divisionName, List<LoanCountryModel> loanCountries});
}

/// @nodoc
class __$$LoanModelImplCopyWithImpl<$Res>
    extends _$LoanModelCopyWithImpl<$Res, _$LoanModelImpl>
    implements _$$LoanModelImplCopyWith<$Res> {
  __$$LoanModelImplCopyWithImpl(
      _$LoanModelImpl _value, $Res Function(_$LoanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? divisionName = null,
    Object? loanCountries = null,
  }) {
    return _then(_$LoanModelImpl(
      divisionName: null == divisionName
          ? _value.divisionName
          : divisionName // ignore: cast_nullable_to_non_nullable
              as String,
      loanCountries: null == loanCountries
          ? _value._loanCountries
          : loanCountries // ignore: cast_nullable_to_non_nullable
              as List<LoanCountryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanModelImpl extends _LoanModel {
  const _$LoanModelImpl(
      {required this.divisionName,
      required final List<LoanCountryModel> loanCountries})
      : _loanCountries = loanCountries,
        super._();

  factory _$LoanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanModelImplFromJson(json);

  @override
  final String divisionName;
  final List<LoanCountryModel> _loanCountries;
  @override
  List<LoanCountryModel> get loanCountries {
    if (_loanCountries is EqualUnmodifiableListView) return _loanCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loanCountries);
  }

  @override
  String toString() {
    return 'LoanModel(divisionName: $divisionName, loanCountries: $loanCountries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanModelImpl &&
            (identical(other.divisionName, divisionName) ||
                other.divisionName == divisionName) &&
            const DeepCollectionEquality()
                .equals(other._loanCountries, _loanCountries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, divisionName,
      const DeepCollectionEquality().hash(_loanCountries));

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanModelImplCopyWith<_$LoanModelImpl> get copyWith =>
      __$$LoanModelImplCopyWithImpl<_$LoanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanModelImplToJson(
      this,
    );
  }
}

abstract class _LoanModel extends LoanModel {
  const factory _LoanModel(
      {required final String divisionName,
      required final List<LoanCountryModel> loanCountries}) = _$LoanModelImpl;
  const _LoanModel._() : super._();

  factory _LoanModel.fromJson(Map<String, dynamic> json) =
      _$LoanModelImpl.fromJson;

  @override
  String get divisionName;
  @override
  List<LoanCountryModel> get loanCountries;

  /// Create a copy of LoanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanModelImplCopyWith<_$LoanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
