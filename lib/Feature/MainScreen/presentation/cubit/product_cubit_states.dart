abstract class ProductCubitStates {}
class InitalState extends ProductCubitStates{}
class SuccessState extends ProductCubitStates {}
class LoadingState extends ProductCubitStates {}
class ErrorState extends ProductCubitStates {
  String message;
  ErrorState({required this.message});
}