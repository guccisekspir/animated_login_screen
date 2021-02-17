part of 'page_switcher_bloc.dart';

abstract class PageSwitcherState extends Equatable {
  const PageSwitcherState();
}

class PageSwitcherInitial extends PageSwitcherState {
  @override
  List<Object> get props => [];
}


class PageLoginState extends PageSwitcherState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class PageSignState extends PageSwitcherState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
