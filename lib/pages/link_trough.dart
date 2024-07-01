import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/picket_info.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';

class LinkTrough extends StatefulWidget {
  const LinkTrough({super.key, required this.back});

  final void Function() back;

  @override
  State<LinkTrough> createState() {
    return _LinkTroughState();
  }
}

class _LinkTroughState extends State<LinkTrough> {
  Key dropdownKey = UniqueKey();
  String? selectedTrough;
  late GenericService troughsService;
  late GenericService picketsService;
  List pickets = fazendaAcessada?.pickets ?? [];
  List troughs = fazendaAcessada?.cochos ?? [];

  @override
  void initState() {
    super.initState();
    troughsService = GenericService<TroughInfo>(
        fromJson: TroughInfo.fromJson,
        toJson: (troughInfo) => troughInfo.toJson());
    picketsService = GenericService<PicketInfo>(
        fromJson: PicketInfo.fromJson,
        toJson: (picketInfo) => picketInfo.toJson());
    loadPicketInfo();
    loadTroughInfo();
  }

  Future<void> loadTroughInfo() async {
    List loadedTroughs =
        await troughsService.loadList('${fazendaAcessada?.nome}_troughs.json');
    setState(() {
      troughs = loadedTroughs;
      dropdownKey = UniqueKey();
    });
  }

  Future<void> loadPicketInfo() async {
    List loadedPickets =
        await picketsService.loadList('${fazendaAcessada?.nome}_pickets.json');
    setState(() {
      pickets = loadedPickets;
    });
  }

  void vincularCocho() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: widget.back,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'VINCULAR COCHO',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          CustomDropdownWidget(
              key: dropdownKey,
              text: 'SELECIONAR COCHO',
              list: troughs
                  .map((trough) => (trough as TroughInfo).codigo)
                  .toList(),
              onChanged: (newValue) {
                selectedTrough = newValue;
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ButtonDesign(action: vincularCocho, text: 'VINCULAR')
        ],
      ),
    );
  }
}
