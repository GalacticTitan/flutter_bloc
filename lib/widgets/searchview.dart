import 'dart:async';

import 'package:bloctest/blocs/searchbloc.dart';
import 'package:bloctest/components/searchevent.dart';
import 'package:bloctest/components/searchstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchView extends StatefulWidget {


  final RefreshController _refreshController = RefreshController( );
  @override
  Widget build(BuildContext context) {

    return BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchFinished) {

          }
        },
        child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              /*return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  onRefresh: () async {
                    BlocProvider.of<SearchBloc>( context ).add(SearchEvent.loading);
                  },
                  child: setList(state));*/
              return Column(
                children: <Widget>[
                    TextFormField(
                      onChanged: (text){
                        BlocProvider.of<SearchBloc>( context ).add(SearchContent(text));
                      },
                    ),
                  setList(state)
                ],
              );
            }

        )

    );
  }

  Widget setList(SearchState state) {
    if(state is SearchInitial){
      return Text("No data found");
    }
    if (state is SearchLoading) {
      return Center( child: CircularProgressIndicator( ) );
    }
    if (state is SearchFinished) {
      _refreshController.dispose();
      return
        SizedBox(
          height: 299,
          child: ListView.builder(
            itemCount: getlength(state),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon( Icons.face),
                title: Row(
                  children: <Widget>[
                    Container(child: Image.network(state.search.search[index].poster),
                    height: 100,
                    width: 30,),
                  ],
                ),
                trailing: GestureDetector(child: Icon( Icons.keyboard_arrow_right ),
                  onTap:(){

                  },
                ),
                subtitle: Text( state.search.search[index].title ),
              );
            },
          ),
        );
    }
    if (state is SearchError) {
      _refreshController.refreshFailed();
      return Text(
        'Something went wrong!',
        style: TextStyle( color: Colors.red ),
      );
    }
    return Center( child: Text( 'Pull refresh to get employee..! ' ) );
  }

  int getlength(SearchFinished state){
    if(state != null && state.search != null && state.search.search != null){
      return  state.search.search.length;
    } else{
      return 0;
    }
  }

}