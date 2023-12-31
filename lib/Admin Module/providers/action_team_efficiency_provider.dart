import 'dart:convert';

import 'package:db_ims/models/action_team_efficiency.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ActionTeamEfficiencyProviderClass extends ChangeNotifier {
  List<ActionTeamEfficiency>? actionTeamEfficiency;
  bool loading = false;
//  String? selectedDepartment;

  Future<List<ActionTeamEfficiency>?> getactionTeamEfficiencyData() async {
    loading = true;
    notifyListeners();

    try {
      actionTeamEfficiency = await fetchActionTeamEfficiency();
      loading = false;
      notifyListeners();

      return actionTeamEfficiency;
    } catch (e) {
      loading = false;
      notifyListeners();
      print('Error loading countByIncidentSubTypes: $e');
      // You might want to handle the error accordingly
      throw Exception('Failed to load countByIncidentSubTypes');
    }
  }

  Future<List<ActionTeamEfficiency>> fetchActionTeamEfficiency() async {
    loading = true;
    notifyListeners();
    print('Fetching countByIncidentSubTypes...');

    Uri url = Uri.parse('http://$IP_URL:3000/analytics/fetchEfficiency');
    final response = await http.get(url);

    Fluttertoast.showToast(
      msg: '${response.statusCode}',
      toastLength: Toast.LENGTH_SHORT,
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Ensure that jsonResponse[0] is a List<Map<String, dynamic>>
      if (jsonResponse.isNotEmpty) {
        List<Map<String, dynamic>> incidentsData = (jsonResponse)
            .cast<Map<String, dynamic>>(); // Explicitly cast each item in the list

        // Map the incident data to your CountByIncidentSubTypes model
        List<ActionTeamEfficiency> actionTeamEfficiencyList = incidentsData
            .map((item) => ActionTeamEfficiency.fromJson(item))
            .toList();

        loading = false;
        notifyListeners();
        print('ActionTeamEfficiency Loaded');
        return actionTeamEfficiencyList;
      } else {
        loading = false;
        notifyListeners();
        print('Invalid format in JSON response');
        throw Exception('Invalid format in JSON response');
      }
      
    }

    loading = false;
    notifyListeners();
    print('Failed to load ActionTeamEfficiency');
    throw Exception('Failed to load ActionTeamEfficiency');
  }
}
