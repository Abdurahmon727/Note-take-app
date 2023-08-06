part of 'calendar_bloc.dart';

@freezed
class CalendarState with _$CalendarState {
  factory CalendarState({
    @Default(null) DateTime? selectedMonth,
    @Default(null) DateTime? selectedDate,
    @Default([]) List<EventModel> models,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _CalendarState;
}
