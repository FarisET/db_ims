import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/ sub_location.dart';

class SubLocationProviderClass extends ChangeNotifier {
  List<SubLocation>? subLocationtPost;
  bool loading = false;
  String? selectedSubLocation;
//  List<IncidentSubType>? filteredIncidentSubTypes;

  Future<void> getSubLocationPostData(String selectedLocation) async {
    loading = true;
    // Pass the selected incident type to the fetchIncidentSubTypes method
    subLocationtPost = await fetchSubLocations(selectedLocation);
    loading = false;
    notifyListeners();
  }

  //  void updateFilteredIncidentSubtypes(String selectedIncidentType) {
  //   filteredIncidentSubTypes = subIncidentPost
  //       ?.where((subtype) => subtype.Incident_Type_ID == selectedIncidentType)
  //       .toList();
  //   selectedSubIncident = null; // Reset selectedSubIncident when filtering
  //   notifyListeners();
  // }

  void setSubLocationType(selectedVal){
    selectedSubLocation = selectedVal;
    notifyListeners();
  }
    //IPs
    //stormfiber: 192.168.18.74
    //mobile data: 192.168.71.223

    Future<List<SubLocation>> fetchSubLocations(String selectedLocation) async {
    loading = true;
    notifyListeners();
     Uri url = Uri.parse('http://$IP_URL:3000/userReport/dashboard/fetchsublocations?location_id=$selectedLocation');
     final response = await http.get(
      url,
      // body: {'incident_type_id': selectedIncidentType},
      );
          //   Fluttertoast.showToast(
          //   msg: '${response.statusCode}',
          //   toastLength: Toast.LENGTH_SHORT,
          // );

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body) as List<dynamic>;
    List<SubLocation> subIncidentList = jsonResponse
        .map((dynamic item) => SubLocation.fromJson(item as Map<String, dynamic>))
        .toList();
      loading = false;
      notifyListeners();
    return subIncidentList;
  } 
  loading = false;
  notifyListeners();
    throw Exception('Failed to load location Sub Types');
    }



  
}