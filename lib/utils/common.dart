import 'package:intl/intl.dart';

class Common{
  
  static String getImage({required String imageName}) {
    return "https://ayikie.cyberelysium.app/uploads/" + imageName;
  }

  static String getThumbnail({required String imageName}) {
    return "https://ayikie.cyberelysium.app/uploads/thumb/" + imageName;
  }

  static String dateFormator({required String ios8601}) {
    DateTime parseDate =
    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(ios8601);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String getStatus({required int status}) {
    String statusString;
    switch (status) {
      case 1:
        statusString = "Accepted";
        break;
      case 2:
        statusString = "Delivered";
        break;
      case 3:
        statusString = "Completed";
        break;
      case 4:
        statusString = "Cancelled";
        break;
      default:
        statusString = "Pending";
        break;
    }
    return statusString;
  }
}