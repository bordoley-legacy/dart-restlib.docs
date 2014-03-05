import "dart:io";
import "package:path/path.dart";

void main() {
  final Iterable<String> excludedLibs =
      ["dart.pkg.collection.algorithms",
       "dart.pkg.collection",
       "dart.pkg.collection.equality",
       "dart.pkg.collection.iterable_zip",
       "dart.pkg.collection.priority_queue",
       "dart.pkg.collection.wrappers",
       "crypto",
       "logging",
       "mime",
       "path",
       "stack_trace",
       "unittest",
       "unittest.compact_vm_config",
       "unittest.html_config",
       "unittest.html_enhanced_config",
       "unittest.html_individual_config",
       "unittest.matcher",
       "unittest.mirror_matchers",
       "unittest.mock",
       "unittest.vm_config",
       "collections.internal",
       "data.internal",
       "http.internal"];

  final List<String> arguments =
      ["-v",
       "--package-root", "./packages",
       "--start-page", "restlib",
       "--no-include-sdk",
       "--include-dependent-packages",
       "--compile"]
      ..addAll(excludedLibs.expand((final String lib) =>
          ["--exclude-lib", lib]))
      ..add("./");

  final String executable = "docgen";

  print( arguments.join(" "));

  Process.run(executable, arguments, runInShell: true)
    .then((final ProcessResult r) {
      print(r.stdout.toString());
      print (r.stderr.toString());

      final String src = join(Directory.current.path, "dartdoc-viewer/client/out/");
      final String dst = join(Directory.current.path, "docs");
      new Directory(src).renameSync(dst);

      final String docViewDir = join(Directory.current.path, "dartdoc-viewer");
      new Directory(docViewDir).deleteSync(recursive: true);
    });
}