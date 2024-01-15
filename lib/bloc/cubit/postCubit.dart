import 'package:api_integration_bloc/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/services.dart';

part '../states/postState.dart';

class TodoCubit extends Cubit<TodoState> {
  // final Services services;
  TodoCubit() : super(InitialState()) {
    getPost();
  }



  Future<List<PostModel>?> getPost() async {
    try {
      emit(LoadingState());
      final result = await Services().getPost();
      if (result != null) {
        print("the value recieved in cubit is ${result}");
        emit(LoadedState(list: result));
        return result;
      } else {
        print("the response is null");

        return null;
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
      throw (" error occurred in cubit class");
    }
  }
}
