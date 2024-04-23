import 'package:fpdart/fpdart.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
