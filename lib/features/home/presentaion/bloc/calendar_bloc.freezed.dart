// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime newMonth) changeSelectedMonth,
    required TResult Function(DateTime newDate) changeSelectedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime newMonth)? changeSelectedMonth,
    TResult? Function(DateTime newDate)? changeSelectedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime newMonth)? changeSelectedMonth,
    TResult Function(DateTime newDate)? changeSelectedDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeSelectedMonth value) changeSelectedMonth,
    required TResult Function(_ChangeSelectedDate value) changeSelectedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult? Function(_ChangeSelectedDate value)? changeSelectedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult Function(_ChangeSelectedDate value)? changeSelectedDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'CalendarEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime newMonth) changeSelectedMonth,
    required TResult Function(DateTime newDate) changeSelectedDate,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime newMonth)? changeSelectedMonth,
    TResult? Function(DateTime newDate)? changeSelectedDate,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime newMonth)? changeSelectedMonth,
    TResult Function(DateTime newDate)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeSelectedMonth value) changeSelectedMonth,
    required TResult Function(_ChangeSelectedDate value) changeSelectedDate,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult? Function(_ChangeSelectedDate value)? changeSelectedDate,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult Function(_ChangeSelectedDate value)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements CalendarEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_ChangeSelectedMonthCopyWith<$Res> {
  factory _$$_ChangeSelectedMonthCopyWith(_$_ChangeSelectedMonth value,
          $Res Function(_$_ChangeSelectedMonth) then) =
      __$$_ChangeSelectedMonthCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime newMonth});
}

/// @nodoc
class __$$_ChangeSelectedMonthCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_ChangeSelectedMonth>
    implements _$$_ChangeSelectedMonthCopyWith<$Res> {
  __$$_ChangeSelectedMonthCopyWithImpl(_$_ChangeSelectedMonth _value,
      $Res Function(_$_ChangeSelectedMonth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMonth = null,
  }) {
    return _then(_$_ChangeSelectedMonth(
      null == newMonth
          ? _value.newMonth
          : newMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ChangeSelectedMonth implements _ChangeSelectedMonth {
  const _$_ChangeSelectedMonth(this.newMonth);

  @override
  final DateTime newMonth;

  @override
  String toString() {
    return 'CalendarEvent.changeSelectedMonth(newMonth: $newMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSelectedMonth &&
            (identical(other.newMonth, newMonth) ||
                other.newMonth == newMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSelectedMonthCopyWith<_$_ChangeSelectedMonth> get copyWith =>
      __$$_ChangeSelectedMonthCopyWithImpl<_$_ChangeSelectedMonth>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime newMonth) changeSelectedMonth,
    required TResult Function(DateTime newDate) changeSelectedDate,
  }) {
    return changeSelectedMonth(newMonth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime newMonth)? changeSelectedMonth,
    TResult? Function(DateTime newDate)? changeSelectedDate,
  }) {
    return changeSelectedMonth?.call(newMonth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime newMonth)? changeSelectedMonth,
    TResult Function(DateTime newDate)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (changeSelectedMonth != null) {
      return changeSelectedMonth(newMonth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeSelectedMonth value) changeSelectedMonth,
    required TResult Function(_ChangeSelectedDate value) changeSelectedDate,
  }) {
    return changeSelectedMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult? Function(_ChangeSelectedDate value)? changeSelectedDate,
  }) {
    return changeSelectedMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult Function(_ChangeSelectedDate value)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (changeSelectedMonth != null) {
      return changeSelectedMonth(this);
    }
    return orElse();
  }
}

abstract class _ChangeSelectedMonth implements CalendarEvent {
  const factory _ChangeSelectedMonth(final DateTime newMonth) =
      _$_ChangeSelectedMonth;

  DateTime get newMonth;
  @JsonKey(ignore: true)
  _$$_ChangeSelectedMonthCopyWith<_$_ChangeSelectedMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeSelectedDateCopyWith<$Res> {
  factory _$$_ChangeSelectedDateCopyWith(_$_ChangeSelectedDate value,
          $Res Function(_$_ChangeSelectedDate) then) =
      __$$_ChangeSelectedDateCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime newDate});
}

/// @nodoc
class __$$_ChangeSelectedDateCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_ChangeSelectedDate>
    implements _$$_ChangeSelectedDateCopyWith<$Res> {
  __$$_ChangeSelectedDateCopyWithImpl(
      _$_ChangeSelectedDate _value, $Res Function(_$_ChangeSelectedDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newDate = null,
  }) {
    return _then(_$_ChangeSelectedDate(
      null == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ChangeSelectedDate implements _ChangeSelectedDate {
  const _$_ChangeSelectedDate(this.newDate);

  @override
  final DateTime newDate;

  @override
  String toString() {
    return 'CalendarEvent.changeSelectedDate(newDate: $newDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSelectedDate &&
            (identical(other.newDate, newDate) || other.newDate == newDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSelectedDateCopyWith<_$_ChangeSelectedDate> get copyWith =>
      __$$_ChangeSelectedDateCopyWithImpl<_$_ChangeSelectedDate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime newMonth) changeSelectedMonth,
    required TResult Function(DateTime newDate) changeSelectedDate,
  }) {
    return changeSelectedDate(newDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime newMonth)? changeSelectedMonth,
    TResult? Function(DateTime newDate)? changeSelectedDate,
  }) {
    return changeSelectedDate?.call(newDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime newMonth)? changeSelectedMonth,
    TResult Function(DateTime newDate)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (changeSelectedDate != null) {
      return changeSelectedDate(newDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeSelectedMonth value) changeSelectedMonth,
    required TResult Function(_ChangeSelectedDate value) changeSelectedDate,
  }) {
    return changeSelectedDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult? Function(_ChangeSelectedDate value)? changeSelectedDate,
  }) {
    return changeSelectedDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeSelectedMonth value)? changeSelectedMonth,
    TResult Function(_ChangeSelectedDate value)? changeSelectedDate,
    required TResult orElse(),
  }) {
    if (changeSelectedDate != null) {
      return changeSelectedDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeSelectedDate implements CalendarEvent {
  const factory _ChangeSelectedDate(final DateTime newDate) =
      _$_ChangeSelectedDate;

  DateTime get newDate;
  @JsonKey(ignore: true)
  _$$_ChangeSelectedDateCopyWith<_$_ChangeSelectedDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarState {
  DateTime? get selectedMonth => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  List<EventModel> get models => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {DateTime? selectedMonth,
      DateTime? selectedDate,
      List<EventModel> models});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMonth = freezed,
    Object? selectedDate = freezed,
    Object? models = null,
  }) {
    return _then(_value.copyWith(
      selectedMonth: freezed == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$_CalendarStateCopyWith(
          _$_CalendarState value, $Res Function(_$_CalendarState) then) =
      __$$_CalendarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? selectedMonth,
      DateTime? selectedDate,
      List<EventModel> models});
}

/// @nodoc
class __$$_CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_CalendarState>
    implements _$$_CalendarStateCopyWith<$Res> {
  __$$_CalendarStateCopyWithImpl(
      _$_CalendarState _value, $Res Function(_$_CalendarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMonth = freezed,
    Object? selectedDate = freezed,
    Object? models = null,
  }) {
    return _then(_$_CalendarState(
      selectedMonth: freezed == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ));
  }
}

/// @nodoc

class _$_CalendarState implements _CalendarState {
  _$_CalendarState(
      {this.selectedMonth = null,
      this.selectedDate = null,
      final List<EventModel> models = const []})
      : _models = models;

  @override
  @JsonKey()
  final DateTime? selectedMonth;
  @override
  @JsonKey()
  final DateTime? selectedDate;
  final List<EventModel> _models;
  @override
  @JsonKey()
  List<EventModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  String toString() {
    return 'CalendarState(selectedMonth: $selectedMonth, selectedDate: $selectedDate, models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarState &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMonth, selectedDate,
      const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarStateCopyWith<_$_CalendarState> get copyWith =>
      __$$_CalendarStateCopyWithImpl<_$_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  factory _CalendarState(
      {final DateTime? selectedMonth,
      final DateTime? selectedDate,
      final List<EventModel> models}) = _$_CalendarState;

  @override
  DateTime? get selectedMonth;
  @override
  DateTime? get selectedDate;
  @override
  List<EventModel> get models;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarStateCopyWith<_$_CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}
