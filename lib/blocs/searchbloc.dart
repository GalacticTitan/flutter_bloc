
import 'package:bloc/bloc.dart';
import 'package:bloctest/components/searchevent.dart';
import 'package:bloctest/components/searchstate.dart';
import 'package:bloctest/models/search_podo.dart';
import 'package:bloctest/repository/searchrepository.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  final SearchRepository searchRepository;

  SearchBloc(this.searchRepository);

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    if(event is SearchContent){
      try {
        final SearchPodo searchPodo = await searchRepository.getSearchData(event.query);
        yield SearchFinished(searchPodo);
      } catch (e) {
        yield SearchError(e);
      }
    }
  }

}