
import 'package:mplussoft/repository/mplussoft_repository.dart';

bool success=false;
detailsController() async {
  success = true;
  var result = await MplusRepository().detailsRepository();

  if (result==null) {
    return ;
  }
}