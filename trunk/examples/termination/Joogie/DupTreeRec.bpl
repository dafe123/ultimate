type ref;
type realVar;
type classConst;
// type Field x;
// var $HeapVar : <x>[ref, Field x]x;

const unique $null : ref ;
const unique $intArrNull : [int]int ;
const unique $realArrNull : [int]realVar ;
const unique $refArrNull : [int]ref ;

const unique $arrSizeIdx : int;
var $intArrSize : [int]int;
var $realArrSize : [realVar]int;
var $refArrSize : [ref]int;

var $stringSize : [ref]int;

//built-in axioms 
axiom ($arrSizeIdx == -1);

//note: new version doesn't put helpers in the perlude anymore//Prelude finished 



var int$DupTreeRec.Random$index0 : int;
var DupTreeRec.TreeList$DupTreeRec.Tree$children254 : Field ref;
var java.lang.String$lp$$rp$$DupTreeRec.Random$args257 : [int]ref;
var DupTreeRec.TreeList$DupTreeRec.TreeList$next256 : Field ref;
var DupTreeRec.Tree$DupTreeRec.TreeList$value255 : Field ref;


// procedure is generated by joogie.
function {:inline true} $neref(x : ref, y : ref) returns (__ret : int) {
if (x != y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $realarrtoref($param00 : [int]realVar) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $modreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $leref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 1
// <DupTreeRec.Random: void <init>()>
procedure void$DupTreeRec.Random$$la$init$ra$$2237(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r036 : ref;
Block43:
	r036 := __this;
	 assert ($neref((r036), ($null))==1);
	 //  @line: 2
	 call void$java.lang.Object$$la$init$ra$$28((r036));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $modint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $gtref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $eqrealarray($param00 : [int]realVar, $param11 : [int]realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $addint(x : int, y : int) returns (__ret : int) {
(x + y)
}


// procedure is generated by joogie.
function {:inline true} $subref($param00 : ref, $param11 : ref) returns (__ret : ref);



	 //  @line: 15
// <DupTreeRec.DupTreeRec: void dupList(DupTreeRec.TreeList)>
procedure void$DupTreeRec.DupTreeRec$dupList$2231($param_0 : ref)
  modifies $HeapVar;
 {
var $r513 : ref;
var $r614 : ref;
var $r210 : ref;
var $r311 : ref;
var r08 : ref;
var $r412 : ref;
var $r19 : ref;
Block19:
	r08 := $param_0;
	 goto Block20;
	 //  @line: 16
Block20:
	 goto Block21, Block23;
	 //  @line: 16
Block21:
	 assume ($neref((r08), ($null))==1);
	 goto Block22;
	 //  @line: 16
Block23:
	 //  @line: 16
	 assume ($negInt(($neref((r08), ($null))))==1);
	 return;
	 //  @line: 17
Block22:
	 assert ($neref((r08), ($null))==1);
	 //  @line: 17
	$r19 := $HeapVar[r08, DupTreeRec.Tree$DupTreeRec.TreeList$value255];
	 goto Block24;
	 //  @line: 17
Block24:
	 //  @line: 17
	 call void$DupTreeRec.DupTreeRec$dupTree$2230(($r19));
	 //  @line: 18
	$r210 := $newvariable((25));
	 assume ($neref(($newvariable((25))), ($null))==1);
	 assert ($neref((r08), ($null))==1);
	 //  @line: 18
	$r412 := $HeapVar[r08, DupTreeRec.Tree$DupTreeRec.TreeList$value255];
	 assert ($neref((r08), ($null))==1);
	 //  @line: 18
	$r311 := $HeapVar[r08, DupTreeRec.TreeList$DupTreeRec.TreeList$next256];
	 assert ($neref(($r210), ($null))==1);
	 //  @line: 18
	 call void$DupTreeRec.TreeList$$la$init$ra$$2236(($r210), ($r412), ($r311));
	 assert ($neref((r08), ($null))==1);
	 //  @line: 18
	$HeapVar[r08, DupTreeRec.TreeList$DupTreeRec.TreeList$next256] := $r210;
	 assert ($neref((r08), ($null))==1);
	 //  @line: 19
	$r513 := $HeapVar[r08, DupTreeRec.TreeList$DupTreeRec.TreeList$next256];
	 assert ($neref(($r513), ($null))==1);
	 //  @line: 19
	$r614 := $HeapVar[$r513, DupTreeRec.TreeList$DupTreeRec.TreeList$next256];
	 //  @line: 19
	 call void$DupTreeRec.DupTreeRec$dupList$2231(($r614));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $inttoreal($param00 : int) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $shrint($param00 : int, $param11 : int) returns (__ret : int);



	 //  @line: 9
// <DupTreeRec.Tree: void addChild(DupTreeRec.Tree)>
procedure void$DupTreeRec.Tree$addChild$2233(__this : ref, $param_0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r118 : ref;
var $r319 : ref;
var r016 : ref;
var $r217 : ref;
Block27:
	r016 := __this;
	r118 := $param_0;
	 //  @line: 10
	$r217 := $newvariable((28));
	 assume ($neref(($newvariable((28))), ($null))==1);
	 assert ($neref((r016), ($null))==1);
	 //  @line: 10
	$r319 := $HeapVar[r016, DupTreeRec.TreeList$DupTreeRec.Tree$children254];
	 assert ($neref(($r217), ($null))==1);
	 //  @line: 10
	 call void$DupTreeRec.TreeList$$la$init$ra$$2236(($r217), (r118), ($r319));
	 assert ($neref((r016), ($null))==1);
	 //  @line: 10
	$HeapVar[r016, DupTreeRec.TreeList$DupTreeRec.Tree$children254] := $r217;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $negReal($param00 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ushrint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $refarrtoref($param00 : [int]ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $divref($param00 : ref, $param11 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $mulref($param00 : ref, $param11 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $neint(x : int, y : int) returns (__ret : int) {
if (x != y) then 1 else 0
}


// <java.lang.String: int length()>
procedure int$java.lang.String$length$59(__this : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ltreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $reftorefarr($param00 : ref) returns (__ret : [int]ref);



// procedure is generated by joogie.
function {:inline true} $gtint(x : int, y : int) returns (__ret : int) {
if (x > y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $reftoint($param00 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $addref($param00 : ref, $param11 : ref) returns (__ret : ref);



	 //  @line: 5
// <DupTreeRec.TreeList: void <init>(DupTreeRec.Tree,DupTreeRec.TreeList)>
procedure void$DupTreeRec.TreeList$$la$init$ra$$2236(__this : ref, $param_0 : ref, $param_1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r134 : ref;
var r235 : ref;
var r033 : ref;
Block42:
	r033 := __this;
	r134 := $param_0;
	r235 := $param_1;
	 assert ($neref((r033), ($null))==1);
	 //  @line: 6
	 call void$java.lang.Object$$la$init$ra$$28((r033));
	 assert ($neref((r033), ($null))==1);
	 //  @line: 7
	$HeapVar[r033, DupTreeRec.Tree$DupTreeRec.TreeList$value255] := r134;
	 assert ($neref((r033), ($null))==1);
	 //  @line: 8
	$HeapVar[r033, DupTreeRec.TreeList$DupTreeRec.TreeList$next256] := r235;
	 return;
}


	 //  @line: 18
// <DupTreeRec.Tree: DupTreeRec.Tree createTree(int)>
procedure DupTreeRec.Tree$DupTreeRec.Tree$createTree$2235($param_0 : int) returns (__ret : ref) {
var $r123 : ref;
var $i128 : int;
var i432 : int;
var i331 : int;
var i230 : int;
var r024 : ref;
var $r229 : ref;
var i026 : int;
Block31:
	i230 := $param_0;
	 goto Block32;
	 //  @line: 19
Block32:
	 goto Block35, Block33;
	 //  @line: 19
Block35:
	 //  @line: 19
	 assume ($negInt(($gtint((i230), (0))))==1);
	 //  @line: 20
	__ret := $null;
	 return;
	 //  @line: 19
Block33:
	 assume ($gtint((i230), (0))==1);
	 goto Block34;
	 //  @line: 22
Block34:
	 //  @line: 22
	i331 := $subint((i230), (1));
	 goto Block36;
	 //  @line: 24
Block36:
	 //  @line: 24
	$r123 := $newvariable((37));
	 assume ($neref(($newvariable((37))), ($null))==1);
	 assert ($neref(($r123), ($null))==1);
	 //  @line: 24
	 call void$DupTreeRec.Tree$$la$init$ra$$2232(($r123));
	 //  @line: 24
	r024 := $r123;
	 //  @line: 25
	 call i026 := int$DupTreeRec.Random$random$2238();
	 //  @line: 27
	i432 := 0;
	 goto Block38;
	 //  @line: 27
Block38:
	 goto Block41, Block39;
	 //  @line: 27
Block41:
	 //  @line: 27
	 assume ($negInt(($geint((i432), (i026))))==1);
	 //  @line: 28
	$i128 := $subint((i331), (1));
	 //  @line: 28
	 call $r229 := DupTreeRec.Tree$DupTreeRec.Tree$createTree$2235(($i128));
	 assert ($neref((r024), ($null))==1);
	 //  @line: 28
	 call void$DupTreeRec.Tree$addChild$2233((r024), ($r229));
	 //  @line: 27
	i432 := $addint((i432), (1));
	 goto Block38;
	 //  @line: 27
Block39:
	 assume ($geint((i432), (i026))==1);
	 goto Block40;
	 //  @line: 31
Block40:
	 //  @line: 31
	__ret := r024;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $xorreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $andref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $cmpreal(x : realVar, y : realVar) returns (__ret : int) {
if ($ltreal((x), (y)) == 1) then 1 else if ($eqreal((x), (y)) == 1) then 0 else -1
}


// procedure is generated by joogie.
function {:inline true} $addreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $gtreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $eqreal(x : realVar, y : realVar) returns (__ret : int) {
if (x == y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $ltint(x : int, y : int) returns (__ret : int) {
if (x < y) then 1 else 0
}


	 //  @line: 2
// <DupTreeRec.DupTreeRec: void <init>()>
procedure void$DupTreeRec.DupTreeRec$$la$init$ra$$2228(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r01 : ref;
Block16:
	r01 := __this;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 3
	 call void$java.lang.Object$$la$init$ra$$28((r01));
	 return;
}


	 //  @line: 3
// <DupTreeRec.Random: void <clinit>()>
procedure void$DupTreeRec.Random$$la$clinit$ra$$2239()
  modifies int$DupTreeRec.Random$index0;
 {
	 //  @line: 4
Block45:
	 //  @line: 4
	int$DupTreeRec.Random$index0 := 0;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $newvariable($param00 : int) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $divint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $geint(x : int, y : int) returns (__ret : int) {
if (x >= y) then 1 else 0
}


	 //  @line: 4
// <DupTreeRec.DupTreeRec: void main(java.lang.String[])>
procedure void$DupTreeRec.DupTreeRec$main$2229($param_0 : [int]ref)
  modifies $stringSize, java.lang.String$lp$$rp$$DupTreeRec.Random$args257;
 {
var r02 : [int]ref;
var $i03 : int;
var r15 : ref;
Block17:
	r02 := $param_0;
	 //  @line: 5
	java.lang.String$lp$$rp$$DupTreeRec.Random$args257 := r02;
	 //  @line: 7
	 call $i03 := int$DupTreeRec.Random$random$2238();
	 //  @line: 7
	 call r15 := DupTreeRec.Tree$DupTreeRec.Tree$createTree$2235(($i03));
	 //  @line: 8
	 call void$DupTreeRec.DupTreeRec$dupTree$2230((r15));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $mulint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $leint(x : int, y : int) returns (__ret : int) {
if (x <= y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $shlref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $eqrefarray($param00 : [int]ref, $param11 : [int]ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $reftointarr($param00 : ref) returns (__ret : [int]int);



// procedure is generated by joogie.
function {:inline true} $ltref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $mulreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $shrref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 11
// <DupTreeRec.DupTreeRec: void dupTree(DupTreeRec.Tree)>
procedure void$DupTreeRec.DupTreeRec$dupTree$2230($param_0 : ref) {
var $r17 : ref;
var r06 : ref;
Block18:
	r06 := $param_0;
	 assert ($neref((r06), ($null))==1);
	 //  @line: 12
	$r17 := $HeapVar[r06, DupTreeRec.TreeList$DupTreeRec.Tree$children254];
	 //  @line: 12
	 call void$DupTreeRec.DupTreeRec$dupList$2231(($r17));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $ushrreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $shrreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $divreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $orint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $reftorealarr($param00 : ref) returns (__ret : [int]realVar);



// procedure is generated by joogie.
function {:inline true} $cmpref(x : ref, y : ref) returns (__ret : int) {
if ($ltref((x), (y)) == 1) then 1 else if ($eqref((x), (y)) == 1) then 0 else -1
}


	 //  @line: 13
// <DupTreeRec.Tree: DupTreeRec.Tree createNode()>
procedure DupTreeRec.Tree$DupTreeRec.Tree$createNode$2234() returns (__ret : ref) {
var r021 : ref;
var $r120 : ref;
	 //  @line: 14
Block29:
	 //  @line: 14
	$r120 := $newvariable((30));
	 assume ($neref(($newvariable((30))), ($null))==1);
	 assert ($neref(($r120), ($null))==1);
	 //  @line: 14
	 call void$DupTreeRec.Tree$$la$init$ra$$2232(($r120));
	 //  @line: 14
	r021 := $r120;
	 //  @line: 15
	__ret := r021;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $realtoint($param00 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $geref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $orreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $eqint(x : int, y : int) returns (__ret : int) {
if (x == y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $ushrref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $modref($param00 : ref, $param11 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $eqintarray($param00 : [int]int, $param11 : [int]int) returns (__ret : int);



// <java.lang.Object: void <init>()>
procedure void$java.lang.Object$$la$init$ra$$28(__this : ref);



// procedure is generated by joogie.
function {:inline true} $negRef($param00 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $lereal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $nereal(x : realVar, y : realVar) returns (__ret : int) {
if (x != y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $instanceof($param00 : ref, $param11 : classConst) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $xorref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $orref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $intarrtoref($param00 : [int]int) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $subreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $shlreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 4
// <DupTreeRec.Tree: void <init>()>
procedure void$DupTreeRec.Tree$$la$init$ra$$2232(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r015 : ref;
Block26:
	r015 := __this;
	 assert ($neref((r015), ($null))==1);
	 //  @line: 5
	 call void$java.lang.Object$$la$init$ra$$28((r015));
	 assert ($neref((r015), ($null))==1);
	 //  @line: 6
	$HeapVar[r015, DupTreeRec.TreeList$DupTreeRec.Tree$children254] := $null;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $negInt(x : int) returns (__ret : int) {
if (x == 0) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $gereal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $eqref(x : ref, y : ref) returns (__ret : int) {
if (x == y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $cmpint(x : int, y : int) returns (__ret : int) {
if (x < y) then 1 else if (x == y) then 0 else -1
}


// procedure is generated by joogie.
function {:inline true} $andint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $andreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 6
// <DupTreeRec.Random: int random()>
procedure int$DupTreeRec.Random$random$2238() returns (__ret : int)
  modifies $stringSize, int$DupTreeRec.Random$index0;
 {
var $r138 : [int]ref;
var $i241 : int;
var $i140 : int;
var $i037 : int;
var $i342 : int;
var r039 : ref;
	 //  @line: 7
Block44:
	 //  @line: 7
	$r138 := java.lang.String$lp$$rp$$DupTreeRec.Random$args257;
	 //  @line: 7
	$i037 := int$DupTreeRec.Random$index0;
	 assert ($geint(($i037), (0))==1);
	 assert ($ltint(($i037), ($refArrSize[$r138[$arrSizeIdx]]))==1);
	 //  @line: 7
	r039 := $r138[$i037];
	 //  @line: 8
	$i140 := int$DupTreeRec.Random$index0;
	 //  @line: 8
	$i241 := $addint(($i140), (1));
	 //  @line: 8
	int$DupTreeRec.Random$index0 := $i241;
	$i342 := $stringSize[r039];
	 //  @line: 9
	__ret := $i342;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $shlint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $xorint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $subint(x : int, y : int) returns (__ret : int) {
(x - y)
}


