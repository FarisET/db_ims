// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:db_ims/models/action_team_efficiency.dart';
import 'package:db_ims/models/count_incidents_by_location.dart';
import 'package:db_ims/models/count_incidents_by_subtype.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String totalIncidentsReported;
  final String totalIncidentsResolved;
  final List<CountByIncidentSubTypes>? incidentSubtypeBreakdown;
  final List<CountByLocation>? incidentLocationBreakdown;
  final List<ActionTeamEfficiency>? actionTeamEfficiencyBreakdown;
  AppDrawer({
    required this.totalIncidentsReported,
    required this.totalIncidentsResolved,
    required this.incidentSubtypeBreakdown,
    required this.incidentLocationBreakdown,
    required this.actionTeamEfficiencyBreakdown,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Reporting Analytics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                leading: Icon(
                  Icons.personal_injury,
                  color: Colors.blue,
                  size: 31,
                ),
                title: Text('Total Incidents Reported'),
                trailing: CircleAvatar(
                    maxRadius: 16, child: Text(totalIncidentsReported)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                leading: Icon(
                  Icons.check_box,
                  color: Colors.blue,
                  size: 31,
                ),
                title: Text('Total Incidents Resolved'),
                trailing: CircleAvatar(
                    maxRadius: 16, child: Text(totalIncidentsResolved)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 3,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.category,
                            color: Colors.blue,
                            size: 31,
                          ),
                          Text(
                            'Types of Incidents Breakdown',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text('')
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: incidentSubtypeBreakdown!.length,
                          itemBuilder: (context, index) {
                            var item = incidentSubtypeBreakdown?[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              title: Text(
                                '${item?.incident_subtype_description}',
                                style: TextStyle(),
                              ),
                              trailing: CircleAvatar(
                                maxRadius: 12,
                                child: Text(
                                  '${item?.incident_count}',
                                  style: TextStyle(),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 3,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.category,
                            color: Colors.blue,
                            size: 31,
                          ),
                          Text(
                            'Incidents breakdown by location',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text('')
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: incidentLocationBreakdown!.length,
                          itemBuilder: (context, index) {
                            var item = incidentLocationBreakdown?[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              title: Text(
                                '${item?.location_name}',
                                style: TextStyle(),
                              ),
                              trailing: CircleAvatar(
                                maxRadius: 12,
                                child: Text(
                                  '${item?.incident_count}',
                                  style: TextStyle(),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 3,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.category,
                            color: Colors.blue,
                            size: 31,
                          ),
                          Text(
                            'Action team Efficiences',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text('')
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: actionTeamEfficiencyBreakdown!.length,
                          itemBuilder: (context, index) {
                            var item = actionTeamEfficiencyBreakdown?[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              title: Text(
                                '${item?.action_team_name}',
                                style: TextStyle(),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${item?.efficiency_value}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
