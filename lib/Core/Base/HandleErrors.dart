import 'package:covid_stats/Core/Base/Exceptions.dart';
import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';

class HandleErrors {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      DialogManager.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogManager.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      var desc = error.message;
      DialogManager.showErroDialog(
          description: desc,
          title: 'Request Error',
          message: 'Check your internet and try again');
    }
  }
}
