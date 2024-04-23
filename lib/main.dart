import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/app/app.dart';

void main() {
  runApp(MyApp());
}


// App Layer --> Presentation Layer (UI --> ViewModel) --> Domain Layer --> Data Layer 

// AppNetworkServiceClient(api helper) --> RemoteDataSource --then-- (Network Info(net connection), Mapper & remoteDataSource) --> Repository Implementer --> Respository --> Use-Cases --> ViewModel --> UI 