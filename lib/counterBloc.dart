import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum CounterEvent{increment,decrement}

class CounterBloc extends Bloc<CounterEvent,int>{
  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch(event){
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }

}