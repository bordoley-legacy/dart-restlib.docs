import "package:restlib_common/collections.dart";
import "package:restlib_common/objects.dart";
import "package:restlib_common/preconditions.dart";
import "package:restlib_http_connector/connector.dart";
import "package:restlib_core/data.dart";
import "package:restlib_core/http.dart";
import "package:restlib_core/http_syntax.dart";
import "package:restlib_core/multipart.dart";
import "package:restlib_parsing/parsing.dart";
import "package:restlib_server/io.dart";
import "package:restlib_server/server.dart";
import "package:restlib_testing/testing.dart";

import "dart:io";

void main() {
  final Iterable<String> libs = 
      ["restlib.common.collections",
       "restlib.common.objects",
       "restlib.common.preconditions",
       "restlib.connector.http",
       "restlib.core.data",
       "restlib.core.http",
       "restlib.core.http_syntax",
       "restlib.core.multipart",
       "restlib.parsing",
       "restlib.server.io",
       "restlib.server",
       "restlib.testing"];
  
  final List<String> arguments =
      ["--package-root", "./packages", "--include-lib", "${libs.join(",")}", "docs.dart"];
  final String path = Platform.executable.substring(0, Platform.executable.lastIndexOf("/")) + "/dartdoc";
  
  
  
  Process.run(path, arguments)
    .then((final ProcessResult r) => 
        print (r.stdout.toString()));
}