import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_switcher_event.dart';
part 'page_switcher_state.dart';

class PageSwitcherBloc extends Bloc<PageSwitcherEvent, PageSwitcherState> {
  PageSwitcherBloc() : super(PageSwitcherInitial());

  @override
  Stream<PageSwitcherState> mapEventToState(
    PageSwitcherEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
