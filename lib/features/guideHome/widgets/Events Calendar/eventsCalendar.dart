import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/Events%20Calendar/singleEventItem.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/eventsCalendar.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EventsCalendarViewModel>(
      distinct: true,
      converter: EventsCalendarViewModel.fromStore,
      builder: (_, viewmodel) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverToBoxAdapter(
            child: Card(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) => SingleEventItem(),
                      itemCount: 2),
                )),
          ),
        );
      },
    );
  }
}
