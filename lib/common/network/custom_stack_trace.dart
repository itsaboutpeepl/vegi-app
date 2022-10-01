class CustomTrace {
  final StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    /* The trace comes with multiple lines of strings, we just want the first line, which has the information we need */
    try {
      var fileInfos = _trace.toString().split("\n").take(10).map((traceString) {
        /* Search through the string and find the index of the file name by looking for the '.dart' regex */
        var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z]+.dart'));
        var endIndexOfFileName = traceString.indexOf(RegExp(r' \s\s\s+'));
        // var endIndexOfFileName = traceString.indexOf(RegExp(r' [0-9]+:[0-9]+'));
        var fileInfo =
            traceString.substring(indexOfFileName, endIndexOfFileName);
        // var fnNameIndex = traceString
        //     .substring(endIndexOfFileName)
        //     .indexOf(RegExp(r'\s+([A-Za-z_].*)'));
        return fileInfo;
      }).toList();

      var fileInfo = fileInfos[0];
      var filePathInfo = fileInfo.substring(0, fileInfo.indexOf(r'dart') + 4);
      var listOfLineInfos =
          fileInfo.substring(fileInfo.indexOf(r'dart') + 5).split(":");

      /* Splitting fileInfo by the character ":" separates the file name, the line number and the column counter nicely.
        Example: main.dart:5:12
        To get the file name, we split with ":" and get the first index
        To get the line number, we would have to get the second index
        To get the column number, we would have to get the third index
      */

      fileName = filePathInfo;
      lineNumber = int.parse(listOfLineInfos[0]);
      var columnStr = listOfLineInfos[1];
      columnStr = columnStr.replaceFirst(")", "");
      columnNumber = int.parse(columnStr);
    } catch (err) {
      columnNumber = -1;
      lineNumber = -1;
      var x = _trace.toString().split("\n")[0];
      // fileName =
      //     x.substring(x.indexOf(r'[A-Za-z]+.dart'), x.indexOf(r'dart') + 4);
      fileName = x;
    }
  }
}
