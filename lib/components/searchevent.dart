import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SearchContent extends SearchEvent{
  final String query;

  SearchContent(this.query);
}

class SearchFinishedEvent extends SearchEvent{

}