import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/date_time.dart';
import '../../../../core/models/formz/formz_status.dart';
import '../../data/models/event_model.dart';
import '../../data/repositories/home_repo.dart';
import '../../domain/repositories/home_repo.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final HomeRepository _repository = HomeRepositoryImpl();

  CalendarBloc() : super(_CalendarState()) {
    on<_Init>((event, emit) {
      final DateTime selectedMonth = DateTime.now().monthStart;
      emit(state.copyWith(selectedMonth: selectedMonth));
    });

    on<_ChangeSelectedMonth>(
        (event, emit) => emit(state.copyWith(selectedMonth: event.newMonth)));

    on<_ChangeSelectedDate>((event, emit) {
      emit(
        state.copyWith(
          selectedDate: event.newDate,
          status: FormzStatus.submissionInProgress,
        ),
      );
    });

    on<_AddEvent>((event, emit) async {
      final currentModels = state.models;
      emit(state.copyWith(models: currentModels + [event.model]));
      final result = await _repository.addNewEvent(event.model);
      result.either((value) {
        event.onFailure(value.errorMessage);
      }, (_) {
        event.onSuccess();
      });
    });
  }
}
