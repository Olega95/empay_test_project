// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoState {
  List<Task> get allTodos => throw _privateConstructorUsedError;
  List<Task> get activeTodos => throw _privateConstructorUsedError;
  List<Task> get completedTodos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {List<Task> allTodos, List<Task> activeTodos, List<Task> completedTodos});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTodos = null,
    Object? activeTodos = null,
    Object? completedTodos = null,
  }) {
    return _then(_value.copyWith(
      allTodos: null == allTodos
          ? _value.allTodos
          : allTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      activeTodos: null == activeTodos
          ? _value.activeTodos
          : activeTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      completedTodos: null == completedTodos
          ? _value.completedTodos
          : completedTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$$_TodoStateCopyWith(
          _$_TodoState value, $Res Function(_$_TodoState) then) =
      __$$_TodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> allTodos, List<Task> activeTodos, List<Task> completedTodos});
}

/// @nodoc
class __$$_TodoStateCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoState>
    implements _$$_TodoStateCopyWith<$Res> {
  __$$_TodoStateCopyWithImpl(
      _$_TodoState _value, $Res Function(_$_TodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTodos = null,
    Object? activeTodos = null,
    Object? completedTodos = null,
  }) {
    return _then(_$_TodoState(
      allTodos: null == allTodos
          ? _value._allTodos
          : allTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      activeTodos: null == activeTodos
          ? _value._activeTodos
          : activeTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      completedTodos: null == completedTodos
          ? _value._completedTodos
          : completedTodos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_TodoState implements _TodoState {
  _$_TodoState(
      {final List<Task> allTodos = const [],
      final List<Task> activeTodos = const [],
      final List<Task> completedTodos = const []})
      : _allTodos = allTodos,
        _activeTodos = activeTodos,
        _completedTodos = completedTodos;

  final List<Task> _allTodos;
  @override
  @JsonKey()
  List<Task> get allTodos {
    if (_allTodos is EqualUnmodifiableListView) return _allTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTodos);
  }

  final List<Task> _activeTodos;
  @override
  @JsonKey()
  List<Task> get activeTodos {
    if (_activeTodos is EqualUnmodifiableListView) return _activeTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeTodos);
  }

  final List<Task> _completedTodos;
  @override
  @JsonKey()
  List<Task> get completedTodos {
    if (_completedTodos is EqualUnmodifiableListView) return _completedTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedTodos);
  }

  @override
  String toString() {
    return 'TodoState(allTodos: $allTodos, activeTodos: $activeTodos, completedTodos: $completedTodos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoState &&
            const DeepCollectionEquality().equals(other._allTodos, _allTodos) &&
            const DeepCollectionEquality()
                .equals(other._activeTodos, _activeTodos) &&
            const DeepCollectionEquality()
                .equals(other._completedTodos, _completedTodos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTodos),
      const DeepCollectionEquality().hash(_activeTodos),
      const DeepCollectionEquality().hash(_completedTodos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      __$$_TodoStateCopyWithImpl<_$_TodoState>(this, _$identity);
}

abstract class _TodoState implements TodoState {
  factory _TodoState(
      {final List<Task> allTodos,
      final List<Task> activeTodos,
      final List<Task> completedTodos}) = _$_TodoState;

  @override
  List<Task> get allTodos;
  @override
  List<Task> get activeTodos;
  @override
  List<Task> get completedTodos;
  @override
  @JsonKey(ignore: true)
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
