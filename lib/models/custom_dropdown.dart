import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget(
      {super.key, required this.list, required this.onChanged});

  final List<String> list;
  final Function(String?) onChanged;

  @override
  State<StatefulWidget> createState() {
    return _CustomDropdownWidgetState();
  }
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  List<String> listaOriginal = [];
  String? valueChoose;

  @override
  void initState() {
    super.initState();
    listaOriginal = List.of(widget.list);
    valueChoose = null;
  }

  void _updateList(String? newValue) {
    setState(() {
      if (newValue != null) {
        valueChoose = newValue;
      } else {
        valueChoose = null;
      }
    });
  }

  List<String> _getTemporaryList() {
    if (valueChoose == null) {
      return List.of(listaOriginal);
    } else {
      List<String> tempList = List.of(listaOriginal);
      tempList.remove(valueChoose);
      tempList.insert(0, valueChoose!);
      return tempList;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> listaTemporaria = _getTemporaryList();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'TIPO',
          labelStyle: GoogleFonts.kanit(
              color: const Color(0xFF4C5C65),
              fontSize: MediaQuery.of(context).size.height * 0.018),
          floatingLabelStyle: const TextStyle(color: Color(0xFF2DBCB6)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4C5C65)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF2DBCB6),
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4C5C65))),
        ),
        dropdownColor: const Color(0xFF2DBCB6),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: MediaQuery.of(context).size.height * 0.038,
        isExpanded: false,
        value: valueChoose,
        onChanged: (newValue) {
          FocusScope.of(context).requestFocus(FocusNode());
          _updateList(newValue);
        },
        items: listaTemporaria.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                valueItem,
                style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: valueChoose == valueItem
                      ? const Color(0xFF4C5C65)
                      : Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
