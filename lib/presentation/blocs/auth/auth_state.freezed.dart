// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileEntity profileModel) authorized,
    required TResult Function() unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileEntity profileModel)? authorized,
    TResult? Function()? unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileEntity profileModel)? authorized,
    TResult Function()? unAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthorized value) authorized,
    required TResult Function(AuthStateUnAuthorized value) unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthorized value)? authorized,
    TResult? Function(AuthStateUnAuthorized value)? unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthorized value)? authorized,
    TResult Function(AuthStateUnAuthorized value)? unAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateAuthorizedImplCopyWith<$Res> {
  factory _$$AuthStateAuthorizedImplCopyWith(_$AuthStateAuthorizedImpl value,
          $Res Function(_$AuthStateAuthorizedImpl) then) =
      __$$AuthStateAuthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileEntity profileModel});
}

/// @nodoc
class __$$AuthStateAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateAuthorizedImpl>
    implements _$$AuthStateAuthorizedImplCopyWith<$Res> {
  __$$AuthStateAuthorizedImplCopyWithImpl(_$AuthStateAuthorizedImpl _value,
      $Res Function(_$AuthStateAuthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileModel = null,
  }) {
    return _then(_$AuthStateAuthorizedImpl(
      null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
    ));
  }
}

/// @nodoc

class _$AuthStateAuthorizedImpl implements AuthStateAuthorized {
  const _$AuthStateAuthorizedImpl(this.profileModel);

  @override
  final ProfileEntity profileModel;

  @override
  String toString() {
    return 'AuthState.authorized(profileModel: $profileModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateAuthorizedImpl &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateAuthorizedImplCopyWith<_$AuthStateAuthorizedImpl> get copyWith =>
      __$$AuthStateAuthorizedImplCopyWithImpl<_$AuthStateAuthorizedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileEntity profileModel) authorized,
    required TResult Function() unAuthorized,
  }) {
    return authorized(profileModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileEntity profileModel)? authorized,
    TResult? Function()? unAuthorized,
  }) {
    return authorized?.call(profileModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileEntity profileModel)? authorized,
    TResult Function()? unAuthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(profileModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthorized value) authorized,
    required TResult Function(AuthStateUnAuthorized value) unAuthorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthorized value)? authorized,
    TResult? Function(AuthStateUnAuthorized value)? unAuthorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthorized value)? authorized,
    TResult Function(AuthStateUnAuthorized value)? unAuthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class AuthStateAuthorized implements AuthState {
  const factory AuthStateAuthorized(final ProfileEntity profileModel) =
      _$AuthStateAuthorizedImpl;

  ProfileEntity get profileModel;
  @JsonKey(ignore: true)
  _$$AuthStateAuthorizedImplCopyWith<_$AuthStateAuthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateUnAuthorizedImplCopyWith<$Res> {
  factory _$$AuthStateUnAuthorizedImplCopyWith(
          _$AuthStateUnAuthorizedImpl value,
          $Res Function(_$AuthStateUnAuthorizedImpl) then) =
      __$$AuthStateUnAuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateUnAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateUnAuthorizedImpl>
    implements _$$AuthStateUnAuthorizedImplCopyWith<$Res> {
  __$$AuthStateUnAuthorizedImplCopyWithImpl(_$AuthStateUnAuthorizedImpl _value,
      $Res Function(_$AuthStateUnAuthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateUnAuthorizedImpl implements AuthStateUnAuthorized {
  const _$AuthStateUnAuthorizedImpl();

  @override
  String toString() {
    return 'AuthState.unAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateUnAuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileEntity profileModel) authorized,
    required TResult Function() unAuthorized,
  }) {
    return unAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileEntity profileModel)? authorized,
    TResult? Function()? unAuthorized,
  }) {
    return unAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileEntity profileModel)? authorized,
    TResult Function()? unAuthorized,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthorized value) authorized,
    required TResult Function(AuthStateUnAuthorized value) unAuthorized,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthorized value)? authorized,
    TResult? Function(AuthStateUnAuthorized value)? unAuthorized,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthorized value)? authorized,
    TResult Function(AuthStateUnAuthorized value)? unAuthorized,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class AuthStateUnAuthorized implements AuthState {
  const factory AuthStateUnAuthorized() = _$AuthStateUnAuthorizedImpl;
}
