import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/features/alquran/views/widgets/custom_tabel_text.dart';
import 'package:flutter/material.dart';

class FehresViewBody extends StatelessWidget {

  const FehresViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Table(children: [
              headerRow(),
            ]),
            Expanded(
              child: FutureBuilder<List<SwarModel>>(
                  future: FehresService().getFromDataBase(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      List<SwarModel> swar = snapShot.data!;
                      return ListView.builder(
                        itemCount:swar.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTabelText(
                                text:swar[index].type == 0 ? 'مدنيه' : 'مكيه',
                              ),
                              CustomTabelText(
                                text:'${swar[index].startPage}',
                              ),
                              CustomTabelText(
                                text:'${swar[index].numOfayat}',
                              ),
                              CustomTabelText(
                                text: swar[index].name,
                              ),
                              CustomTabelText(
                                text:'${swar[index].id}',
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Text(snapShot.data.toString());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  TableRow headerRow() {
    return TableRow(
        decoration: BoxDecoration(border: Border.all()),
        children: const [
          CustomTabelText(text: 'البيان'),
          CustomTabelText(text: 'الصفحه'),
          CustomTabelText(text: 'عدد اياتها'),
          CustomTabelText(text: 'اسم السوره'),
          CustomTabelText(text: 'رقمها'),
        ]);
  }
}
