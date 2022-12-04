class Branch {
  String branchName;

  Branch({required this.branchName});

  static List<Branch> getBranches() {
    return <Branch>[
      Branch(branchName: "A"),
      Branch(branchName: "C"),
    ];
  }
}
