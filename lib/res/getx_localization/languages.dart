import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hints': 'Enter email',
          'internet_exception' : 'we`re  unable to show results\nplease check your connection',
          'general_exception' :'we`re  unable to precess your request\n please try again'
        },
    'ur_PK': {
          'email_hints': 'ای میل درج کریں۔'
        },
      };

}