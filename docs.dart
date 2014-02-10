import "package:restlib_atom/atom.dart";
import "package:restlib_atom/atom.link_relationships.dart";
import "package:restlib_common/async.dart";
import "package:restlib_common/collections.dart";
import "package:restlib_common/collections.forwarding.dart";
import "package:restlib_common/collections.immutable.dart";
import "package:restlib_common/collections.mutable.dart";
import "package:restlib_common/io.dart";
import "package:restlib_common/objects.dart";
import "package:restlib_common/preconditions.dart";
import "package:restlib_http_connector/connector.dart";
import "package:restlib_core/data.dart";
import "package:restlib_core/data.media_ranges.dart";
import "package:restlib_core/http.dart";
import "package:restlib_core/http_syntax.dart";
import "package:restlib_core/multipart.dart";
import "package:restlib_core/net.dart";
import "package:restlib_core/net.schemes.dart";
import "package:restlib_parsing/parsing.dart";
import "package:restlib_server/io.dart";
import "package:restlib_server/server.dart";
import "package:restlib_testing/testing.dart";
import "package:restlib_testing/collections.dart";

import "dart:async";
import "dart:io";

void main() {
  final Iterable<String> libs = 
      ["restlib.atom",
       "restlib.atom.link_relationships",
       "restlib.common.async",
       "restlib.common.collections",
       "restlib.common.collections.forwarding",
       "restlib.common.collections.immutable",
       "restlib.common.collections.mutable",
       "restlib.common.io",
       "restlib.common.objects",
       "restlib.common.preconditions",
       "restlib.connector.http",
       "restlib.core.data",
       "restlib.core.data.media_ranges",
       "restlib.core.http",
       "restlib.core.http_syntax",
       "restlib.core.multipart",
       "restlib.core.net",
       "restlib.core.net.schemes",
       "restlib.parsing",
       "restlib.server.io",
       "restlib.server",
       "restlib.testing",
       "restlib.testing.collections"];
  
  final List<String> arguments =
      ["--omit-generation-time", "--package-root", "./packages", "--include-lib", "${libs.join(",")}", "docs.dart"];
  final String path = Platform.executable.substring(0, Platform.executable.lastIndexOf("/")) + "/dartdoc";
  
  Process.run(path, arguments)
    .then((final ProcessResult r) => 
        print (r.stdout.toString()));
}