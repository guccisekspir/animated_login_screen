import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'page_switcher_event.dart';
part 'page_switcher_state.dart';

class PageSwitcherBloc extends Bloc<PageSwitcherEvent, PageSwitcherState> {
  PageSwitcherBloc() : super(PageSwitcherInitial());

  @override
  Stream<PageSwitcherState> mapEventToState(
    PageSwitcherEvent event,
  ) async* {
    if(event is PageSwitch){

      if(event.isLogin){ yield PageSignState();
      debugPrint("geldi bloc" +event.isLogin.toString());
      }
      else yield PageLoginState();
    }
    // TODO: implement mapEventToState
  }
}
