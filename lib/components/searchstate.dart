
import 'package:bloctest/models/search_podo.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable{
  @override
  List<Object> get props => null;

}

class SearchLoading extends SearchState{}
class SearchInitial extends SearchState{}
class SearchFinished extends SearchState{
  final SearchPodo search;

  SearchFinished(this.search);

}

class SearchError extends SearchState{
  SearchError(e){
    print(e);
  }
}