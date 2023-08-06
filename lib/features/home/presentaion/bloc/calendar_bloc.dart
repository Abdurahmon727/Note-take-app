import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:udevs_task/core/data/date_time.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';
part 'calendar_bloc.freezed.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(_CalendarState()) {
    on<_Init>((event, emit) {
      final DateTime selectedMonth = DateTime.now().monthStart;
      emit(state.copyWith(selectedMonth: selectedMonth));
    });

    on<_ChangeSelectedMonth>(
        (event, emit) => emit(state.copyWith(selectedMonth: event.newMonth)));

    on<_ChangeSelectedDate>(
        (event, emit) => emit(state.copyWith(selectedDate: event.newDate)));
  }
}
