import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/farm_box_design.dart';

class TroughPage extends StatefulWidget {
  const TroughPage({super.key});
  @override
  State<TroughPage> createState() {
    return _TroughPageState();
  }
}

class _TroughPageState extends State<TroughPage> {
  late GenericService troughService;
  List troughs = [];

  @override
  void initState() {
    super.initState();
    troughService = GenericService<TroughInfo>(
        fromJson: TroughInfo.fromJson,
        toJson: (troughInfo) => troughInfo.toJson());
    loadTroughInfo();
  }

  Future<void> loadTroughInfo() async {
    List loadedTroughs =
        await troughService.loadList('${picketAcessado?.nome}_troughs');
    setState(() {
      troughs = loadedTroughs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            )),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Text(
        'COCHOS',
        style: GoogleFonts.kanit(
            color: const Color(0xFF2DBCB6),
            fontSize: MediaQuery.of(context).size.width * 0.083),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final cocho in troughs)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FarmBoxDesign(
                      action: () {},
                      icon: 'assets/images/cow_eating_picket.png',
                      text: cocho.codigo,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
