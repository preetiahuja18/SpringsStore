import 'package:flutter/material.dart';
import 'bloc.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Create a new instance of the BLoC
  final MyBloc _bloc = MyBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: _bloc.myStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             return Text(snapshot.data ?? 'No data');
            } else {
              return Text('No data');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.processEvent('Button clicked');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    
    _bloc.dispose();
    super.dispose();
  }
}
