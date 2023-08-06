part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.init() = _Init;
  const factory CalendarEvent.changeSelectedMonth(DateTime newMonth) =
      _ChangeSelectedMonth;
  const factory CalendarEvent.changeSelectedDate(DateTime newDate) =
      _ChangeSelectedDate;
}
