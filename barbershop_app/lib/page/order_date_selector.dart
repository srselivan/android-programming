import 'package:barbershop_app/page/user_home.dart';
import 'package:barbershop_app/widget/fab_next.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:logger/logger.dart';
import 'package:cool_alert/cool_alert.dart';

import '../model/order.dart';
import '../widget/create_route.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class OrderDateSelector extends StatefulWidget {
  Order order;

  OrderDateSelector({required this.order});

  @override
  OrderDateSelectorState createState() => OrderDateSelectorState();
}

class OrderDateSelectorState extends State<OrderDateSelector> {
  int? _value = 1;
  int _selectedDate = 0;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final dates = [
      DateTime(now.year, now.month, now.day),
      DateTime(now.year, now.month, now.day + 1),
      DateTime(now.year, now.month, now.day + 2),
      DateTime(now.year, now.month, now.day + 3),
      DateTime(now.year, now.month + 1, now.day - 5),
      DateTime(now.year, now.month + 1, now.day - 6),
    ];
    List<List<TimeOfDay>> times = [];
    for (int i = 0; i < 6; i++) {
      times.add([]);
    }
    for(int i = 9; i < 21; i++) {
      times[0].add(TimeOfDay(hour: i, minute: 0));
    }
    for(int i = 13; i < 15; i++) {
      times[1].add(TimeOfDay(hour: i, minute: 0));
    }
    for(int i = 10; i < 16; i++) {
      times[2].add(TimeOfDay(hour: i, minute: 0));
    }
    for(int i = 9; i < 18; i++) {
      times[3].add(TimeOfDay(hour: i, minute: 0));
    }
    for(int i = 17; i < 20; i++) {
      times[4].add(TimeOfDay(hour: i, minute: 0));
    }
    for(int i = 9; i < 14; i++) {
      times[5].add(TimeOfDay(hour: i, minute: 0));
    }

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButtonNext(
          onPressed: () {
            logger.i('''
            Selected order:
            OrderType: name: ${widget.order.type.name}, cost: ${widget.order.type.cost}, dur: ${widget.order.type.duration}, isMale: ${widget.order.type.isMale}
            Date: ${widget.order.date}
            Time: ${widget.order.time.format(context)}''');
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        const Center(
                          child: Text(
                            "Запись",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Тип"),
                          subtitle: Text("${widget.order.type.name}\nЦена: ${widget.order.type.cost}руб.\nПродолжительность: ${widget.order.type.duration.inHours}ч.${widget.order.type.duration.inMinutes%60}мин."),
                        ),
                        ListTile(
                          title: const Text("Дата"),
                          subtitle: Text("${widget.order.date.toLocal()}".split(' ')[0])
                        ),
                        ListTile(
                          title: const Text("Время"),
                          subtitle: Text(widget.order.time.format(context)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //Navigator.of(context).popUntil(ModalRoute.withName("/home"));
                            //Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                            Navigator.of(context).pushAndRemoveUntil(PageTransition(child: UserHome(number: widget.order.number), type: PageTransitionType.fade), (route) => false);
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              animType: CoolAlertAnimType.scale,
                              title: "Успешно!",
                              text: "Запись успешно создана",
                              barrierDismissible: false,
                              onConfirmBtnTap: () {

                              },
                            );
                          },
                          child: const Text("Подтвердить запись"),
                        )
                      ],
                    )
                  )
                );
              },
            );
          }
        ),
        body: Column(
          children: [
            const Text("Выберите дату"),
            SfDateRangePicker(
              onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                setState(() {
                  var date = dateRangePickerSelectionChangedArgs.value;
                  _selectedDate = dates.indexOf(date);
                  widget.order.date = date;
                });
              },
              monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectableDayPredicate: (date) {
                return dates.contains(date);
              },
              view: DateRangePickerView.month,
              enablePastDates: false,
              minDate: now,
              maxDate: DateTime(now.year, now.month + 2),
            ),
            const Text("Выберите время"),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                times[_selectedDate].length,
                (int i) {
                  return ChoiceChip(
                    label: Text(times[_selectedDate][i].format(context)),
                    selected: _value == i,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? i : null;
                        if (_value == i) {
                          widget. order.time = times[_selectedDate][i];
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),

    );
  }
}