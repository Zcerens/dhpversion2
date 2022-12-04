import 'package:flutter/material.dart';

class DataTableBranches extends StatefulWidget {
  final List mylist;

  const DataTableBranches({required this.mylist});

  @override
  State<DataTableBranches> createState() => _DataTableBranchesState();
}

class _DataTableBranchesState extends State<DataTableBranches> {
  static const int numItems = 2;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final List<Map<String, String>> listOfColumns = [
    {
      "Name": "A",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(children: [
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Number'),
            ),
          ],
          rows: List<DataRow>.generate(
            numItems,
            (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                // All rows will have the same selected color.
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.08);
                }
                // Even rows will have a grey color.
                if (index.isEven) {
                  return Colors.grey.withOpacity(0.3);
                }
                return null; // Use default value for other states and odd rows.
              }),
              cells: <DataCell>[DataCell(Text('Row $index'))],
              selected: selected[index],
              onSelectChanged: (bool? value) {
                setState(() {
                  selected[index] = value!;
                  widget.mylist.remove(value);
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}
