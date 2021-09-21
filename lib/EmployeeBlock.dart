//TODO: imports
//TODO:List of employee
//TODO:Stream Controllers
//TODO:Stream Sink getter
//TODO:Constructor - add data; listen to changes;
//TODO:Core functions
//TODO:Dispose


import 'dart:async';
import 'dart:ffi';
import 'package:blocemployee/Employee.dart';
// Sink to add in pipe
// Stream to get data form pipe
// By pipe which means data flow
class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, "Suresh Shrestha", 100210.0), //Employee is the object here
    Employee(2, "Priya Prajapati", 5000.0),
    Employee(3, "Asmina Shrestha", 20102.0),
    Employee(4, "Suraj Shrestha", 2031.0),
    Employee(5, "Samina Shrestha", 7844.0)
  ];

  //Opening up the StreamController
  final _employeeListStreamController = StreamController<
      List<Employee>>(); //object of the StreamController of the class
  //intance variable for the streamController Class

  //For increment  and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

//Getters for BLOC

//Datatype<list><data>>
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController
          .stream; //THis is for getting data form the StreamController

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController
          .sink; //this for sending data into the pipe i.e stramcontroller

  StreamSink<Employee> get employeeIncrementSalary =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeDecrementSalary =>
      _employeeSalaryDecrementStreamController.sink;

//Constructor creation

  EmployeeBloc() {
    _employeeListStreamController.add(
        _employeeList); //adding the data to the streamController at once

// this listen is reponsible for updateing the data whenever the data is changes in the increment/decrement salary method and showUP the changes
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }


  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary - decrementSalary;
    employeeListSink.add(_employeeList);
  }

// Dispose method will freeup the reserved resource used by the steramController
  void dispose() {
    //dispose is also a default method whenever we use streamController
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeListStreamController.close();
  }
}