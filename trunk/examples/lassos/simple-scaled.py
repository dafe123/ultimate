#!/usr/bin/python
# A scaled version of Bangalore.bpl with n different ranking functions:
#
# Y = 1; # X, Y are a vectors
# while (X >= 0) {
#   X = X .- Y;
# }
#
# author: Jan Leike
# date: 2013-01-15

import sys
import os.path

size = 10;
if len(sys.argv) > 1:
	size = int(sys.argv[1])

varsx = ["x%d" % i for i in range(size)]
varsy = ["y%d" % i for i in range(size)]

with open(os.path.splitext(__file__)[0] + str(size) + ".bpl", 'w') as f:
	f.write("// Auto-generated by %s\n" % os.path.basename(__file__))
	f.write("// A scaled version of Bangalore.bpl with n different ranking functions\n");
	f.write("// size = %d\n\n" % size)
	f.write("procedure main() returns ("
			+ ": int, ".join(varsx) + ": int)\n{\n")
	f.write("  var " + ", ".join(varsy) + ": int;\n")
	f.write("\n".join(["  %s := 1;" % v for v in varsy]) + "\n")
	f.write("  while (" + " >= 0 && ".join(varsx) + " >= 0) {\n")
	f.write("\n".join(["    x%d := x%d - y%d;" % (i,i,i) for i in range(size)]) + "\n");
	f.write("  }\n}\n");
