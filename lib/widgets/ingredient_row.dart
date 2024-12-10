import 'package:flutter/material.dart';

import '../model/ingridient_byid.dart';
import '../model/measures_model.dart';

class IngredietRow extends StatefulWidget {
  final int? id;
  final String? wedghts;

  const IngredietRow({
    super.key,
    required this.id,
    required this.wedghts
  });

  @override
  State<IngredietRow> createState() => _IngredietRowState();
}

class _IngredietRowState extends State<IngredietRow> {

  late Future<OneIngredientModel> ingridient;
  late Future<MeasureModel> measures;


  String ingTitle = '...';
  String measTitle = '';
  int measureId = 0;

  @override
  void initState() {
    measures = getMeasureData();
    ingridient = getOneIngridient(widget.id??0);
    ingridient.then((ing){
      measureId = ing.measureUnit?.id??0;
      ingTitle = ing.name.toString();
      if(measureId>0){      
        measures.then((meas){
          for (var i = 0; i < meas.measures!.length; i++) {
            if(meas.measures?[i].id == measureId){
              measTitle = (int.parse(widget.wedghts!) > 3)?meas.measures![i].few.toString():meas.measures![i].one.toString();
            }
          }
        });
      }
      setState(() {});
    });

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Text(ingTitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        Text('${widget.wedghts} $measTitle', style: const TextStyle(fontSize: 13, color: Color.fromRGBO(121, 118, 118, 1))),
      ],
    );
  }
}