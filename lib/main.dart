import 'package:counter_app/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: BlocProvider(
        builder: (BuildContext context)=>CounterBloc(),
        child: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }

}
class _CounterState extends State<CounterApp>{
  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final _bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,int>(
              builder: (BuildContext context,int state){
                return Text("Counter: $state",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            FloatingActionButton(
                onPressed: (){
                  _bloc.add(CounterEvent.increment);
                },
                child: Icon(Icons.add)),
            Padding(padding: EdgeInsets.all(10)),
            FloatingActionButton(
                onPressed: (){
                  _bloc.add(CounterEvent.decrement);
                },
                child: Icon(Icons.remove))
          ],
        ),
      ),
    );
  }

}