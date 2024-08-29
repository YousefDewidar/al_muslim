import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/model/reacters_model.dart';
import 'package:al_muslim/features/alquran/data/reacters_services.dart';
import 'package:al_muslim/features/athkar/views/all_swar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListenQuranViewBody extends StatefulWidget {
  const ListenQuranViewBody({super.key});

  @override
  State<ListenQuranViewBody> createState() => _ListenQuranViewBodyState();
}

class _ListenQuranViewBodyState extends State<ListenQuranViewBody> {
  late Future<List<ReactersModel>> future;
  @override
  void initState() {
    future = ReactersServices().fetchReacters();
    super.initState();
  }

  final searchController = TextEditingController();
  List<ReactersModel> searchedList = [];
  late List<ReactersModel> allList;
  Widget buildTextFeild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (searcherChar) {
          addSearcherChartoFiltertheList(searcherChar);
        },
        controller: searchController,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: 'ابحث عن الاذاعه التي ترغب ف الاستماع اليها',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
            header: 'القراء', desc: "الاستماع الي مكتبه كبيره من القراء "),
        buildTextFeild(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
                future: future,
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    allList = snapShot.data!;
                    return ListView.builder(
                      itemCount: searchedList.isEmpty
                          ? allList.length
                          : searchedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return   searchedList.isEmpty ?  CustomReaderRow(
                          reacters:
                               allList ,
                          index: index, url: allList[index].server,
                        ):CustomReaderRow(
                          reacters:
                             searchedList,
                          index: index, url: searchedList[index].server,
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        )
      ],
    );
  }

  //?search function
  void addSearcherChartoFiltertheList(String searcherChar) {
    searchedList = allList
        .where((radio) => radio.name.toLowerCase().contains(searcherChar))
        .toList();
    setState(() {});
  }
}

class CustomReaderRow extends StatelessWidget {
  final int index;
  final String url;
  const CustomReaderRow({
    super.key,
    required this.reacters,
    required this.index, required this.url,
  });

  final List<ReactersModel> reacters;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>  AllSwarView(swarUrl:url ,));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(reacters[index].name,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const Icon(
                Icons.volume_down,
                size: 30,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
