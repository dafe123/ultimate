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



var int$Random$index0 : int;
var java.lang.String$lp$$rp$$Random$args254 : [int]ref;


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



// procedure is generated by joogie.
function {:inline true} $neint(x : int, y : int) returns (__ret : int) {
if (x != y) then 1 else 0
}


	 //  @line: 5
// <Random: int random()>
procedure int$Random$random$2232() returns (__ret : int)
  modifies int$Random$index0, $stringSize;
 {
var $i335 : int;
var $i436 : int;
var $i232 : int;
var $i537 : int;
var $r233 : [int]ref;
var $i030 : int;
var $i131 : int;
var $r129 : [int]ref;
var r034 : ref;
	 //  @line: 6
Block27:
	 //  @line: 6
	$i131 := int$Random$index0;
	 //  @line: 6
	$r129 := java.lang.String$lp$$rp$$Random$args254;
	 //  @line: 6
	$i030 := $refArrSize[$r129[$arrSizeIdx]];
	 goto Block28;
	 //  @line: 6
Block28:
	 goto Block31, Block29;
	 //  @line: 6
Block31:
	 //  @line: 6
	 assume ($negInt(($ltint(($i131), ($i030))))==1);
	 //  @line: 7
	__ret := 0;
	 return;
	 //  @line: 6
Block29:
	 assume ($ltint(($i131), ($i030))==1);
	 goto Block30;
	 //  @line: 9
Block30:
	 //  @line: 9
	$r233 := java.lang.String$lp$$rp$$Random$args254;
	 goto Block32;
	 //  @line: 9
Block32:
	 //  @line: 9
	$i232 := int$Random$index0;
	 assert ($geint(($i232), (0))==1);
	 assert ($ltint(($i232), ($refArrSize[$r233[$arrSizeIdx]]))==1);
	 //  @line: 9
	r034 := $r233[$i232];
	 //  @line: 10
	$i335 := int$Random$index0;
	 //  @line: 10
	$i436 := $addint(($i335), (1));
	 //  @line: 10
	int$Random$index0 := $i436;
	$i537 := $stringSize[r034];
	 //  @line: 11
	__ret := $i537;
	 return;
}


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



// procedure is generated by joogie.
function {:inline true} $xorreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 9
// <Et5: void loop(int,int,int)>
procedure void$Et5$loop$2230($param_0 : int, $param_1 : int, $param_2 : int) {
var $i418 : int;
var $i317 : int;
var $i620 : int;
var i822 : int;
var $i721 : int;
var i011 : int;
var i1226 : int;
var i113 : int;
var i923 : int;
var i1327 : int;
var i1024 : int;
var i1125 : int;
var $i216 : int;
var $i519 : int;
Block18:
	i822 := $param_0;
	i923 := $param_1;
	i1024 := $param_2;
	 goto Block19;
	 //  @line: 10
Block19:
	 goto Block20, Block22;
	 //  @line: 10
Block20:
	 assume ($ltint((i1024), (0))==1);
	 goto Block21;
	 //  @line: 10
Block22:
	 //  @line: 10
	 assume ($negInt(($ltint((i1024), (0))))==1);
	 //  @line: 11
	 call i011 := int$Random$random$2232();
	 //  @line: 12
	 call i113 := int$Random$random$2232();
	 //  @line: 13
	$i216 := $mulint((2), (i822));
	 //  @line: 13
	$i519 := $subint(($i216), (i923));
	 //  @line: 13
	$i317 := $mulint((2), (i011));
	 //  @line: 13
	$i418 := $subint(($i317), (i113));
	 goto Block23;
	 //  @line: 20
Block21:
	 return;
	 //  @line: 13
Block23:
	 goto Block25, Block24;
	 //  @line: 13
Block25:
	 //  @line: 13
	 assume ($negInt(($leint(($i519), ($i418))))==1);
	 //  @line: 14
	i1125 := i011;
	 //  @line: 15
	i1226 := i113;
	 //  @line: 16
	$i620 := $mulint((2), (i1125));
	 //  @line: 16
	$i721 := $addint((i1024), ($i620));
	 //  @line: 16
	i1327 := $subint(($i721), (i1226));
	 //  @line: 17
	 call void$Et5$loop$2230((i1125), (i1226), (i1327));
	 goto Block21;
	 //  @line: 13
Block24:
	 assume ($leint(($i519), ($i418))==1);
	 goto Block21;
}


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



// <java.lang.String: int length()>
procedure int$java.lang.String$length$59(__this : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ltref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $mulreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $shrref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 2
// <Random: void <clinit>()>
procedure void$Random$$la$clinit$ra$$2233()
  modifies int$Random$index0;
 {
	 //  @line: 3
Block33:
	 //  @line: 3
	int$Random$index0 := 0;
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


// <Et5: void <init>()>
procedure void$Et5$$la$init$ra$$2228(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r01 : ref;
Block16:
	r01 := __this;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 1
	 call void$java.lang.Object$$la$init$ra$$28((r01));
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


	 //  @line: 2
// <Et5: void main(java.lang.String[])>
procedure void$Et5$main$2229($param_0 : [int]ref)
  modifies java.lang.String$lp$$rp$$Random$args254, $stringSize;
 {
var r02 : [int]ref;
var i28 : int;
var i16 : int;
var i04 : int;
Block17:
	r02 := $param_0;
	 //  @line: 3
	java.lang.String$lp$$rp$$Random$args254 := r02;
	 //  @line: 4
	 call i04 := int$Random$random$2232();
	 //  @line: 5
	 call i16 := int$Random$random$2232();
	 //  @line: 6
	 call i28 := int$Random$random$2232();
	 //  @line: 7
	 call void$Et5$loop$2230((i04), (i16), (i28));
	 return;
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


// <Random: void <init>()>
procedure void$Random$$la$init$ra$$2231(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r028 : ref;
Block26:
	r028 := __this;
	 assert ($neref((r028), ($null))==1);
	 //  @line: 1
	 call void$java.lang.Object$$la$init$ra$$28((r028));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $andint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $andreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// <java.lang.Object: void <init>()>
procedure void$java.lang.Object$$la$init$ra$$28(__this : ref);



// procedure is generated by joogie.
function {:inline true} $shlint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $xorint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $subint(x : int, y : int) returns (__ret : int) {
(x - y)
}


