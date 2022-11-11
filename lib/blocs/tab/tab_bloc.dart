import 'package:equatable/equatable.dart';
import '../blocs.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends HydratedBloc<TabEvent, TabState> {
  TabBloc() : super(TabState.initial()) {
    on<ChangeTabEvent>(_changeTab);
  }
  void _changeTab(ChangeTabEvent event, Emitter<TabState> emit) {
    emit(state.copyWith(index: event.index));
  }

  @override
  TabState? fromJson(Map<String, dynamic> json) {
    return TabState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TabState state) {
    return state.toMap();
  }
}
