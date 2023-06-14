import 'package:mplussoft/model/mplussoft.dart';
import 'package:mplussoft/repository/mplussoft_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DetailsController extends ControllerMVC {
  @override
  void initState() {
    getData();
    super.initState();
  }

  bool isLoading = true;

  MplusSoft? data;

  getData() async {
    isLoading = true;
    data = await MplusRepository().detailsRepository();
    isLoading = false;
    setState(() {});
  }
}
