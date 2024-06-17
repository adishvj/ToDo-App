List<Map> data = [];
List<Map> comp = [];
void add({
  String? head,
  String? details,
}) {
  Map<String, dynamic> task = {'title': head, 'subtitle': details};
  print(task);
  data.add(task);
  print(data);
}

void replace(
    {required String head, required String details, required int index1}) {
  Map<String, dynamic> edit = {'title': head, 'subtitle': details};
  print(edit);
  data[index1] = edit;
  print(data);
}

void delete({required int indexxx}) {
  data.removeAt(indexxx);
}

void completed(
    {required String head, required String details, required int indexss}) {
  Map<String, dynamic> com = {'title': head, 'subtitle': details};
  comp.add(com);
  data.removeAt(indexss);
}
