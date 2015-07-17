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



var LinkedList$BinarySearchTree$data254 : Field ref;
var BinarySearchTree$BinarySearchTree$lc255 : Field ref;
var BinarySearchTree$BinarySearchTree$rc256 : Field ref;


// procedure is generated by joogie.
function {:inline true} $neref(x : ref, y : ref) returns (__ret : int) {
if (x != y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $realarrtoref($param00 : [int]realVar) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $modreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// <LinkedList: void <init>()>
procedure void$LinkedList$$la$init$ra$$2231(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r021 : ref;
Block37:
	r021 := __this;
	 assert ($neref((r021), ($null))==1);
	 //  @line: 1
	 call void$java.lang.Object$$la$init$ra$$28((r021));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $leref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 24
// <BinarySearchTree: void main(java.lang.String[])>
procedure void$BinarySearchTree$main$2230($param_0 : [int]ref)
  modifies $HeapVar;
 {
var $r214 : ref;
var r115 : ref;
var $r417 : ref;
var $r316 : ref;
var r020 : [int]ref;
var $r518 : ref;

 //temp local variables 
var $freshlocal0 : ref;

Block32:
	r020 := $param_0;
	 //  @line: 25
	$r214 := $newvariable((33));
	 assume ($neref(($newvariable((33))), ($null))==1);
	 assert ($neref(($r214), ($null))==1);
	 //  @line: 25
	 call void$BinarySearchTree$$la$init$ra$$2228(($r214));
	 //  @line: 25
	r115 := $r214;
	 //  @line: 26
	$r316 := $newvariable((34));
	 assume ($neref(($newvariable((34))), ($null))==1);
	 assert ($neref(($r316), ($null))==1);
	 //  @line: 26
	 call void$BinarySearchTree$$la$init$ra$$2228(($r316));
	 assert ($neref((r115), ($null))==1);
	 //  @line: 26
	$HeapVar[r115, BinarySearchTree$BinarySearchTree$lc255] := $r316;
	 //  @line: 27
	$r417 := $newvariable((35));
	 assume ($neref(($newvariable((35))), ($null))==1);
	 assert ($neref(($r417), ($null))==1);
	 //  @line: 27
	 call void$BinarySearchTree$$la$init$ra$$2228(($r417));
	 assert ($neref((r115), ($null))==1);
	 //  @line: 27
	$HeapVar[r115, BinarySearchTree$BinarySearchTree$rc256] := $r417;
	 //  @line: 28
	$r518 := $newvariable((36));
	 assume ($neref(($newvariable((36))), ($null))==1);
	 assert ($neref(($r518), ($null))==1);
	 //  @line: 28
	 call void$Null$$la$init$ra$$2233(($r518));
	 assert ($neref((r115), ($null))==1);
	 //  @line: 28
	$HeapVar[r115, LinkedList$BinarySearchTree$data254] := $r518;
	 assert ($neref((r115), ($null))==1);
	 //  @line: 31
	 call $freshlocal0 := BinarySearchTree$BinarySearchTree$copy$2229((r115));
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



// procedure is generated by joogie.
function {:inline true} $inttoreal($param00 : int) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $shrint($param00 : int, $param11 : int) returns (__ret : int);



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



	 //  @line: 7
// <BinarySearchTree: void <init>()>
procedure void$BinarySearchTree$$la$init$ra$$2228(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r01 : ref;
var $r12 : ref;
Block16:
	r01 := __this;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 8
	 call void$java.lang.Object$$la$init$ra$$28((r01));
	 //  @line: 9
	$r12 := $newvariable((17));
	 assume ($neref(($newvariable((17))), ($null))==1);
	 assert ($neref(($r12), ($null))==1);
	 //  @line: 9
	 call void$Null$$la$init$ra$$2233(($r12));
	 assert ($neref((r01), ($null))==1);
	 //  @line: 9
	$HeapVar[r01, LinkedList$BinarySearchTree$data254] := $r12;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 10
	$HeapVar[r01, BinarySearchTree$BinarySearchTree$lc255] := $null;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 11
	$HeapVar[r01, BinarySearchTree$BinarySearchTree$rc256] := $null;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $neint(x : int, y : int) returns (__ret : int) {
if (x != y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $ltreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// <Null: void <init>()>
procedure void$Null$$la$init$ra$$2233(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r022 : ref;
Block38:
	r022 := __this;
	 assert ($neref((r022), ($null))==1);
	 //  @line: 1
	 call void$LinkedList$$la$init$ra$$2231((r022));
	 return;
}


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



// <java.lang.Object: void <init>()>
procedure void$java.lang.Object$$la$init$ra$$28(__this : ref);



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



// <LinkedList: LinkedList copy()>
procedure LinkedList$LinkedList$copy$2232(__this : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $eqreal(x : realVar, y : realVar) returns (__ret : int) {
if (x == y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $ltint(x : int, y : int) returns (__ret : int) {
if (x < y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $newvariable($param00 : int) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $divint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $geint(x : int, y : int) returns (__ret : int) {
if (x >= y) then 1 else 0
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


// procedure is generated by joogie.
function {:inline true} $realtoint($param00 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $geref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 14
// <BinarySearchTree: BinarySearchTree copy()>
procedure BinarySearchTree$BinarySearchTree$copy$2229(__this : ref) returns (__ret : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r36 : ref;
var r14 : ref;
var $r69 : ref;
var $r710 : ref;
var $r1013 : ref;
var $r47 : ref;
var r05 : ref;
var $r58 : ref;
var $r23 : ref;
var $r811 : ref;
var $r912 : ref;
Block18:
	r05 := __this;
	 //  @line: 15
	$r23 := $newvariable((19));
	 assume ($neref(($newvariable((19))), ($null))==1);
	 assert ($neref(($r23), ($null))==1);
	 //  @line: 15
	 call void$BinarySearchTree$$la$init$ra$$2228(($r23));
	 //  @line: 15
	r14 := $r23;
	 assert ($neref((r05), ($null))==1);
	 //  @line: 16
	$r36 := $HeapVar[r05, LinkedList$BinarySearchTree$data254];
	 assert ($neref(($r36), ($null))==1);
	 //  @line: 16
	 call $r47 := LinkedList$LinkedList$copy$2232(($r36));
	 assert ($neref((r14), ($null))==1);
	 //  @line: 16
	$HeapVar[r14, LinkedList$BinarySearchTree$data254] := $r47;
	 assert ($neref((r05), ($null))==1);
	 //  @line: 17
	$r58 := $HeapVar[r05, BinarySearchTree$BinarySearchTree$lc255];
	 goto Block20;
	 //  @line: 17
Block20:
	 goto Block23, Block21;
	 //  @line: 17
Block23:
	 //  @line: 17
	 assume ($negInt(($neref(($r58), ($null))))==1);
	 assert ($neref((r14), ($null))==1);
	 //  @line: 21
	$HeapVar[r14, BinarySearchTree$BinarySearchTree$lc255] := $null;
	 goto Block24;
	 //  @line: 17
Block21:
	 assume ($neref(($r58), ($null))==1);
	 goto Block22;
	 //  @line: 19
Block24:
	 assert ($neref((r05), ($null))==1);
	 //  @line: 19
	$r811 := $HeapVar[r05, BinarySearchTree$BinarySearchTree$rc256];
	 goto Block26;
	 //  @line: 18
Block22:
	 assert ($neref((r05), ($null))==1);
	 //  @line: 18
	$r69 := $HeapVar[r05, BinarySearchTree$BinarySearchTree$lc255];
	 goto Block25;
	 //  @line: 19
Block26:
	 goto Block29, Block27;
	 //  @line: 18
Block25:
	 assert ($neref(($r69), ($null))==1);
	 //  @line: 18
	 call $r710 := BinarySearchTree$BinarySearchTree$copy$2229(($r69));
	 assert ($neref((r14), ($null))==1);
	 //  @line: 18
	$HeapVar[r14, BinarySearchTree$BinarySearchTree$lc255] := $r710;
	 goto Block24;
	 //  @line: 19
Block29:
	 //  @line: 19
	 assume ($negInt(($neref(($r811), ($null))))==1);
	 assert ($neref((r14), ($null))==1);
	 //  @line: 21
	$HeapVar[r14, BinarySearchTree$BinarySearchTree$rc256] := $null;
	 goto Block30;
	 //  @line: 19
Block27:
	 assume ($neref(($r811), ($null))==1);
	 goto Block28;
	 //  @line: 21
Block30:
	 //  @line: 21
	__ret := r14;
	 return;
	 //  @line: 20
Block28:
	 assert ($neref((r05), ($null))==1);
	 //  @line: 20
	$r912 := $HeapVar[r05, BinarySearchTree$BinarySearchTree$rc256];
	 goto Block31;
	 //  @line: 20
Block31:
	 assert ($neref(($r912), ($null))==1);
	 //  @line: 20
	 call $r1013 := BinarySearchTree$BinarySearchTree$copy$2229(($r912));
	 assert ($neref((r14), ($null))==1);
	 //  @line: 20
	$HeapVar[r14, BinarySearchTree$BinarySearchTree$rc256] := $r1013;
	 goto Block30;
}


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



	 //  @line: 2
// <Null: LinkedList copy()>
procedure LinkedList$Null$copy$2234(__this : ref) returns (__ret : ref)  requires ($neref((__this), ($null))==1);
 {
var r024 : ref;
var $r123 : ref;
Block39:
	r024 := __this;
	 //  @line: 3
	$r123 := $newvariable((40));
	 assume ($neref(($newvariable((40))), ($null))==1);
	 assert ($neref(($r123), ($null))==1);
	 //  @line: 3
	 call void$Null$$la$init$ra$$2233(($r123));
	 //  @line: 3
	__ret := $r123;
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


