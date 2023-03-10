import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharm_traka/screens/add_medicine/add_medicine.dart';
import 'package:provider/provider.dart';

import '../../data/models/medicine.dart';
import '../../providers/list_provider.dart';
import '../home/components/search.dart';

class AllMedicineList extends StatelessWidget {
  const AllMedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Medicine> list = context.watch<ListProvider>().getAllList;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height - 10,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Icon(Icons.notifications_active_outlined),
                  ],
                ),
                SizedBox(height: 20),
                SearchBar(),
                SizedBox(height: 20),
                Expanded(child: getMedicineList(list)),
                SizedBox(height: 10),
                confirmButtonStyle(context),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getMedicineList(List<Medicine> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => getMedicineInfo(
        '${list[index].time.format(context)}',
        '${list[index].image}',
        '${list[index].name}',
        list[index].doseNum,
      ),
    );
  }

  Widget getMedicineInfo(String time, String image, String title, int num) {
    return Card(
      elevation: 3,
      color: Colors.grey.shade200,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          backgroundImage: AssetImage(image),
        ),
        title: Text(title),
        subtitle: Text('$num pills'),
      ),
    );
  }

  Widget confirmButtonStyle(context) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicine(),
            )),
        color: Colors.green.shade400,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'Add Medicine',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void pressConfirmButton() {}
}
