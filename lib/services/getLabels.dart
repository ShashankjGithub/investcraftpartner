

import '../modals/partnerFromModal.dart';

String getLabel({required String label, required DatumPartnerFrom form}){
  return form.element.firstWhere((element) => element.key == label).label;
}
String getPlaceHolder({required String label, required DatumPartnerFrom form}){
  return form.element.firstWhere((element) => element.key == label).placeholder;
}