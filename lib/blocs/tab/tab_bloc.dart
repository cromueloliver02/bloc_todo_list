// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState.initial()) {
    on<ChangeTabEvent>(_changeTab);
  }
  void _changeTab(ChangeTabEvent event, Emitter<TabState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
