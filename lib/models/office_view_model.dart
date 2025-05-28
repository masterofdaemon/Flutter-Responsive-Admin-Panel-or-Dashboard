import 'package:admin/generated/crm.pb.dart' as crm;
// For date formatting if needed

class OfficeViewModel {
  final crm.Office _office;

  OfficeViewModel(this._office);

  String get id => _office.officeId.toString();
  String get city => _office.city;
  String get address => _office.hasAddress() ? _office.address : 'N/A';
  String get phone => _office.hasPhone() ? _office.phone : 'N/A';
  String get notes => _office.hasNotes() ? _office.notes : 'N/A';

  String get cityAndAddress {
    String display = city;
    if (_office.hasAddress() && _office.address.isNotEmpty) {
      display += ", ${_office.address}";
    }
    return display;
  }

  String get phoneAndNotes {
    String display = "";
    if (_office.hasPhone() && _office.phone.isNotEmpty) {
      display += "Phone: ${_office.phone}";
    }
    if (_office.hasNotes() && _office.notes.isNotEmpty) {
      if (display.isNotEmpty) display += " | ";
      display += "Notes: ${_office.notes}";
    }
    return display.isEmpty ? 'No additional details' : display;
  }

  // Add other formatted fields or combined fields as needed
}
