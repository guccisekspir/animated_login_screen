part of 'page_switcher_bloc.dart';

abstract class PageSwitcherEvent extends Equatable {
  const PageSwitcherEvent();
}


class PageSwitch extends PageSwitcherEvent{
  final bool isLogin;

  PageSwitch(this.isLogin);
  @override
  // TODO: implement props
  List<Object> get props => [isLogin];
}
