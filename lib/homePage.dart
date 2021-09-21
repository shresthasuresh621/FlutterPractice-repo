import 'package:blocemployee/Employee.dart';
import 'package:blocemployee/EmployeeBlock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final EmployeeBloc _employeeBloc =
      EmployeeBloc(); // creating an object for employeeBloc class
  @override
  void dispose() {
    // _employeeBloc.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee App"),
      
      ),
      body: Container(
        // we need to warp with streamBuilder if there is the access of the streamController
          child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream ,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text("${snapshot.data![index].id}",
                        style: TextStyle(fontSize: 18.0),),
                      ), Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${snapshot.data![index].name}",
                              style: TextStyle(fontSize: 20.0),),
                            Text("रु  ${snapshot.data![index].salary }",
                              style: TextStyle(fontSize: 16.0),),

                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                           //objectName.nameofthestreamSink.event
                          onPressed: () { _employeeBloc.employeeIncrementSalary.add(snapshot.data![index]); },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: () { _employeeBloc.employeeDecrementSalary.add(snapshot.data![index]); },
                        ),
                      )
                    ],
                  ),
                );
              }
            );
          }
        )
    ));
  }
}
