import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:searchfield/searchfield.dart';

import 'model_branch.dart';

class BranchesSearch extends StatefulWidget {
  const BranchesSearch({Key? key}) : super(key: key);

  @override
  _BranchesSearchState createState() => _BranchesSearchState();
}

class _BranchesSearchState extends State<BranchesSearch> {
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization

  @override
  String myItem = "Select an item";
  List<String> list = ["Flutter", "React", "Ionic", "Xamarin", "aa"];
  String? selectedList = "Flutter";
  List myNewList = [];

  late List<Branch> branches;
  late List<Branch> selectedBranches;
  late bool sort;

  String _selectedItem = "";
  List<String> branches2 = [
    "Kulak burun",
    "Cocuk",
    "Fizik Tedavi",
    "Kardiyoloji",
    "Onkoloji"
  ];

  void initState() {
    sort = false;
    selectedBranches = [];
    branches = Branch.getBranches();
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        branches.sort((a, b) => a.branchName.compareTo(b.branchName));
      } else {
        branches.sort((a, b) => b.branchName.compareTo(a.branchName));
      }
    }
  }

  onSelectedRow(bool selected, Branch branch) async {
    setState(() {
      if (selected) {
        selectedBranches.add(branch);
      } else {
        selectedBranches.remove(branch);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedBranches.isNotEmpty) {
        List<Branch> temp = [];
        temp.addAll(selectedBranches);
        for (Branch branch in temp) {
          branches.remove(branch);
          selectedBranches.remove(branch);
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                buildSearch(),
              ],
            ),
          ),
          buildTable(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('SELECTED ${selectedBranches.length}'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: () {
                  deleteSelected();
                },
                child: Text('DELETE SELECTED '),
              ),
            )
          ])
        ],
      ),
    );
  }

  Widget buildTable() => DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("Branch Name"),
              numeric: false,
              tooltip: "This is BranchName",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColumn(columnIndex, ascending);
              }),
          DataColumn(
              label: Text("Branch Name2"),
              numeric: false,
              tooltip: "This is BranchName2")
        ],
        rows: branches
            .map(
              (branch) => DataRow(
                selected: selectedBranches.contains(branch),
                onSelectChanged: (b) {
                  print("On select");
                  onSelectedRow(b!, branch);
                },
                cells: [
                  DataCell(
                    Text(branch.branchName),
                  ),
                  DataCell(
                    Text(branch.branchName),
                  )
                ],
              ),
            )
            .toList(),
      );

  Widget buildSearch() => Container(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Select a branch",
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: SearchField(
                      hint: 'Search',
                      searchInputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey.shade200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxSuggestionsInViewPort: 6,
                      itemHeight: 50,
                      suggestionsDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });

                        print(value);
                      },
                      suggestions: branches2),
                )
              ],
            ),
          ),
          Container(
            height: 90,
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _selectedItem == null
                    ? Text(
                        'Please select a Branch to Add',
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      )
                    : Text(_selectedItem!,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600)),
                MaterialButton(
                  onPressed: () {
                    //myNewList.add(_selectedItem);
                    branches.add(Branch(branchName: _selectedItem));
                    print(branches);
                  },
                  color: Colors.black,
                  minWidth: 50,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey,
                    size: 24,
                  ),
                )
              ],
            ),
          )
        ]),
      );
}
