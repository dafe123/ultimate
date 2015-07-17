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
const unique javaUtilEx.RandomAccess : classConst ;
const unique javaUtilEx.List : classConst ;
const unique javaUtilEx.Content : classConst ;



var int$javaUtilEx.SubList$size0 : Field int;
var java.lang.String$lp$$rp$$javaUtilEx.Random$args299 : [int]ref;
var int$javaUtilEx.Content$val0 : Field int;
var javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304 : Field ref;
var $fresh5 : ref;
var int$javaUtilEx.AbstractList$Itr$lastRet0 : Field int;
var javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302 : Field ref;
var int$javaUtilEx.Random$index0 : int;
var $fresh6 : ref;
var javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309 : Field ref;
var int$javaUtilEx.LinkedList$size0 : Field int;
var javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301 : Field ref;
var javaUtilEx.LinkedList$ListItr$javaUtilEx.LinkedList$DescendingIterator$itr306 : Field ref;
var javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308 : Field ref;
var javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298 : Field ref;
var int$javaUtilEx.AbstractList$Itr$cursor0 : Field int;
var int$javaUtilEx.SubList$offset0 : Field int;
var javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305 : Field ref;
var javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295 : Field ref;
var $fresh4 : ref;
var int$javaUtilEx.SubList$1$val$index0 : Field int;
var int$javaUtilEx.LinkedList$ListItr$expectedModCount0 : Field int;
var $fresh1 : ref;
var javaUtilEx.LinkedList$javaUtilEx.LinkedList$DescendingIterator$this$0307 : Field ref;
var int$javaUtilEx.AbstractList$modCount0 : Field int;
var javaUtilEx.AbstractList$javaUtilEx.SubList$l297 : Field ref;
var java.lang.Object$javaUtilEx.LinkedList$Entry$element300 : Field ref;
var int$javaUtilEx.LinkedList$ListItr$nextIndex0 : Field int;
var $fresh2 : ref;
var $fresh3 : ref;
var javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296 : Field ref;
var int$javaUtilEx.AbstractList$Itr$expectedModCount0 : Field int;
var javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303 : Field ref;


// <javaUtilEx.Iterator: void remove()>
procedure void$javaUtilEx.Iterator$remove$2256(__this : ref);



	 //  @line: 484
// <javaUtilEx.AbstractList: javaUtilEx.List subList(int,int)>
procedure javaUtilEx.List$javaUtilEx.AbstractList$subList$2496(__this : ref, $param_0 : int, $param_1 : int) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0163 : ref;
var $r1169 : ref;
var r3171 : ref;
var i0166 : int;
var i1167 : int;
var $z0164 : int;
var r2170 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 484
Block245:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block246;
Block246:
	r0163 := __this;
	i0166 := $param_0;
	i1167 := $param_1;
	 //  @line: 485
	$z0164 := $instanceof((r0163), (javaUtilEx.RandomAccess));
	 goto Block247;
	 //  @line: 485
Block247:
	 goto Block250, Block248;
	 //  @line: 485
Block250:
	 //  @line: 485
	 assume ($negInt(($eqint(($z0164), (0))))==1);
	 //  @line: 485
	r2170 := $newvariable((251));
	 assume ($neref(($newvariable((251))), ($null))==1);
	$r1169 := r2170;
	 assert ($neref((r2170), ($null))==1);
	 //  @line: 485
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.RandomAccessSubList$$la$init$ra$$2540((r2170), (r0163), (i0166), (i1167));
	 goto Block254, Block252;
	 //  @line: 485
Block248:
	 assume ($eqint(($z0164), (0))==1);
	 goto Block249;
	 //  @line: 485
Block254:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block255;
	 //  @line: 485
Block252:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block253;
	 //  @line: 485
Block249:
	 //  @line: 485
	r3171 := $newvariable((261));
	 assume ($neref(($newvariable((261))), ($null))==1);
	 goto Block262;
	 //  @line: 485
Block255:
	 goto Block256, Block258;
	 //  @line: 485
Block253:
	$Exep0 := $caughtEx2;
	 return;
Block262:
	$r1169 := r3171;
	 assert ($neref((r3171), ($null))==1);
	 //  @line: 485
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.SubList$$la$init$ra$$2549((r3171), (r0163), (i0166), (i1167));
	 goto Block263, Block265;
	 //  @line: 485
Block256:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block257;
	 //  @line: 485
Block258:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block259;
Block263:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block264;
Block265:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block266;
	 //  @line: 485
Block257:
	$Exep1 := $caughtEx3;
	 return;
	 //  @line: 485
Block259:
	 goto Block260;
Block264:
	$Exep0 := $caughtEx2;
	 return;
Block266:
	 goto Block269, Block267;
	 //  @line: 485
Block260:
	 //  @line: 485
	__ret := $r1169;
	 return;
Block269:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block270;
Block267:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block268;
Block270:
	 goto Block260;
Block268:
	$Exep1 := $caughtEx3;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $realarrtoref($param00 : [int]realVar) returns (__ret : ref);



	 //  @line: 330
// <javaUtilEx.AbstractList$Itr: void <init>(javaUtilEx.AbstractList)>
procedure void$javaUtilEx.AbstractList$Itr$$la$init$ra$$2534(__this : ref, $param_0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1219 : ref;
var $r2220 : ref;
var $i0221 : int;
var r0218 : ref;
Block347:
	r0218 := __this;
	r1219 := $param_0;
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 331
	$HeapVar[r0218, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295] := r1219;
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 331
	 call void$java.lang.Object$$la$init$ra$$28((r0218));
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 335
	$HeapVar[r0218, int$javaUtilEx.AbstractList$Itr$cursor0] := 0;
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 342
	$HeapVar[r0218, int$javaUtilEx.AbstractList$Itr$lastRet0] := -1;
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 349
	$r2220 := $HeapVar[r0218, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref(($r2220), ($null))==1);
	 //  @line: 349
	$i0221 := $HeapVar[$r2220, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0218), ($null))==1);
	 //  @line: 349
	$HeapVar[r0218, int$javaUtilEx.AbstractList$Itr$expectedModCount0] := $i0221;
	 return;
}


	 //  @line: 464
// <javaUtilEx.LinkedList: boolean offerFirst(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$offerFirst$2654(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0676 : ref;
var r1677 : ref;
Block1004:
	r0676 := __this;
	r1677 := $param_0;
	 assert ($neref((r0676), ($null))==1);
	 //  @line: 465
	 call void$javaUtilEx.LinkedList$addFirst$2635((r0676), (r1677));
	 //  @line: 466
	__ret := 1;
	 return;
}


	 //  @line: 181
// <javaUtilEx.AbstractCollection: boolean containsAll(javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractCollection$containsAll$2235(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z030 : int;
var $z133 : int;
var r229 : ref;
var r031 : ref;
var r127 : ref;
var $r332 : ref;
Block65:
	r031 := __this;
	r127 := $param_0;
	 assert ($neref((r127), ($null))==1);
	 //  @line: 182
	 call r229 := javaUtilEx.Iterator$javaUtilEx.Collection$iterator$2244((r127));
	 goto Block66;
	 //  @line: 183
Block66:
	 assert ($neref((r229), ($null))==1);
	 //  @line: 183
	 call $z030 := boolean$javaUtilEx.Iterator$hasNext$2254((r229));
	 goto Block67;
	 //  @line: 183
Block67:
	 goto Block68, Block70;
	 //  @line: 183
Block68:
	 assume ($eqint(($z030), (0))==1);
	 goto Block69;
	 //  @line: 183
Block70:
	 //  @line: 183
	 assume ($negInt(($eqint(($z030), (0))))==1);
	 assert ($neref((r229), ($null))==1);
	 //  @line: 184
	 call $r332 := java.lang.Object$javaUtilEx.Iterator$next$2255((r229));
	 assert ($neref((r031), ($null))==1);
	 //  @line: 184
	 call $z133 := boolean$javaUtilEx.AbstractCollection$contains$2232((r031), ($r332));
	 goto Block71;
	 //  @line: 186
Block69:
	 //  @line: 186
	__ret := 1;
	 return;
	 //  @line: 184
Block71:
	 goto Block73, Block72;
	 //  @line: 184
Block73:
	 //  @line: 184
	 assume ($negInt(($neint(($z133), (0))))==1);
	 //  @line: 185
	__ret := 0;
	 return;
	 //  @line: 184
Block72:
	 assume ($neint(($z133), (0))==1);
	 goto Block66;
}


// procedure is generated by joogie.
function {:inline true} $leref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 11
// <javaUtilEx.juLinkedListCreateRemoveRange: javaUtilEx.LinkedList createList(int)>
procedure javaUtilEx.LinkedList$javaUtilEx.juLinkedListCreateRemoveRange$createList$2628($param_0 : int) returns (__ret : ref) {
var i1528 : int;
var $r1523 : ref;
var r0524 : ref;
var $i0527 : int;
var $r2526 : ref;
Block760:
	i1528 := $param_0;
	 //  @line: 12
	$r1523 := $newvariable((761));
	 assume ($neref(($newvariable((761))), ($null))==1);
	 assert ($neref(($r1523), ($null))==1);
	 //  @line: 12
	 call void$javaUtilEx.LinkedList$$la$init$ra$$2629(($r1523));
	 //  @line: 12
	r0524 := $r1523;
	 goto Block762;
	 //  @line: 13
Block762:
	 goto Block763, Block765;
	 //  @line: 13
Block763:
	 assume ($leint((i1528), (0))==1);
	 goto Block764;
	 //  @line: 13
Block765:
	 //  @line: 13
	 assume ($negInt(($leint((i1528), (0))))==1);
	 //  @line: 14
	$r2526 := $newvariable((766));
	 assume ($neref(($newvariable((766))), ($null))==1);
	 //  @line: 14
	 call $i0527 := int$javaUtilEx.Random$random$2674();
	 assert ($neref(($r2526), ($null))==1);
	 //  @line: 14
	 call void$javaUtilEx.Content$$la$init$ra$$2586(($r2526), ($i0527));
	 assert ($neref((r0524), ($null))==1);
	 //  @line: 14
	 call void$javaUtilEx.LinkedList$addLast$2636((r0524), ($r2526));
	 //  @line: 15
	i1528 := $addint((i1528), (-1));
	 goto Block762;
	 //  @line: 17
Block764:
	 //  @line: 17
	__ret := r0524;
	 return;
}


	 //  @line: 711
// <javaUtilEx.LinkedList$ListItr: void add(java.lang.Object)>
procedure void$javaUtilEx.LinkedList$ListItr$add$2686(__this : ref, $param_0 : ref) returns ($Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i0869 : int;
var $r2863 : ref;
var r0862 : ref;
var $i3872 : int;
var $r4866 : ref;
var $i1870 : int;
var r1865 : ref;
var $r3864 : ref;
var $i2871 : int;
var $r5867 : ref;

 //temp local variables 
var $caughtEx1 : ref;
var $freshlocal2 : ref;

	 //  @line: 711
Block1248:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1249;
Block1249:
	r0862 := __this;
	r1865 := $param_0;
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 712
	 call $caughtEx1 := void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687((r0862));
	 goto Block1250, Block1252;
Block1250:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1251;
Block1252:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1253;
Block1251:
	$Exep0 := $caughtEx1;
	 return;
Block1253:
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 713
	$r2863 := $HeapVar[r0862, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 713
	 call $r3864 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669(($r2863));
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 713
	$HeapVar[r0862, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303] := $r3864;
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 714
	$r5867 := $HeapVar[r0862, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 714
	$r4866 := $HeapVar[r0862, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 //  @line: 714
	 call $freshlocal2 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$300$2672(($r5867), (r1865), ($r4866));
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 715
	$i0869 := $HeapVar[r0862, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 715
	$i1870 := $addint(($i0869), (1));
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 715
	$HeapVar[r0862, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i1870;
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 716
	$i2871 := $HeapVar[r0862, int$javaUtilEx.LinkedList$ListItr$expectedModCount0];
	 //  @line: 716
	$i3872 := $addint(($i2871), (1));
	 assert ($neref((r0862), ($null))==1);
	 //  @line: 716
	$HeapVar[r0862, int$javaUtilEx.LinkedList$ListItr$expectedModCount0] := $i3872;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $inttoreal($param00 : int) returns (__ret : realVar);



	 //  @line: 773
// <javaUtilEx.LinkedList$DescendingIterator: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.LinkedList$DescendingIterator$next$2690(__this : ref) returns (__ret : ref, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r2889 : ref;
var r0887 : ref;
var $r1888 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 773
Block1268:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1269;
Block1269:
	r0887 := __this;
	 assert ($neref((r0887), ($null))==1);
	 //  @line: 774
	$r1888 := $HeapVar[r0887, javaUtilEx.LinkedList$ListItr$javaUtilEx.LinkedList$DescendingIterator$itr306];
	 assert ($neref(($r1888), ($null))==1);
	 //  @line: 774
	 call $r2889, $caughtEx2, $caughtEx3 := java.lang.Object$javaUtilEx.LinkedList$ListItr$previous$2681(($r1888));
	 goto Block1270, Block1272;
Block1270:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1271;
Block1272:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1273;
Block1271:
	$Exep1 := $caughtEx2;
	 return;
Block1273:
	 goto Block1274, Block1276;
Block1274:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block1275;
Block1276:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block1277;
Block1275:
	$Exep0 := $caughtEx3;
	 return;
Block1277:
	 //  @line: 774
	__ret := $r2889;
	 return;
}


// <java.lang.String: int length()>
procedure int$java.lang.String$length$59(__this : ref) returns (__ret : int);



	 //  @line: 319
// <javaUtilEx.AbstractCollection: java.lang.String toString()>
procedure java.lang.String$javaUtilEx.AbstractCollection$toString$2240(__this : ref) returns (__ret : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var $r778 : ref;
var $r879 : ref;
var r066 : ref;
var r1591 : ref;
var $r371 : ref;
var $z069 : int;
var $r677 : ref;
var $z181 : int;
var $r1387 : ref;
var $r573 : ref;
var r168 : ref;
var $r1793 : ref;
var $r982 : ref;
var $r1083 : ref;
var $r472 : ref;
var r276 : ref;
var r1995 : ref;
var $r1488 : ref;
var $r1184 : ref;
var r1692 : ref;
var r1894 : ref;
var $r1286 : ref;
Block112:
	r066 := __this;
	 assert ($neref((r066), ($null))==1);
	 //  @line: 320
	 call r168 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r066));
	 assert ($neref((r168), ($null))==1);
	 //  @line: 321
	 call $z069 := boolean$javaUtilEx.Iterator$hasNext$2254((r168));
	 goto Block113;
	 //  @line: 321
Block113:
	 goto Block114, Block116;
	 //  @line: 321
Block114:
	 assume ($neint(($z069), (0))==1);
	 goto Block115;
	 //  @line: 321
Block116:
	 //  @line: 321
	 assume ($negInt(($neint(($z069), (0))))==1);
	$stringSize[$fresh1] := 2;
	 //  @line: 322
	__ret := $fresh1;
	 return;
	 //  @line: 324
Block115:
	$stringSize[$fresh2] := 0;
	 //  @line: 324
	r1591 := $fresh2;
	 goto Block117;
	 //  @line: 325
Block117:
	 //  @line: 325
	$r371 := $newvariable((118));
	 assume ($neref(($newvariable((118))), ($null))==1);
	 assert ($neref(($r371), ($null))==1);
	 //  @line: 325
	 call void$java.lang.StringBuilder$$la$init$ra$$2261(($r371));
	 assert ($neref(($r371), ($null))==1);
	 //  @line: 325
	 call $r472 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r371), (r1591));
	$stringSize[$fresh3] := 1;
	 assert ($neref(($r472), ($null))==1);
	 //  @line: 325
	 call $r573 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r472), ($fresh3));
	 assert ($neref(($r573), ($null))==1);
	 //  @line: 325
	 call r1692 := java.lang.String$java.lang.StringBuilder$toString$2299(($r573));
	 goto Block119;
	 //  @line: 327
Block119:
	 assert ($neref((r168), ($null))==1);
	 //  @line: 327
	 call r276 := java.lang.Object$javaUtilEx.Iterator$next$2255((r168));
	 //  @line: 328
	$r677 := $newvariable((120));
	 assume ($neref(($newvariable((120))), ($null))==1);
	 assert ($neref(($r677), ($null))==1);
	 //  @line: 328
	 call void$java.lang.StringBuilder$$la$init$ra$$2261(($r677));
	 assert ($neref(($r677), ($null))==1);
	 //  @line: 328
	 call $r778 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r677), (r1692));
	 goto Block121;
	 //  @line: 328
Block121:
	 goto Block122, Block124;
	 //  @line: 328
Block122:
	 assume ($neref((r276), (r066))==1);
	 goto Block123;
	 //  @line: 328
Block124:
	 //  @line: 328
	 assume ($negInt(($neref((r276), (r066))))==1);
	$stringSize[$fresh4] := 17;
	 //  @line: 331
	$r1793 := $fresh4;
	 goto Block125;
	 //  @line: 331
Block123:
	 //  @line: 331
	$r1793 := r276;
	 goto Block125;
	 //  @line: 328
Block125:
	 assert ($neref(($r778), ($null))==1);
	 //  @line: 328
	 call $r879 := java.lang.StringBuilder$java.lang.StringBuilder$append$2265(($r778), ($r1793));
	 goto Block126;
	 //  @line: 328
Block126:
	 assert ($neref(($r879), ($null))==1);
	 //  @line: 328
	 call r1894 := java.lang.String$java.lang.StringBuilder$toString$2299(($r879));
	 assert ($neref((r168), ($null))==1);
	 //  @line: 329
	 call $z181 := boolean$javaUtilEx.Iterator$hasNext$2254((r168));
	 goto Block127;
	 //  @line: 329
Block127:
	 goto Block130, Block128;
	 //  @line: 329
Block130:
	 //  @line: 329
	 assume ($negInt(($neint(($z181), (0))))==1);
	 //  @line: 330
	$r1286 := $newvariable((131));
	 assume ($neref(($newvariable((131))), ($null))==1);
	 assert ($neref(($r1286), ($null))==1);
	 //  @line: 330
	 call void$java.lang.StringBuilder$$la$init$ra$$2261(($r1286));
	 assert ($neref(($r1286), ($null))==1);
	 //  @line: 330
	 call $r1387 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r1286), (r1894));
	$stringSize[$fresh5] := 1;
	 assert ($neref(($r1387), ($null))==1);
	 //  @line: 330
	 call $r1488 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r1387), ($fresh5));
	 assert ($neref(($r1488), ($null))==1);
	 //  @line: 330
	 call r1995 := java.lang.String$java.lang.StringBuilder$toString$2299(($r1488));
	 //  @line: 331
	__ret := r1995;
	 return;
	 //  @line: 329
Block128:
	 assume ($neint(($z181), (0))==1);
	 goto Block129;
	 //  @line: 333
Block129:
	 //  @line: 333
	$r982 := $newvariable((132));
	 assume ($neref(($newvariable((132))), ($null))==1);
	 goto Block133;
	 //  @line: 333
Block133:
	 assert ($neref(($r982), ($null))==1);
	 //  @line: 333
	 call void$java.lang.StringBuilder$$la$init$ra$$2261(($r982));
	 assert ($neref(($r982), ($null))==1);
	 //  @line: 333
	 call $r1083 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r982), (r1894));
	$stringSize[$fresh6] := 2;
	 assert ($neref(($r1083), ($null))==1);
	 //  @line: 333
	 call $r1184 := java.lang.StringBuilder$java.lang.StringBuilder$append$2266(($r1083), ($fresh6));
	 assert ($neref(($r1184), ($null))==1);
	 //  @line: 333
	 call r1692 := java.lang.String$java.lang.StringBuilder$toString$2299(($r1184));
	 goto Block119;
}


	 //  @line: 421
// <javaUtilEx.AbstractList$ListItr: void set(java.lang.Object)>
procedure void$javaUtilEx.AbstractList$ListItr$set$2547(__this : ref, $param_0 : ref) returns ($Exep2 : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i2298 : int;
var $i0292 : int;
var r1293 : ref;
var $i1294 : int;
var r0291 : ref;
var $r3295 : ref;
var $r5297 : ref;
var $r7300 : ref;
var $r6299 : ref;
var $r8302 : ref;

 //temp local variables 
var $caughtEx4 : ref;
var $freshlocal5 : ref;
var $caughtEx6 : ref;
var $caughtEx3 : ref;

	 //  @line: 421
Block448:
	$caughtEx6 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block449;
Block449:
	r0291 := __this;
	r1293 := $param_0;
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 422
	$i0292 := $HeapVar[r0291, int$javaUtilEx.AbstractList$Itr$lastRet0];
	 goto Block450;
	 //  @line: 422
Block450:
	 goto Block451, Block453;
	 //  @line: 422
Block451:
	 assume ($geint(($i0292), (0))==1);
	 goto Block452;
	 //  @line: 422
Block453:
	 //  @line: 422
	 assume ($negInt(($geint(($i0292), (0))))==1);
	 //  @line: 423
	$r6299 := $newvariable((454));
	 assume ($neref(($newvariable((454))), ($null))==1);
	 assert ($neref(($r6299), ($null))==1);
	 //  @line: 423
	 call void$javaUtilEx.IllegalStateException$$la$init$ra$$2574(($r6299));
	 goto Block455;
	 //  @line: 424
Block452:
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 424
	 call $caughtEx3 := void$javaUtilEx.AbstractList$Itr$checkForComodification$2538((r0291));
	 goto Block456, Block458;
	 //  @line: 422
Block455:
	$Exep0 := $r6299;
	 return;
	 //  @line: 424
Block456:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block457;
	 //  @line: 424
Block458:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block459;
	 //  @line: 424
Block457:
	$Exep1 := $caughtEx3;
	 return;
	 //  @line: 424
Block459:
	 goto Block460;
	 //  @line: 427
Block460:
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 427
	$r3295 := $HeapVar[r0291, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296];
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 427
	$i1294 := $HeapVar[r0291, int$javaUtilEx.AbstractList$Itr$lastRet0];
	 assert ($neref(($r3295), ($null))==1);
	 //  @line: 427
	 call $freshlocal5, $caughtEx4 := java.lang.Object$javaUtilEx.AbstractList$set$2486(($r3295), ($i1294), (r1293));
	 goto Block461, Block463;
	 //  @line: 427
Block461:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block462;
	 //  @line: 427
Block463:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block464;
	 //  @line: 427
Block462:
	$Exep2 := $caughtEx4;
	 return;
	 //  @line: 427
Block464:
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 428
	$r5297 := $HeapVar[r0291, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296];
	 assert ($neref(($r5297), ($null))==1);
	 //  @line: 428
	$i2298 := $HeapVar[$r5297, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0291), ($null))==1);
	 //  @line: 428
	$HeapVar[r0291, int$javaUtilEx.AbstractList$Itr$expectedModCount0] := $i2298;
	 goto Block465;
	 //  @line: 431
Block465:
	 goto Block466;
	 //  @line: 432
Block466:
	 return;
}


	 //  @line: 636
// <javaUtilEx.LinkedList$ListItr: void <init>(javaUtilEx.LinkedList,int)>
procedure void$javaUtilEx.LinkedList$ListItr$$la$init$ra$$2677(__this : ref, $param_0 : ref, $param_1 : int) returns ($Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i1782 : int;
var $r10796 : ref;
var $r8792 : ref;
var $i3786 : int;
var $i4787 : int;
var $r12799 : ref;
var $r3780 : ref;
var $i8794 : int;
var $r4781 : ref;
var $r6788 : ref;
var $r7791 : ref;
var $i9797 : int;
var r0777 : ref;
var $i2785 : int;
var r1778 : ref;
var $r11798 : ref;
var $r2779 : ref;
var $i6790 : int;
var $i7793 : int;
var $i10800 : int;
var $i5789 : int;
var $r5784 : ref;
var $r9795 : ref;
var i0783 : int;
var $i11801 : int;

 //temp local variables 

	 //  @line: 636
Block1098:
	$Exep0 := $null;
	 goto Block1145;
Block1145:
	r0777 := __this;
	r1778 := $param_0;
	i0783 := $param_1;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 637
	$HeapVar[r0777, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305] := r1778;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 637
	 call void$java.lang.Object$$la$init$ra$$28((r0777));
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 632
	$r2779 := $HeapVar[r0777, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 632
	 call $r3780 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669(($r2779));
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 632
	$HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303] := $r3780;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 635
	$r4781 := $HeapVar[r0777, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 assert ($neref(($r4781), ($null))==1);
	 //  @line: 635
	$i1782 := $HeapVar[$r4781, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 635
	$HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$expectedModCount0] := $i1782;
	 goto Block1146;
	 //  @line: 638
Block1146:
	 goto Block1147, Block1149;
	 //  @line: 638
Block1147:
	 assume ($ltint((i0783), (0))==1);
	 goto Block1148;
	 //  @line: 638
Block1149:
	 //  @line: 638
	 assume ($negInt(($ltint((i0783), (0))))==1);
	 //  @line: 639
	 call $i2785 := int$javaUtilEx.LinkedList$access$100$2670((r1778));
	 goto Block1150;
	 //  @line: 639
Block1148:
	 //  @line: 639
	$r5784 := $newvariable((1154));
	 assume ($neref(($newvariable((1154))), ($null))==1);
	 assert ($neref(($r5784), ($null))==1);
	 //  @line: 639
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2075(($r5784));
	 goto Block1155;
	 //  @line: 639
Block1150:
	 goto Block1151, Block1153;
	 //  @line: 639
Block1155:
	$Exep0 := $r5784;
	 return;
	 //  @line: 639
Block1151:
	 assume ($leint((i0783), ($i2785))==1);
	 goto Block1152;
	 //  @line: 639
Block1153:
	 //  @line: 639
	 assume ($negInt(($leint((i0783), ($i2785))))==1);
	 goto Block1148;
	 //  @line: 640
Block1152:
	 //  @line: 640
	 call $i3786 := int$javaUtilEx.LinkedList$access$100$2670((r1778));
	 goto Block1156;
	 //  @line: 640
Block1156:
	 //  @line: 640
	$i4787 := $shrint(($i3786), (1));
	 goto Block1157;
	 //  @line: 640
Block1157:
	 goto Block1160, Block1158;
	 //  @line: 640
Block1160:
	 //  @line: 640
	 assume ($negInt(($geint((i0783), ($i4787))))==1);
	 //  @line: 641
	 call $r9795 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669((r1778));
	 assert ($neref(($r9795), ($null))==1);
	 //  @line: 641
	$r10796 := $HeapVar[$r9795, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 641
	$HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r10796;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 642
	$HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := 0;
	 goto Block1161;
	 //  @line: 640
Block1158:
	 assume ($geint((i0783), ($i4787))==1);
	 goto Block1159;
	 //  @line: 642
Block1161:
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 642
	$i9797 := $HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 goto Block1162;
	 //  @line: 645
Block1159:
	 //  @line: 645
	 call $r6788 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669((r1778));
	 goto Block1166;
	 //  @line: 642
Block1162:
	 goto Block1163, Block1165;
	 //  @line: 645
Block1166:
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 645
	$HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r6788;
	 //  @line: 646
	 call $i5789 := int$javaUtilEx.LinkedList$access$100$2670((r1778));
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 646
	$HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i5789;
	 goto Block1167;
	 //  @line: 642
Block1163:
	 assume ($geint(($i9797), (i0783))==1);
	 goto Block1164;
	 //  @line: 642
Block1165:
	 //  @line: 642
	 assume ($negInt(($geint(($i9797), (i0783))))==1);
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 643
	$r11798 := $HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 assert ($neref(($r11798), ($null))==1);
	 //  @line: 643
	$r12799 := $HeapVar[$r11798, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 643
	$HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r12799;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 642
	$i10800 := $HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 642
	$i11801 := $addint(($i10800), (1));
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 642
	$HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i11801;
	 goto Block1161;
	 //  @line: 646
Block1167:
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 646
	$i6790 := $HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 goto Block1168;
	 //  @line: 649
Block1164:
	 return;
	 //  @line: 646
Block1168:
	 goto Block1170, Block1169;
	 //  @line: 646
Block1170:
	 //  @line: 646
	 assume ($negInt(($leint(($i6790), (i0783))))==1);
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 647
	$r7791 := $HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 assert ($neref(($r7791), ($null))==1);
	 //  @line: 647
	$r8792 := $HeapVar[$r7791, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 647
	$HeapVar[r0777, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r8792;
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 646
	$i7793 := $HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 646
	$i8794 := $subint(($i7793), (1));
	 assert ($neref((r0777), ($null))==1);
	 //  @line: 646
	$HeapVar[r0777, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i8794;
	 goto Block1167;
	 //  @line: 646
Block1169:
	 assume ($leint(($i6790), (i0783))==1);
	 goto Block1164;
}


	 //  @line: 407
// <javaUtilEx.LinkedList: java.lang.Object peek()>
procedure java.lang.Object$javaUtilEx.LinkedList$peek$2649(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0663 : ref;
var $r1665 : ref;
var $i0664 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 407
Block969:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block970;
Block970:
	r0663 := __this;
	 assert ($neref((r0663), ($null))==1);
	 //  @line: 408
	$i0664 := $HeapVar[r0663, int$javaUtilEx.LinkedList$size0];
	 goto Block971;
	 //  @line: 408
Block971:
	 goto Block974, Block972;
	 //  @line: 408
Block974:
	 //  @line: 408
	 assume ($negInt(($neint(($i0664), (0))))==1);
	 //  @line: 409
	__ret := $null;
	 return;
	 //  @line: 408
Block972:
	 assume ($neint(($i0664), (0))==1);
	 goto Block973;
	 //  @line: 410
Block973:
	 assert ($neref((r0663), ($null))==1);
	 //  @line: 410
	 call $r1665, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$getFirst$2631((r0663));
	 goto Block975, Block977;
	 //  @line: 410
Block975:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block976;
	 //  @line: 410
Block977:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block978;
	 //  @line: 410
Block976:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 410
Block978:
	 goto Block979;
	 //  @line: 410
Block979:
	 //  @line: 410
	__ret := $r1665;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $mulref($param00 : ref, $param11 : ref) returns (__ret : ref);



	 //  @line: 396
// <javaUtilEx.AbstractList$ListItr: boolean hasPrevious()>
procedure boolean$javaUtilEx.AbstractList$ListItr$hasPrevious$2543(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0275 : int;
var $i0273 : int;
var r0272 : ref;
Block425:
	r0272 := __this;
	 assert ($neref((r0272), ($null))==1);
	 //  @line: 397
	$i0273 := $HeapVar[r0272, int$javaUtilEx.AbstractList$Itr$cursor0];
	 goto Block426;
	 //  @line: 397
Block426:
	 goto Block427, Block429;
	 //  @line: 397
Block427:
	 assume ($eqint(($i0273), (0))==1);
	 goto Block428;
	 //  @line: 397
Block429:
	 //  @line: 397
	 assume ($negInt(($eqint(($i0273), (0))))==1);
	 //  @line: 397
	$z0275 := 1;
	 goto Block430;
	 //  @line: 397
Block428:
	 //  @line: 397
	$z0275 := 0;
	 goto Block430;
	 //  @line: 397
Block430:
	 //  @line: 397
	__ret := $z0275;
	 return;
}


// <javaUtilEx.ListIterator: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.ListIterator$next$2526(__this : ref) returns (__ret : ref);



	 //  @line: 627
// <javaUtilEx.LinkedList: javaUtilEx.ListIterator listIterator(int)>
procedure javaUtilEx.ListIterator$javaUtilEx.LinkedList$listIterator$2664(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0714 : ref;
var i0715 : int;
var $r1713 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 627
Block1099:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1100;
Block1100:
	r0714 := __this;
	i0715 := $param_0;
	 //  @line: 628
	$r1713 := $newvariable((1101));
	 assume ($neref(($newvariable((1101))), ($null))==1);
	 assert ($neref(($r1713), ($null))==1);
	 //  @line: 628
	 call $caughtEx1 := void$javaUtilEx.LinkedList$ListItr$$la$init$ra$$2677(($r1713), (r0714), (i0715));
	 goto Block1102, Block1104;
Block1102:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1103;
Block1104:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1105;
Block1103:
	$Exep0 := $caughtEx1;
	 return;
Block1105:
	 //  @line: 628
	__ret := $r1713;
	 return;
}


// <javaUtilEx.ListIterator: boolean hasPrevious()>
procedure boolean$javaUtilEx.ListIterator$hasPrevious$2527(__this : ref) returns (__ret : int);



	 //  @line: 417
// <javaUtilEx.AbstractList$ListItr: int previousIndex()>
procedure int$javaUtilEx.AbstractList$ListItr$previousIndex$2546(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0288 : ref;
var $i0289 : int;
var $i1290 : int;
Block447:
	r0288 := __this;
	 assert ($neref((r0288), ($null))==1);
	 //  @line: 418
	$i0289 := $HeapVar[r0288, int$javaUtilEx.AbstractList$Itr$cursor0];
	 //  @line: 418
	$i1290 := $subint(($i0289), (1));
	 //  @line: 418
	__ret := $i1290;
	 return;
}


// <javaUtilEx.Iterator: boolean hasNext()>
procedure boolean$javaUtilEx.Iterator$hasNext$2254(__this : ref) returns (__ret : int);



	 //  @line: 193
// <javaUtilEx.LinkedList: boolean contains(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$contains$2637(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0570 : int;
var r0566 : ref;
var r1567 : ref;
var $i0568 : int;
Block808:
	r0566 := __this;
	r1567 := $param_0;
	 assert ($neref((r0566), ($null))==1);
	 //  @line: 194
	 call $i0568 := int$javaUtilEx.LinkedList$indexOf$2647((r0566), (r1567));
	 goto Block809;
	 //  @line: 194
Block809:
	 goto Block810, Block812;
	 //  @line: 194
Block810:
	 assume ($eqint(($i0568), (-1))==1);
	 goto Block811;
	 //  @line: 194
Block812:
	 //  @line: 194
	 assume ($negInt(($eqint(($i0568), (-1))))==1);
	 //  @line: 194
	$z0570 := 1;
	 goto Block813;
	 //  @line: 194
Block811:
	 //  @line: 194
	$z0570 := 0;
	 goto Block813;
	 //  @line: 194
Block813:
	 //  @line: 194
	__ret := $z0570;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $reftorefarr($param00 : ref) returns (__ret : [int]ref);



// procedure is generated by joogie.
function {:inline true} $reftoint($param00 : ref) returns (__ret : int);



	 //  @line: 413
// <javaUtilEx.AbstractList$ListItr: int nextIndex()>
procedure int$javaUtilEx.AbstractList$ListItr$nextIndex$2545(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0286 : ref;
var $i0287 : int;
Block446:
	r0286 := __this;
	 assert ($neref((r0286), ($null))==1);
	 //  @line: 414
	$i0287 := $HeapVar[r0286, int$javaUtilEx.AbstractList$Itr$cursor0];
	 //  @line: 414
	__ret := $i0287;
	 return;
}


	 //  @line: 238
// <javaUtilEx.AbstractSequentialList: javaUtilEx.Iterator iterator()>
procedure javaUtilEx.Iterator$javaUtilEx.AbstractSequentialList$iterator$2584(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0493 : ref;
var $r1494 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 238
Block731:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block732;
Block732:
	r0493 := __this;
	 assert ($neref((r0493), ($null))==1);
	 //  @line: 239
	 call $r1494, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2494((r0493));
	 goto Block733, Block735;
Block733:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block734;
Block735:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block736;
Block734:
	$Exep0 := $caughtEx1;
	 return;
Block736:
	 //  @line: 239
	__ret := $r1494;
	 return;
}


	 //  @line: 651
// <javaUtilEx.LinkedList$ListItr: boolean hasNext()>
procedure boolean$javaUtilEx.LinkedList$ListItr$hasNext$2678(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $i0804 : int;
var $z0807 : int;
var $r1803 : ref;
var $i1805 : int;
var r0802 : ref;
Block1171:
	r0802 := __this;
	 assert ($neref((r0802), ($null))==1);
	 //  @line: 652
	$i0804 := $HeapVar[r0802, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 assert ($neref((r0802), ($null))==1);
	 //  @line: 652
	$r1803 := $HeapVar[r0802, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 652
	 call $i1805 := int$javaUtilEx.LinkedList$access$100$2670(($r1803));
	 goto Block1172;
	 //  @line: 652
Block1172:
	 goto Block1175, Block1173;
	 //  @line: 652
Block1175:
	 //  @line: 652
	 assume ($negInt(($eqint(($i0804), ($i1805))))==1);
	 //  @line: 652
	$z0807 := 1;
	 goto Block1176;
	 //  @line: 652
Block1173:
	 assume ($eqint(($i0804), ($i1805))==1);
	 goto Block1174;
	 //  @line: 652
Block1176:
	 //  @line: 652
	__ret := $z0807;
	 return;
	 //  @line: 652
Block1174:
	 //  @line: 652
	$z0807 := 0;
	 goto Block1176;
}


// procedure is generated by joogie.
function {:inline true} $xorreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// <java.lang.RuntimeException: void <init>(java.lang.Throwable)>
procedure void$java.lang.RuntimeException$$la$init$ra$$763(__this : ref, $param_0 : ref);



// procedure is generated by joogie.
function {:inline true} $andref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 726
// <javaUtilEx.SubList$1: int nextIndex()>
procedure int$javaUtilEx.SubList$1$nextIndex$2698(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $r2928 : ref;
var $i1929 : int;
var $i0927 : int;
var $r1926 : ref;
var $i2930 : int;
var r0925 : ref;
Block1328:
	r0925 := __this;
	 assert ($neref((r0925), ($null))==1);
	 //  @line: 727
	$r1926 := $HeapVar[r0925, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r1926), ($null))==1);
	 //  @line: 727
	 call $i0927 := int$javaUtilEx.ListIterator$nextIndex$2529(($r1926));
	 assert ($neref((r0925), ($null))==1);
	 //  @line: 727
	$r2928 := $HeapVar[r0925, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 727
	 call $i1929 := int$javaUtilEx.SubList$access$000$2565(($r2928));
	 //  @line: 727
	$i2930 := $subint(($i0927), ($i1929));
	 //  @line: 727
	__ret := $i2930;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $cmpreal(x : realVar, y : realVar) returns (__ret : int) {
if ($ltreal((x), (y)) == 1) then 1 else if ($eqreal((x), (y)) == 1) then 0 else -1
}


	 //  @line: 85
// <javaUtilEx.AbstractCollection: boolean isEmpty()>
procedure boolean$javaUtilEx.AbstractCollection$isEmpty$2231(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r02 : ref;
var $i03 : int;
var $z05 : int;
Block17:
	r02 := __this;
	 assert ($neref((r02), ($null))==1);
	 //  @line: 86
	 call $i03 := int$javaUtilEx.AbstractCollection$size$2230((r02));
	 goto Block18;
	 //  @line: 86
Block18:
	 goto Block21, Block19;
	 //  @line: 86
Block21:
	 //  @line: 86
	 assume ($negInt(($neint(($i03), (0))))==1);
	 //  @line: 86
	$z05 := 1;
	 goto Block22;
	 //  @line: 86
Block19:
	 assume ($neint(($i03), (0))==1);
	 goto Block20;
	 //  @line: 86
Block22:
	 //  @line: 86
	__ret := $z05;
	 return;
	 //  @line: 86
Block20:
	 //  @line: 86
	$z05 := 0;
	 goto Block22;
}


	 //  @line: 641
// <javaUtilEx.SubList: java.lang.Object get(int)>
procedure java.lang.Object$javaUtilEx.SubList$get$2551(__this : ref, $param_0 : int) returns (__ret : ref, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i2335 : int;
var i0333 : int;
var $r1336 : ref;
var $i1334 : int;
var $r2337 : ref;
var r0332 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 641
Block522:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block523;
Block523:
	r0332 := __this;
	i0333 := $param_0;
	 assert ($neref((r0332), ($null))==1);
	 //  @line: 642
	 call $caughtEx2 := void$javaUtilEx.SubList$rangeCheck$2561((r0332), (i0333));
	 goto Block526, Block524;
Block526:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block527;
Block524:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block525;
Block527:
	 assert ($neref((r0332), ($null))==1);
	 //  @line: 643
	 call $caughtEx3 := void$javaUtilEx.SubList$checkForComodification$2564((r0332));
	 goto Block530, Block528;
Block525:
	$Exep0 := $caughtEx2;
	 return;
Block530:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block531;
Block528:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block529;
Block531:
	 assert ($neref((r0332), ($null))==1);
	 //  @line: 644
	$r1336 := $HeapVar[r0332, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0332), ($null))==1);
	 //  @line: 644
	$i1334 := $HeapVar[r0332, int$javaUtilEx.SubList$offset0];
	 //  @line: 644
	$i2335 := $addint((i0333), ($i1334));
	 assert ($neref(($r1336), ($null))==1);
	 //  @line: 644
	 call $r2337 := java.lang.Object$javaUtilEx.AbstractList$get$2485(($r1336), ($i2335));
	 //  @line: 644
	__ret := $r2337;
	 return;
Block529:
	$Exep1 := $caughtEx3;
	 return;
}


	 //  @line: 100
// <javaUtilEx.LinkedList: void <init>()>
procedure void$javaUtilEx.LinkedList$$la$init$ra$$2629(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0529 : ref;
var $r4533 : ref;
var $r3532 : ref;
var $r1530 : ref;
var $r2531 : ref;
Block767:
	r0529 := __this;
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 101
	 call void$javaUtilEx.AbstractSequentialList$$la$init$ra$$2578((r0529));
	 //  @line: 95
	$r1530 := $newvariable((768));
	 assume ($neref(($newvariable((768))), ($null))==1);
	 assert ($neref(($r1530), ($null))==1);
	 //  @line: 95
	 call void$javaUtilEx.LinkedList$Entry$$la$init$ra$$2676(($r1530), ($null), ($null), ($null));
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 95
	$HeapVar[r0529, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298] := $r1530;
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 96
	$HeapVar[r0529, int$javaUtilEx.LinkedList$size0] := 0;
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 102
	$r4533 := $HeapVar[r0529, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 102
	$r3532 := $HeapVar[r0529, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref((r0529), ($null))==1);
	 //  @line: 102
	$r2531 := $HeapVar[r0529, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r3532), ($null))==1);
	 //  @line: 102
	$HeapVar[$r3532, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := $r2531;
	 assert ($neref(($r4533), ($null))==1);
	 //  @line: 102
	$HeapVar[$r4533, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := $r2531;
	 return;
}


	 //  @line: 54
// <javaUtilEx.IllegalStateException: void <init>(java.lang.String)>
procedure void$javaUtilEx.IllegalStateException$$la$init$ra$$2575(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0436 : ref;
var r1437 : ref;
Block687:
	r0436 := __this;
	r1437 := $param_0;
	 assert ($neref((r0436), ($null))==1);
	 //  @line: 55
	 call void$java.lang.RuntimeException$$la$init$ra$$761((r0436), (r1437));
	 return;
}


// <javaUtilEx.ListIterator: java.lang.Object previous()>
procedure java.lang.Object$javaUtilEx.ListIterator$previous$2528(__this : ref) returns (__ret : ref);



	 //  @line: 761
// <javaUtilEx.SubList: void rangeCheckForAdd(int)>
procedure void$javaUtilEx.SubList$rangeCheckForAdd$2562(__this : ref, $param_0 : int) returns ($Exep0 : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var i0405 : int;
var $r2408 : ref;
var $i1409 : int;
var $r1406 : ref;
var r0407 : ref;

 //temp local variables 

	 //  @line: 761
Block538:
	$Exep0 := $null;
	 goto Block658;
Block658:
	r0407 := __this;
	i0405 := $param_0;
	 goto Block659;
	 //  @line: 762
Block659:
	 goto Block662, Block660;
	 //  @line: 762
Block662:
	 //  @line: 762
	 assume ($negInt(($ltint((i0405), (0))))==1);
	 assert ($neref((r0407), ($null))==1);
	 //  @line: 763
	$i1409 := $HeapVar[r0407, int$javaUtilEx.SubList$size0];
	 goto Block663;
	 //  @line: 762
Block660:
	 assume ($ltint((i0405), (0))==1);
	 goto Block661;
	 //  @line: 763
Block663:
	 goto Block664, Block666;
	 //  @line: 763
Block661:
	 //  @line: 763
	$r1406 := $newvariable((667));
	 assume ($neref(($newvariable((667))), ($null))==1);
	 assert ($neref((r0407), ($null))==1);
	 //  @line: 763
	 call $r2408 := java.lang.String$javaUtilEx.SubList$outOfBoundsMsg$2563((r0407), (i0405));
	 assert ($neref(($r1406), ($null))==1);
	 //  @line: 763
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2076(($r1406), ($r2408));
	 goto Block668;
	 //  @line: 763
Block664:
	 assume ($leint((i0405), ($i1409))==1);
	 goto Block665;
	 //  @line: 763
Block666:
	 //  @line: 763
	 assume ($negInt(($leint((i0405), ($i1409))))==1);
	 goto Block661;
	 //  @line: 763
Block668:
	$Exep0 := $r1406;
	 return;
	 //  @line: 764
Block665:
	 return;
}


// procedure is generated by joogie.
function {:inline true} $ltint(x : int, y : int) returns (__ret : int) {
if (x < y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $mulint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ltref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $mulreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



	 //  @line: 256
// <javaUtilEx.AbstractList: boolean addAll(int,javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractList$addAll$2492(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : int, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var i1154 : int;
var $r3153 : ref;
var $i0152 : int;
var $z0151 : int;
var r2150 : ref;
var r0145 : ref;
var r1148 : ref;
var z1155 : int;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 256
Block215:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block216;
Block216:
	r0145 := __this;
	i1154 := $param_0;
	r1148 := $param_1;
	 assert ($neref((r0145), ($null))==1);
	 //  @line: 257
	 call $caughtEx2 := void$javaUtilEx.AbstractList$rangeCheckForAdd$2500((r0145), (i1154));
	 goto Block219, Block217;
Block219:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block220;
Block217:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block218;
Block220:
	 //  @line: 258
	z1155 := 0;
	 assert ($neref((r1148), ($null))==1);
	 //  @line: 259
	 call r2150 := javaUtilEx.Iterator$javaUtilEx.Collection$iterator$2244((r1148));
	 goto Block221;
Block218:
	$Exep0 := $caughtEx2;
	 return;
	 //  @line: 260
Block221:
	 assert ($neref((r2150), ($null))==1);
	 //  @line: 260
	 call $z0151 := boolean$javaUtilEx.Iterator$hasNext$2254((r2150));
	 goto Block222;
	 //  @line: 260
Block222:
	 goto Block225, Block223;
	 //  @line: 260
Block225:
	 //  @line: 260
	 assume ($negInt(($eqint(($z0151), (0))))==1);
	 //  @line: 261
	$i0152 := i1154;
	 //  @line: 261
	i1154 := $addint((i1154), (1));
	 assert ($neref((r2150), ($null))==1);
	 //  @line: 261
	 call $r3153 := java.lang.Object$javaUtilEx.Iterator$next$2255((r2150));
	 assert ($neref((r0145), ($null))==1);
	 //  @line: 261
	 call $caughtEx3 := void$javaUtilEx.AbstractList$add$2487((r0145), ($i0152), ($r3153));
	 goto Block226, Block228;
	 //  @line: 260
Block223:
	 assume ($eqint(($z0151), (0))==1);
	 goto Block224;
	 //  @line: 260
Block226:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block227;
	 //  @line: 260
Block228:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block229;
	 //  @line: 264
Block224:
	 //  @line: 264
	__ret := z1155;
	 return;
	 //  @line: 260
Block227:
	$Exep1 := $caughtEx3;
	 return;
	 //  @line: 260
Block229:
	 //  @line: 262
	z1155 := 1;
	 goto Block221;
}


// procedure is generated by joogie.
function {:inline true} $ushrreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 647
// <javaUtilEx.SubList: int size()>
procedure int$javaUtilEx.SubList$size$2552(__this : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0338 : ref;
var $i0339 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 647
Block532:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block533;
Block533:
	r0338 := __this;
	 assert ($neref((r0338), ($null))==1);
	 //  @line: 648
	 call $caughtEx1 := void$javaUtilEx.SubList$checkForComodification$2564((r0338));
	 goto Block534, Block536;
Block534:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block535;
Block536:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block537;
Block535:
	$Exep0 := $caughtEx1;
	 return;
Block537:
	 assert ($neref((r0338), ($null))==1);
	 //  @line: 649
	$i0339 := $HeapVar[r0338, int$javaUtilEx.SubList$size0];
	 //  @line: 649
	__ret := $i0339;
	 return;
}


	 //  @line: 160
// <javaUtilEx.LinkedList: java.lang.Object removeLast()>
procedure java.lang.Object$javaUtilEx.LinkedList$removeLast$2634(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0553 : ref;
var $r2555 : ref;
var $r3556 : ref;
var $r1554 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 160
Block800:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block801;
Block801:
	r0553 := __this;
	 assert ($neref((r0553), ($null))==1);
	 //  @line: 161
	$r1554 := $HeapVar[r0553, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r1554), ($null))==1);
	 //  @line: 161
	$r2555 := $HeapVar[$r1554, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref((r0553), ($null))==1);
	 //  @line: 161
	 call $r3556, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0553), ($r2555));
	 goto Block802, Block804;
Block802:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block803;
Block804:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block805;
Block803:
	$Exep0 := $caughtEx1;
	 return;
Block805:
	 //  @line: 161
	__ret := $r3556;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $cmpref(x : ref, y : ref) returns (__ret : int) {
if ($ltref((x), (y)) == 1) then 1 else if ($eqref((x), (y)) == 1) then 0 else -1
}


// <javaUtilEx.ListIterator: void add(java.lang.Object)>
procedure void$javaUtilEx.ListIterator$add$2533(__this : ref, $param_0 : ref);



	 //  @line: 715
// <javaUtilEx.SubList$1: boolean hasPrevious()>
procedure boolean$javaUtilEx.SubList$1$hasPrevious$2696(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0919 : int;
var r0916 : ref;
var $i0917 : int;
Block1313:
	r0916 := __this;
	 assert ($neref((r0916), ($null))==1);
	 //  @line: 716
	 call $i0917 := int$javaUtilEx.SubList$1$previousIndex$2699((r0916));
	 goto Block1314;
	 //  @line: 716
Block1314:
	 goto Block1315, Block1317;
	 //  @line: 716
Block1315:
	 assume ($ltint(($i0917), (0))==1);
	 goto Block1316;
	 //  @line: 716
Block1317:
	 //  @line: 716
	 assume ($negInt(($ltint(($i0917), (0))))==1);
	 //  @line: 716
	$z0919 := 1;
	 goto Block1318;
	 //  @line: 716
Block1316:
	 //  @line: 716
	$z0919 := 0;
	 goto Block1318;
	 //  @line: 716
Block1318:
	 //  @line: 716
	__ret := $z0919;
	 return;
}


	 //  @line: 51
// <javaUtilEx.UnsupportedOperationException: void <init>(java.lang.String)>
procedure void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2258(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r097 : ref;
var r198 : ref;
Block135:
	r097 := __this;
	r198 := $param_0;
	 assert ($neref((r097), ($null))==1);
	 //  @line: 52
	 call void$java.lang.RuntimeException$$la$init$ra$$761((r097), (r198));
	 return;
}


	 //  @line: 781
// <javaUtilEx.RandomAccessSubList: javaUtilEx.List subList(int,int)>
procedure javaUtilEx.List$javaUtilEx.RandomAccessSubList$subList$2541(__this : ref, $param_0 : int, $param_1 : int) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1265 : ref;
var r0266 : ref;
var i0267 : int;
var i1268 : int;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 781
Block413:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block414;
Block414:
	r0266 := __this;
	i0267 := $param_0;
	i1268 := $param_1;
	 //  @line: 782
	$r1265 := $newvariable((415));
	 assume ($neref(($newvariable((415))), ($null))==1);
	 assert ($neref(($r1265), ($null))==1);
	 //  @line: 782
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.RandomAccessSubList$$la$init$ra$$2540(($r1265), (r0266), (i0267), (i1268));
	 goto Block416, Block418;
Block416:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block417;
Block418:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block419;
Block417:
	$Exep0 := $caughtEx2;
	 return;
Block419:
	 goto Block420, Block422;
Block420:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block421;
Block422:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block423;
Block421:
	$Exep1 := $caughtEx3;
	 return;
Block423:
	 //  @line: 782
	__ret := $r1265;
	 return;
}


	 //  @line: 734
// <javaUtilEx.SubList$1: void remove()>
procedure void$javaUtilEx.SubList$1$remove$2700(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0937 : ref;
var $r3940 : ref;
var $r2939 : ref;
var $r1938 : ref;
var $r4941 : ref;
var $i0942 : int;
var $r5943 : ref;

 //temp local variables 
var $freshlocal0 : int;

Block1330:
	r0937 := __this;
	 assert ($neref((r0937), ($null))==1);
	 //  @line: 735
	$r1938 := $HeapVar[r0937, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r1938), ($null))==1);
	 //  @line: 735
	 call void$javaUtilEx.ListIterator$remove$2531(($r1938));
	 assert ($neref((r0937), ($null))==1);
	 //  @line: 736
	$r3940 := $HeapVar[r0937, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 assert ($neref((r0937), ($null))==1);
	 //  @line: 736
	$r2939 := $HeapVar[r0937, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 736
	 call $r4941 := javaUtilEx.AbstractList$javaUtilEx.SubList$access$100$2566(($r2939));
	 assert ($neref(($r4941), ($null))==1);
	 //  @line: 736
	$i0942 := $HeapVar[$r4941, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref(($r3940), ($null))==1);
	 //  @line: 736
	$HeapVar[$r3940, int$javaUtilEx.AbstractList$modCount0] := $i0942;
	 assert ($neref((r0937), ($null))==1);
	 //  @line: 737
	$r5943 := $HeapVar[r0937, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 737
	 call $freshlocal0 := int$javaUtilEx.SubList$access$210$2568(($r5943));
	 return;
}


	 //  @line: 369
// <javaUtilEx.AbstractList$Itr: void remove()>
procedure void$javaUtilEx.AbstractList$Itr$remove$2537(__this : ref) returns ($Exep2 : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i5247 : int;
var $i2243 : int;
var $i0239 : int;
var $i3244 : int;
var $i1240 : int;
var $i6248 : int;
var $r5249 : ref;
var $r2241 : ref;
var $i4246 : int;
var $r7252 : ref;
var $r4245 : ref;
var r0238 : ref;
var $r6250 : ref;

 //temp local variables 
var $caughtEx6 : ref;
var $caughtEx3 : ref;
var $freshlocal5 : ref;
var $caughtEx4 : ref;

	 //  @line: 369
Block370:
	$caughtEx6 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block371;
Block371:
	r0238 := __this;
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 370
	$i0239 := $HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$lastRet0];
	 goto Block372;
	 //  @line: 370
Block372:
	 goto Block373, Block375;
	 //  @line: 370
Block373:
	 assume ($geint(($i0239), (0))==1);
	 goto Block374;
	 //  @line: 370
Block375:
	 //  @line: 370
	 assume ($negInt(($geint(($i0239), (0))))==1);
	 //  @line: 371
	$r5249 := $newvariable((376));
	 assume ($neref(($newvariable((376))), ($null))==1);
	 assert ($neref(($r5249), ($null))==1);
	 //  @line: 371
	 call void$javaUtilEx.IllegalStateException$$la$init$ra$$2574(($r5249));
	 goto Block377;
	 //  @line: 372
Block374:
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 372
	 call $caughtEx3 := void$javaUtilEx.AbstractList$Itr$checkForComodification$2538((r0238));
	 goto Block378, Block380;
	 //  @line: 370
Block377:
	$Exep0 := $r5249;
	 return;
	 //  @line: 372
Block378:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block379;
	 //  @line: 372
Block380:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block381;
	 //  @line: 372
Block379:
	$Exep1 := $caughtEx3;
	 return;
	 //  @line: 372
Block381:
	 goto Block382;
	 //  @line: 375
Block382:
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 375
	$r2241 := $HeapVar[r0238, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 375
	$i1240 := $HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$lastRet0];
	 assert ($neref(($r2241), ($null))==1);
	 //  @line: 375
	 call $freshlocal5, $caughtEx4 := java.lang.Object$javaUtilEx.AbstractList$remove$2488(($r2241), ($i1240));
	 goto Block385, Block383;
	 //  @line: 375
Block385:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block386;
	 //  @line: 375
Block383:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block384;
	 //  @line: 375
Block386:
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 376
	$i3244 := $HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$lastRet0];
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 376
	$i2243 := $HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$cursor0];
	 goto Block387;
	 //  @line: 375
Block384:
	$Exep2 := $caughtEx4;
	 return;
	 //  @line: 376
Block387:
	 goto Block388, Block390;
	 //  @line: 376
Block388:
	 assume ($geint(($i3244), ($i2243))==1);
	 goto Block389;
	 //  @line: 376
Block390:
	 //  @line: 376
	 assume ($negInt(($geint(($i3244), ($i2243))))==1);
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 377
	$i5247 := $HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$cursor0];
	 //  @line: 377
	$i6248 := $subint(($i5247), (1));
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 377
	$HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$cursor0] := $i6248;
	 goto Block389;
	 //  @line: 378
Block389:
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 378
	$HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$lastRet0] := -1;
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 379
	$r4245 := $HeapVar[r0238, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref(($r4245), ($null))==1);
	 //  @line: 379
	$i4246 := $HeapVar[$r4245, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0238), ($null))==1);
	 //  @line: 379
	$HeapVar[r0238, int$javaUtilEx.AbstractList$Itr$expectedModCount0] := $i4246;
	 goto Block391;
	 //  @line: 382
Block391:
	 goto Block392;
	 //  @line: 383
Block392:
	 return;
}


	 //  @line: 4
// <javaUtilEx.juLinkedListCreateRemoveRange: void main(java.lang.String[])>
procedure void$javaUtilEx.juLinkedListCreateRemoveRange$main$2627($param_0 : [int]ref) returns ($Exep0 : ref)
  modifies java.lang.String$lp$$rp$$javaUtilEx.Random$args299, $stringSize;
 {
var $i0518 : int;
var r0517 : [int]ref;
var r1520 : ref;
var $i2522 : int;
var $i1521 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 4
Block754:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block755;
Block755:
	r0517 := $param_0;
	 //  @line: 5
	java.lang.String$lp$$rp$$javaUtilEx.Random$args299 := r0517;
	 //  @line: 7
	 call $i0518 := int$javaUtilEx.Random$random$2674();
	 //  @line: 7
	 call r1520 := javaUtilEx.LinkedList$javaUtilEx.juLinkedListCreateRemoveRange$createList$2628(($i0518));
	 //  @line: 8
	 call $i1521 := int$javaUtilEx.Random$random$2674();
	 //  @line: 8
	 call $i2522 := int$javaUtilEx.Random$random$2674();
	 assert ($neref((r1520), ($null))==1);
	 //  @line: 8
	 call $caughtEx1 := void$javaUtilEx.AbstractList$removeRange$2499((r1520), ($i1521), ($i2522));
	 goto Block758, Block756;
Block758:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block759;
Block756:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block757;
Block759:
	 return;
Block757:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 744
// <javaUtilEx.SubList$1: void add(java.lang.Object)>
procedure void$javaUtilEx.SubList$1$add$2702(__this : ref, $param_0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r2950 : ref;
var $r5953 : ref;
var r1949 : ref;
var $r4952 : ref;
var r0948 : ref;
var $r3951 : ref;
var $i0954 : int;
var $r6955 : ref;

 //temp local variables 
var $freshlocal0 : int;

Block1332:
	r0948 := __this;
	r1949 := $param_0;
	 assert ($neref((r0948), ($null))==1);
	 //  @line: 745
	$r2950 := $HeapVar[r0948, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r2950), ($null))==1);
	 //  @line: 745
	 call void$javaUtilEx.ListIterator$add$2533(($r2950), (r1949));
	 assert ($neref((r0948), ($null))==1);
	 //  @line: 746
	$r4952 := $HeapVar[r0948, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 assert ($neref((r0948), ($null))==1);
	 //  @line: 746
	$r3951 := $HeapVar[r0948, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 746
	 call $r5953 := javaUtilEx.AbstractList$javaUtilEx.SubList$access$100$2566(($r3951));
	 assert ($neref(($r5953), ($null))==1);
	 //  @line: 746
	$i0954 := $HeapVar[$r5953, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref(($r4952), ($null))==1);
	 //  @line: 746
	$HeapVar[$r4952, int$javaUtilEx.AbstractList$modCount0] := $i0954;
	 assert ($neref((r0948), ($null))==1);
	 //  @line: 747
	$r6955 := $HeapVar[r0948, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 747
	 call $freshlocal0 := int$javaUtilEx.SubList$access$208$2569(($r6955));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $eqintarray($param00 : [int]int, $param11 : [int]int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $lereal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $xorref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 756
// <javaUtilEx.SubList: void rangeCheck(int)>
procedure void$javaUtilEx.SubList$rangeCheck$2561(__this : ref, $param_0 : int) returns ($Exep0 : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var $r1401 : ref;
var i0400 : int;
var $r2403 : ref;
var r0402 : ref;
var $i1404 : int;

 //temp local variables 

	 //  @line: 756
Block506:
	$Exep0 := $null;
	 goto Block647;
Block647:
	r0402 := __this;
	i0400 := $param_0;
	 goto Block648;
	 //  @line: 757
Block648:
	 goto Block651, Block649;
	 //  @line: 757
Block651:
	 //  @line: 757
	 assume ($negInt(($ltint((i0400), (0))))==1);
	 assert ($neref((r0402), ($null))==1);
	 //  @line: 758
	$i1404 := $HeapVar[r0402, int$javaUtilEx.SubList$size0];
	 goto Block652;
	 //  @line: 757
Block649:
	 assume ($ltint((i0400), (0))==1);
	 goto Block650;
	 //  @line: 758
Block652:
	 goto Block653, Block655;
	 //  @line: 758
Block650:
	 //  @line: 758
	$r1401 := $newvariable((656));
	 assume ($neref(($newvariable((656))), ($null))==1);
	 assert ($neref((r0402), ($null))==1);
	 //  @line: 758
	 call $r2403 := java.lang.String$javaUtilEx.SubList$outOfBoundsMsg$2563((r0402), (i0400));
	 assert ($neref(($r1401), ($null))==1);
	 //  @line: 758
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2076(($r1401), ($r2403));
	 goto Block657;
	 //  @line: 758
Block653:
	 assume ($ltint((i0400), ($i1404))==1);
	 goto Block654;
	 //  @line: 758
Block655:
	 //  @line: 758
	 assume ($negInt(($ltint((i0400), ($i1404))))==1);
	 goto Block650;
	 //  @line: 758
Block657:
	$Exep0 := $r1401;
	 return;
	 //  @line: 759
Block654:
	 return;
}


// procedure is generated by joogie.
function {:inline true} $intarrtoref($param00 : [int]int) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $subreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// <javaUtilEx.ListIterator: int nextIndex()>
procedure int$javaUtilEx.ListIterator$nextIndex$2529(__this : ref) returns (__ret : int);



// <javaUtilEx.AbstractCollection: javaUtilEx.Iterator iterator()>
procedure javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229(__this : ref) returns (__ret : ref);



// <javaUtilEx.Collection: boolean contains(java.lang.Object)>
procedure boolean$javaUtilEx.Collection$contains$2243(__this : ref, $param_0 : ref) returns (__ret : int);



// <java.lang.IndexOutOfBoundsException: void <init>(java.lang.String)>
procedure void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2076(__this : ref, $param_0 : ref);



// <javaUtilEx.AbstractList: java.lang.Object get(int)>
procedure java.lang.Object$javaUtilEx.AbstractList$get$2485(__this : ref, $param_0 : int) returns (__ret : ref);



	 //  @line: 766
// <javaUtilEx.SubList: java.lang.String outOfBoundsMsg(int)>
procedure java.lang.String$javaUtilEx.SubList$outOfBoundsMsg$2563(__this : ref, $param_0 : int) returns (__ret : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var i0411 : int;
var r0410 : ref;
Block669:
	r0410 := __this;
	i0411 := $param_0;
	$stringSize[$fresh2] := 0;
	 //  @line: 767
	__ret := $fresh2;
	 return;
}


	 //  @line: 680
// <javaUtilEx.SubList: boolean addAll(int,javaUtilEx.Collection)>
procedure boolean$javaUtilEx.SubList$addAll$2557(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : int, $Exep2 : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r2385 : ref;
var $i4388 : int;
var r0378 : ref;
var $i3384 : int;
var i1382 : int;
var $r3387 : ref;
var r1380 : ref;
var $i2383 : int;
var $i6390 : int;
var i0379 : int;
var $i5389 : int;

 //temp local variables 
var $caughtEx4 : ref;
var $caughtEx3 : ref;
var $caughtEx5 : ref;
var $freshlocal6 : int;

	 //  @line: 680
Block577:
	$caughtEx5 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block592;
Block592:
	r0378 := __this;
	i0379 := $param_0;
	r1380 := $param_1;
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 681
	 call $caughtEx3 := void$javaUtilEx.SubList$rangeCheckForAdd$2562((r0378), (i0379));
	 goto Block593, Block595;
Block593:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block594;
Block595:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block596;
Block594:
	$Exep0 := $caughtEx3;
	 return;
Block596:
	 assert ($neref((r1380), ($null))==1);
	 //  @line: 682
	 call i1382 := int$javaUtilEx.Collection$size$2241((r1380));
	 goto Block597;
	 //  @line: 683
Block597:
	 goto Block600, Block598;
	 //  @line: 683
Block600:
	 //  @line: 683
	 assume ($negInt(($neint((i1382), (0))))==1);
	 //  @line: 684
	__ret := 0;
	 return;
	 //  @line: 683
Block598:
	 assume ($neint((i1382), (0))==1);
	 goto Block599;
	 //  @line: 686
Block599:
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 686
	 call $caughtEx4 := void$javaUtilEx.SubList$checkForComodification$2564((r0378));
	 goto Block601, Block603;
	 //  @line: 686
Block601:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block602;
	 //  @line: 686
Block603:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block604;
	 //  @line: 686
Block602:
	$Exep1 := $caughtEx4;
	 return;
	 //  @line: 686
Block604:
	 goto Block605;
	 //  @line: 687
Block605:
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 687
	$r2385 := $HeapVar[r0378, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 687
	$i2383 := $HeapVar[r0378, int$javaUtilEx.SubList$offset0];
	 //  @line: 687
	$i3384 := $addint(($i2383), (i0379));
	 assert ($neref(($r2385), ($null))==1);
	 //  @line: 687
	 call $freshlocal6, $caughtEx5, $caughtEx3 := boolean$javaUtilEx.AbstractList$addAll$2492(($r2385), ($i3384), (r1380));
	 goto Block606, Block608;
	 //  @line: 687
Block606:
	 assume ($neref(($caughtEx5), ($null))==1);
	 goto Block607;
	 //  @line: 687
Block608:
	 assume ($eqref(($caughtEx5), ($null))==1);
	 goto Block609;
	 //  @line: 687
Block607:
	$Exep2 := $caughtEx5;
	 return;
	 //  @line: 687
Block609:
	 goto Block612, Block610;
	 //  @line: 687
Block612:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block613;
	 //  @line: 687
Block610:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block611;
	 //  @line: 687
Block613:
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 688
	$r3387 := $HeapVar[r0378, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r3387), ($null))==1);
	 //  @line: 688
	$i4388 := $HeapVar[$r3387, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 688
	$HeapVar[r0378, int$javaUtilEx.AbstractList$modCount0] := $i4388;
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 689
	$i5389 := $HeapVar[r0378, int$javaUtilEx.SubList$size0];
	 //  @line: 689
	$i6390 := $addint(($i5389), (i1382));
	 assert ($neref((r0378), ($null))==1);
	 //  @line: 689
	$HeapVar[r0378, int$javaUtilEx.SubList$size0] := $i6390;
	 //  @line: 690
	__ret := 1;
	 return;
	 //  @line: 687
Block611:
	$Exep0 := $caughtEx3;
	 return;
}


	 //  @line: 385
// <javaUtilEx.AbstractList$Itr: void checkForComodification()>
procedure void$javaUtilEx.AbstractList$Itr$checkForComodification$2538(__this : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i0255 : int;
var $i1256 : int;
var r0253 : ref;
var $r2257 : ref;
var $r1254 : ref;

 //temp local variables 

	 //  @line: 385
Block354:
	$Exep0 := $null;
	 goto Block396;
Block396:
	r0253 := __this;
	 assert ($neref((r0253), ($null))==1);
	 //  @line: 386
	$r1254 := $HeapVar[r0253, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref(($r1254), ($null))==1);
	 //  @line: 386
	$i1256 := $HeapVar[$r1254, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0253), ($null))==1);
	 //  @line: 386
	$i0255 := $HeapVar[r0253, int$javaUtilEx.AbstractList$Itr$expectedModCount0];
	 goto Block397;
	 //  @line: 386
Block397:
	 goto Block400, Block398;
	 //  @line: 386
Block400:
	 //  @line: 386
	 assume ($negInt(($eqint(($i1256), ($i0255))))==1);
	 //  @line: 387
	$r2257 := $newvariable((401));
	 assume ($neref(($newvariable((401))), ($null))==1);
	 assert ($neref(($r2257), ($null))==1);
	 //  @line: 387
	 call void$javaUtilEx.ConcurrentModificationException$$la$init$ra$$2570(($r2257));
	 goto Block402;
	 //  @line: 386
Block398:
	 assume ($eqint(($i1256), ($i0255))==1);
	 goto Block399;
	 //  @line: 386
Block402:
	$Exep0 := $r2257;
	 return;
	 //  @line: 388
Block399:
	 return;
}


	 //  @line: 299
// <javaUtilEx.AbstractList: javaUtilEx.ListIterator listIterator()>
procedure javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2494(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1159 : ref;
var r0158 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 299
Block159:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block232;
Block232:
	r0158 := __this;
	 assert ($neref((r0158), ($null))==1);
	 //  @line: 300
	 call $r1159, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2495((r0158), (0));
	 goto Block233, Block235;
Block233:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block234;
Block235:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block236;
Block234:
	$Exep0 := $caughtEx1;
	 return;
Block236:
	 //  @line: 300
	__ret := $r1159;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $cmpint(x : int, y : int) returns (__ret : int) {
if (x < y) then 1 else if (x == y) then 0 else -1
}


	 //  @line: 32
// <javaUtilEx.Content: boolean equals(java.lang.Object)>
procedure boolean$javaUtilEx.Content$equals$2588(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r1500 : ref;
var $z0501 : int;
var $r2503 : ref;
var $i1505 : int;
var r0502 : ref;
var $i0504 : int;
var $z1507 : int;
Block739:
	r0502 := __this;
	r1500 := $param_0;
	 //  @line: 33
	$z0501 := $instanceof((r1500), (javaUtilEx.Content));
	 goto Block740;
	 //  @line: 33
Block740:
	 goto Block741, Block743;
	 //  @line: 33
Block741:
	 assume ($eqint(($z0501), (0))==1);
	 goto Block742;
	 //  @line: 33
Block743:
	 //  @line: 33
	 assume ($negInt(($eqint(($z0501), (0))))==1);
	 assert ($neref((r0502), ($null))==1);
	 //  @line: 34
	$i1505 := $HeapVar[r0502, int$javaUtilEx.Content$val0];
	 //  @line: 34
	$r2503 := r1500;
	 assert ($neref(($r2503), ($null))==1);
	 //  @line: 34
	$i0504 := $HeapVar[$r2503, int$javaUtilEx.Content$val0];
	 goto Block744;
	 //  @line: 36
Block742:
	 //  @line: 36
	__ret := 0;
	 return;
	 //  @line: 34
Block744:
	 goto Block747, Block745;
	 //  @line: 34
Block747:
	 //  @line: 34
	 assume ($negInt(($neint(($i1505), ($i0504))))==1);
	 //  @line: 34
	$z1507 := 1;
	 goto Block748;
	 //  @line: 34
Block745:
	 assume ($neint(($i1505), ($i0504))==1);
	 goto Block746;
	 //  @line: 34
Block748:
	 //  @line: 34
	__ret := $z1507;
	 return;
	 //  @line: 34
Block746:
	 //  @line: 34
	$z1507 := 0;
	 goto Block748;
}


// procedure is generated by joogie.
function {:inline true} $subint(x : int, y : int) returns (__ret : int) {
(x - y)
}


// procedure is generated by joogie.
function {:inline true} $neref(x : ref, y : ref) returns (__ret : int) {
if (x != y) then 1 else 0
}


	 //  @line: 777
// <javaUtilEx.RandomAccessSubList: void <init>(javaUtilEx.AbstractList,int,int)>
procedure void$javaUtilEx.RandomAccessSubList$$la$init$ra$$2540(__this : ref, $param_0 : ref, $param_1 : int, $param_2 : int) returns ($Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1262 : ref;
var i0263 : int;
var i1264 : int;
var r0261 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 777
Block244:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block404;
Block404:
	r0261 := __this;
	r1262 := $param_0;
	i0263 := $param_1;
	i1264 := $param_2;
	 assert ($neref((r0261), ($null))==1);
	 //  @line: 778
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.SubList$$la$init$ra$$2549((r0261), (r1262), (i0263), (i1264));
	 goto Block407, Block405;
Block407:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block408;
Block405:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block406;
Block408:
	 goto Block411, Block409;
Block406:
	$Exep0 := $caughtEx2;
	 return;
Block411:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block412;
Block409:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block410;
Block412:
	 return;
Block410:
	$Exep1 := $caughtEx3;
	 return;
}


	 //  @line: 177
// <javaUtilEx.AbstractList: int indexOf(java.lang.Object)>
procedure int$javaUtilEx.AbstractList$indexOf$2489(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $z0123 : int;
var $i1129 : int;
var r1122 : ref;
var $z2127 : int;
var $r4128 : ref;
var r2121 : ref;
var $i0126 : int;
var r0119 : ref;
var $r3124 : ref;
var $z1125 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 177
Block160:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block161;
Block161:
	r0119 := __this;
	r1122 := $param_0;
	 assert ($neref((r0119), ($null))==1);
	 //  @line: 178
	 call r2121, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2494((r0119));
	 goto Block162, Block164;
Block162:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block163;
Block164:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block165;
Block163:
	$Exep0 := $caughtEx1;
	 return;
Block165:
	 goto Block166;
	 //  @line: 179
Block166:
	 goto Block167, Block169;
	 //  @line: 179
Block167:
	 assume ($neref((r1122), ($null))==1);
	 goto Block168;
	 //  @line: 179
Block169:
	 //  @line: 179
	 assume ($negInt(($neref((r1122), ($null))))==1);
	 goto Block170;
	 //  @line: 184
Block168:
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 184
	 call $z0123 := boolean$javaUtilEx.ListIterator$hasNext$2525((r2121));
	 goto Block178;
	 //  @line: 180
Block170:
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 180
	 call $z2127 := boolean$javaUtilEx.ListIterator$hasNext$2525((r2121));
	 goto Block171;
	 //  @line: 184
Block178:
	 goto Block179, Block180;
	 //  @line: 180
Block171:
	 goto Block172, Block174;
	 //  @line: 184
Block179:
	 assume ($eqint(($z0123), (0))==1);
	 goto Block173;
	 //  @line: 184
Block180:
	 //  @line: 184
	 assume ($negInt(($eqint(($z0123), (0))))==1);
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 185
	 call $r3124 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r2121));
	 assert ($neref((r1122), ($null))==1);
	 //  @line: 185
	 call $z1125 := boolean$java.lang.Object$equals$32((r1122), ($r3124));
	 goto Block181;
	 //  @line: 180
Block172:
	 assume ($eqint(($z2127), (0))==1);
	 goto Block173;
	 //  @line: 180
Block174:
	 //  @line: 180
	 assume ($negInt(($eqint(($z2127), (0))))==1);
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 181
	 call $r4128 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r2121));
	 goto Block175;
	 //  @line: 188
Block173:
	 //  @line: 188
	__ret := -1;
	 return;
	 //  @line: 185
Block181:
	 goto Block182, Block183;
	 //  @line: 181
Block175:
	 goto Block177, Block176;
	 //  @line: 185
Block182:
	 assume ($eqint(($z1125), (0))==1);
	 goto Block168;
	 //  @line: 185
Block183:
	 //  @line: 185
	 assume ($negInt(($eqint(($z1125), (0))))==1);
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 186
	 call $i0126 := int$javaUtilEx.ListIterator$previousIndex$2530((r2121));
	 //  @line: 186
	__ret := $i0126;
	 return;
	 //  @line: 181
Block177:
	 //  @line: 181
	 assume ($negInt(($neref(($r4128), ($null))))==1);
	 assert ($neref((r2121), ($null))==1);
	 //  @line: 182
	 call $i1129 := int$javaUtilEx.ListIterator$previousIndex$2530((r2121));
	 //  @line: 182
	__ret := $i1129;
	 return;
	 //  @line: 181
Block176:
	 assume ($neref(($r4128), ($null))==1);
	 goto Block170;
}


// procedure is generated by joogie.
function {:inline true} $modint($param00 : int, $param11 : int) returns (__ret : int);



// <java.lang.Object: void <init>()>
procedure void$java.lang.Object$$la$init$ra$$28(__this : ref);



	 //  @line: 574
// <javaUtilEx.LinkedList: boolean removeFirstOccurrence(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$removeFirstOccurrence$2662(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1697 : ref;
var r0696 : ref;
var $z0698 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 574
Block1057:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1058;
Block1058:
	r0696 := __this;
	r1697 := $param_0;
	 assert ($neref((r0696), ($null))==1);
	 //  @line: 575
	 call $z0698, $caughtEx1 := boolean$javaUtilEx.LinkedList$remove$2640((r0696), (r1697));
	 goto Block1061, Block1059;
Block1061:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1062;
Block1059:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1060;
Block1062:
	 //  @line: 575
	__ret := $z0698;
	 return;
Block1060:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 763
// <javaUtilEx.LinkedList: javaUtilEx.Iterator descendingIterator()>
procedure javaUtilEx.Iterator$javaUtilEx.LinkedList$descendingIterator$2667(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0743 : ref;
var $r1742 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 763
Block1118:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1119;
Block1119:
	r0743 := __this;
	 //  @line: 764
	$r1742 := $newvariable((1120));
	 assume ($neref(($newvariable((1120))), ($null))==1);
	 assert ($neref(($r1742), ($null))==1);
	 //  @line: 764
	 call $caughtEx1 := void$javaUtilEx.LinkedList$DescendingIterator$$la$init$ra$$2692(($r1742), (r0743), ($null));
	 goto Block1121, Block1123;
Block1121:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1122;
Block1123:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1124;
Block1122:
	$Exep0 := $caughtEx1;
	 return;
Block1124:
	 //  @line: 764
	__ret := $r1742;
	 return;
}


	 //  @line: 434
// <javaUtilEx.AbstractList$ListItr: void add(java.lang.Object)>
procedure void$javaUtilEx.AbstractList$ListItr$add$2548(__this : ref, $param_0 : ref) returns ($Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r4310 : ref;
var $r5311 : ref;
var i2312 : int;
var $r2306 : ref;
var r0303 : ref;
var $r3308 : ref;
var $i1309 : int;
var r1305 : ref;
var $i0307 : int;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;
var $caughtEx4 : ref;

	 //  @line: 434
Block470:
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block471;
Block471:
	r0303 := __this;
	r1305 := $param_0;
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 435
	 call $caughtEx2 := void$javaUtilEx.AbstractList$Itr$checkForComodification$2538((r0303));
	 goto Block472, Block474;
Block472:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block473;
Block474:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block475;
Block473:
	$Exep0 := $caughtEx2;
	 return;
Block475:
	 goto Block476;
	 //  @line: 438
Block476:
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 438
	i2312 := $HeapVar[r0303, int$javaUtilEx.AbstractList$Itr$cursor0];
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 439
	$r2306 := $HeapVar[r0303, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296];
	 assert ($neref(($r2306), ($null))==1);
	 //  @line: 439
	 call $caughtEx3 := void$javaUtilEx.AbstractList$add$2487(($r2306), (i2312), (r1305));
	 goto Block479, Block477;
	 //  @line: 438
Block479:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block480;
	 //  @line: 438
Block477:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block478;
	 //  @line: 438
Block480:
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 440
	$HeapVar[r0303, int$javaUtilEx.AbstractList$Itr$lastRet0] := -1;
	 //  @line: 441
	$i0307 := $addint((i2312), (1));
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 441
	$HeapVar[r0303, int$javaUtilEx.AbstractList$Itr$cursor0] := $i0307;
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 442
	$r3308 := $HeapVar[r0303, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296];
	 assert ($neref(($r3308), ($null))==1);
	 //  @line: 442
	$i1309 := $HeapVar[$r3308, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0303), ($null))==1);
	 //  @line: 442
	$HeapVar[r0303, int$javaUtilEx.AbstractList$Itr$expectedModCount0] := $i1309;
	 goto Block481;
	 //  @line: 438
Block478:
	$Exep1 := $caughtEx3;
	 return;
	 //  @line: 445
Block481:
	 goto Block482;
	 //  @line: 446
Block482:
	 return;
}


// procedure is generated by joogie.
function {:inline true} $eqrealarray($param00 : [int]realVar, $param11 : [int]realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $shrint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ushrint($param00 : int, $param11 : int) returns (__ret : int);



	 //  @line: 616
// <javaUtilEx.SubList: int access$210(javaUtilEx.SubList)>
procedure int$javaUtilEx.SubList$access$210$2568($param_0 : ref) returns (__ret : int)
  modifies $HeapVar;
 {
var $i1425 : int;
var r0423 : ref;
var $i0424 : int;
Block680:
	r0423 := $param_0;
	 assert ($neref((r0423), ($null))==1);
	 //  @line: 617
	$i0424 := $HeapVar[r0423, int$javaUtilEx.SubList$size0];
	 //  @line: 617
	$i1425 := $subint(($i0424), (1));
	 assert ($neref((r0423), ($null))==1);
	 //  @line: 617
	$HeapVar[r0423, int$javaUtilEx.SubList$size0] := $i1425;
	 //  @line: 617
	__ret := $i0424;
	 return;
}


	 //  @line: 729
// <javaUtilEx.LinkedList$Entry: void <init>(java.lang.Object,javaUtilEx.LinkedList$Entry,javaUtilEx.LinkedList$Entry)>
procedure void$javaUtilEx.LinkedList$Entry$$la$init$ra$$2676(__this : ref, $param_0 : ref, $param_1 : ref, $param_2 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r3776 : ref;
var r2775 : ref;
var r0773 : ref;
var r1774 : ref;
Block1144:
	r0773 := __this;
	r1774 := $param_0;
	r2775 := $param_1;
	r3776 := $param_2;
	 assert ($neref((r0773), ($null))==1);
	 //  @line: 730
	 call void$java.lang.Object$$la$init$ra$$28((r0773));
	 assert ($neref((r0773), ($null))==1);
	 //  @line: 731
	$HeapVar[r0773, java.lang.Object$javaUtilEx.LinkedList$Entry$element300] := r1774;
	 assert ($neref((r0773), ($null))==1);
	 //  @line: 732
	$HeapVar[r0773, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := r2775;
	 assert ($neref((r0773), ($null))==1);
	 //  @line: 733
	$HeapVar[r0773, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := r3776;
	 return;
}


	 //  @line: 684
// <javaUtilEx.LinkedList$ListItr: int previousIndex()>
procedure int$javaUtilEx.LinkedList$ListItr$previousIndex$2683(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0835 : ref;
var $i0836 : int;
var $i1837 : int;
Block1211:
	r0835 := __this;
	 assert ($neref((r0835), ($null))==1);
	 //  @line: 685
	$i0836 := $HeapVar[r0835, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 685
	$i1837 := $subint(($i0836), (1));
	 //  @line: 685
	__ret := $i1837;
	 return;
}


	 //  @line: 238
// <javaUtilEx.AbstractCollection: boolean removeAll(javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractCollection$removeAll$2237(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r246 : ref;
var r148 : ref;
var $z150 : int;
var r044 : ref;
var z251 : int;
var $r349 : ref;
var $z047 : int;
Block88:
	r044 := __this;
	r148 := $param_0;
	 //  @line: 239
	z251 := 0;
	 assert ($neref((r044), ($null))==1);
	 //  @line: 240
	 call r246 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r044));
	 goto Block89;
	 //  @line: 241
Block89:
	 assert ($neref((r246), ($null))==1);
	 //  @line: 241
	 call $z047 := boolean$javaUtilEx.Iterator$hasNext$2254((r246));
	 goto Block90;
	 //  @line: 241
Block90:
	 goto Block93, Block91;
	 //  @line: 241
Block93:
	 //  @line: 241
	 assume ($negInt(($eqint(($z047), (0))))==1);
	 assert ($neref((r246), ($null))==1);
	 //  @line: 242
	 call $r349 := java.lang.Object$javaUtilEx.Iterator$next$2255((r246));
	 assert ($neref((r148), ($null))==1);
	 //  @line: 242
	 call $z150 := boolean$javaUtilEx.Collection$contains$2243((r148), ($r349));
	 goto Block94;
	 //  @line: 241
Block91:
	 assume ($eqint(($z047), (0))==1);
	 goto Block92;
	 //  @line: 242
Block94:
	 goto Block96, Block95;
	 //  @line: 247
Block92:
	 //  @line: 247
	__ret := z251;
	 return;
	 //  @line: 242
Block96:
	 //  @line: 242
	 assume ($negInt(($eqint(($z150), (0))))==1);
	 assert ($neref((r246), ($null))==1);
	 //  @line: 243
	 call void$javaUtilEx.Iterator$remove$2256((r246));
	 //  @line: 244
	z251 := 1;
	 goto Block89;
	 //  @line: 242
Block95:
	 assume ($eqint(($z150), (0))==1);
	 goto Block89;
}


	 //  @line: 90
// <javaUtilEx.LinkedList: javaUtilEx.LinkedList$Entry access$300(javaUtilEx.LinkedList,java.lang.Object,javaUtilEx.LinkedList$Entry)>
procedure javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$300$2672($param_0 : ref, $param_1 : ref, $param_2 : ref) returns (__ret : ref) {
var r0762 : ref;
var r1763 : ref;
var $r3765 : ref;
var r2764 : ref;
Block1140:
	r0762 := $param_0;
	r1763 := $param_1;
	r2764 := $param_2;
	 assert ($neref((r0762), ($null))==1);
	 //  @line: 91
	 call $r3765 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665((r0762), (r1763), (r2764));
	 //  @line: 91
	__ret := $r3765;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $gtint(x : int, y : int) returns (__ret : int) {
if (x > y) then 1 else 0
}


	 //  @line: 7
// <javaUtilEx.Random: int random()>
procedure int$javaUtilEx.Random$random$2674() returns (__ret : int)
  modifies $stringSize, int$javaUtilEx.Random$index0;
 {
var $i2771 : int;
var $i0767 : int;
var $i1770 : int;
var $r1768 : [int]ref;
var $i3772 : int;
var r0769 : ref;
	 //  @line: 8
Block1142:
	 //  @line: 8
	$r1768 := java.lang.String$lp$$rp$$javaUtilEx.Random$args299;
	 //  @line: 8
	$i0767 := int$javaUtilEx.Random$index0;
	 assert ($geint(($i0767), (0))==1);
	 assert ($ltint(($i0767), ($refArrSize[$r1768[$arrSizeIdx]]))==1);
	 //  @line: 8
	r0769 := $r1768[$i0767];
	 //  @line: 9
	$i1770 := int$javaUtilEx.Random$index0;
	 //  @line: 9
	$i2771 := $addint(($i1770), (1));
	 //  @line: 9
	int$javaUtilEx.Random$index0 := $i2771;
	$i3772 := $stringSize[r0769];
	 //  @line: 10
	__ret := $i3772;
	 return;
}


	 //  @line: 43
// <javaUtilEx.IllegalStateException: void <init>()>
procedure void$javaUtilEx.IllegalStateException$$la$init$ra$$2574(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0435 : ref;
Block686:
	r0435 := __this;
	 assert ($neref((r0435), ($null))==1);
	 //  @line: 44
	 call void$java.lang.RuntimeException$$la$init$ra$$760((r0435));
	 return;
}


	 //  @line: 700
// <javaUtilEx.SubList$1: void <init>(javaUtilEx.SubList,int)>
procedure void$javaUtilEx.SubList$1$$la$init$ra$$2693(__this : ref, $param_0 : ref, $param_1 : int) returns ($Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1896 : ref;
var $i3903 : int;
var $i2902 : int;
var $r3899 : ref;
var r0895 : ref;
var $i1901 : int;
var $r4900 : ref;
var $r5904 : ref;
var i0897 : int;
var $r2898 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 700
Block621:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1293;
Block1293:
	r0895 := __this;
	r1896 := $param_0;
	i0897 := $param_1;
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 701
	$HeapVar[r0895, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309] := r1896;
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 701
	$HeapVar[r0895, int$javaUtilEx.SubList$1$val$index0] := i0897;
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 701
	 call void$java.lang.Object$$la$init$ra$$28((r0895));
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 702
	$r2898 := $HeapVar[r0895, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 702
	 call $r3899 := javaUtilEx.AbstractList$javaUtilEx.SubList$access$100$2566(($r2898));
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 702
	$i1901 := $HeapVar[r0895, int$javaUtilEx.SubList$1$val$index0];
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 702
	$r4900 := $HeapVar[r0895, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 702
	 call $i2902 := int$javaUtilEx.SubList$access$000$2565(($r4900));
	 //  @line: 702
	$i3903 := $addint(($i1901), ($i2902));
	 assert ($neref(($r3899), ($null))==1);
	 //  @line: 702
	 call $r5904, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2495(($r3899), ($i3903));
	 goto Block1294, Block1296;
Block1294:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1295;
Block1296:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1297;
Block1295:
	$Exep0 := $caughtEx1;
	 return;
Block1297:
	 assert ($neref((r0895), ($null))==1);
	 //  @line: 702
	$HeapVar[r0895, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308] := $r5904;
	 return;
}


	 //  @line: 561
// <javaUtilEx.LinkedList: java.lang.Object pop()>
procedure java.lang.Object$javaUtilEx.LinkedList$pop$2661(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1695 : ref;
var r0694 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 561
Block1051:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1052;
Block1052:
	r0694 := __this;
	 assert ($neref((r0694), ($null))==1);
	 //  @line: 562
	 call $r1695, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$removeFirst$2633((r0694));
	 goto Block1053, Block1055;
Block1053:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1054;
Block1055:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1056;
Block1054:
	$Exep0 := $caughtEx1;
	 return;
Block1056:
	 //  @line: 562
	__ret := $r1695;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $eqreal(x : realVar, y : realVar) returns (__ret : int) {
if (x == y) then 1 else 0
}


	 //  @line: 65
// <javaUtilEx.AbstractCollection: void <init>()>
procedure void$javaUtilEx.AbstractCollection$$la$init$ra$$2228(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r01 : ref;
Block16:
	r01 := __this;
	 assert ($neref((r01), ($null))==1);
	 //  @line: 66
	 call void$java.lang.Object$$la$init$ra$$28((r01));
	 return;
}


	 //  @line: 616
// <javaUtilEx.SubList: int access$200(javaUtilEx.SubList)>
procedure int$javaUtilEx.SubList$access$200$2567($param_0 : ref) returns (__ret : int) {
var $i0422 : int;
var r0421 : ref;
Block679:
	r0421 := $param_0;
	 assert ($neref((r0421), ($null))==1);
	 //  @line: 617
	$i0422 := $HeapVar[r0421, int$javaUtilEx.SubList$size0];
	 //  @line: 617
	__ret := $i0422;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $divint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $leint(x : int, y : int) returns (__ret : int) {
if (x <= y) then 1 else 0
}


	 //  @line: 160
// <javaUtilEx.AbstractList: java.lang.Object remove(int)>
procedure java.lang.Object$javaUtilEx.AbstractList$remove$2488(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1116 : ref;
var i0118 : int;
var r0117 : ref;

 //temp local variables 

	 //  @line: 160
Block153:
	$Exep0 := $null;
	 goto Block154;
Block154:
	r0117 := __this;
	i0118 := $param_0;
	 //  @line: 161
	$r1116 := $newvariable((155));
	 assume ($neref(($newvariable((155))), ($null))==1);
	 assert ($neref(($r1116), ($null))==1);
	 //  @line: 161
	 call void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2257(($r1116));
	 goto Block156;
Block156:
	$Exep0 := $r1116;
	 return;
}


	 //  @line: 740
// <javaUtilEx.SubList$1: void set(java.lang.Object)>
procedure void$javaUtilEx.SubList$1$set$2701(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0945 : ref;
var r1946 : ref;
var $r2947 : ref;
Block1331:
	r0945 := __this;
	r1946 := $param_0;
	 assert ($neref((r0945), ($null))==1);
	 //  @line: 741
	$r2947 := $HeapVar[r0945, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r2947), ($null))==1);
	 //  @line: 741
	 call void$javaUtilEx.ListIterator$set$2532(($r2947), (r1946));
	 return;
}


	 //  @line: 697
// <javaUtilEx.SubList: javaUtilEx.ListIterator listIterator(int)>
procedure javaUtilEx.ListIterator$javaUtilEx.SubList$listIterator$2559(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var i0394 : int;
var $r1395 : ref;
var r0393 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 697
Block620:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block622;
Block622:
	r0393 := __this;
	i0394 := $param_0;
	 assert ($neref((r0393), ($null))==1);
	 //  @line: 698
	 call $caughtEx2 := void$javaUtilEx.SubList$checkForComodification$2564((r0393));
	 goto Block623, Block625;
Block623:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block624;
Block625:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block626;
Block624:
	$Exep0 := $caughtEx2;
	 return;
Block626:
	 assert ($neref((r0393), ($null))==1);
	 //  @line: 699
	 call $caughtEx3 := void$javaUtilEx.SubList$rangeCheckForAdd$2562((r0393), (i0394));
	 goto Block629, Block627;
Block629:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block630;
Block627:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block628;
Block630:
	 //  @line: 701
	$r1395 := $newvariable((631));
	 assume ($neref(($newvariable((631))), ($null))==1);
	 assert ($neref(($r1395), ($null))==1);
	 //  @line: 701
	 call $caughtEx3 := void$javaUtilEx.SubList$1$$la$init$ra$$2693(($r1395), (r0393), (i0394));
	 goto Block632, Block634;
Block628:
	$Exep1 := $caughtEx3;
	 return;
Block632:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block633;
Block634:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block635;
Block633:
	$Exep1 := $caughtEx3;
	 return;
Block635:
	 //  @line: 701
	__ret := $r1395;
	 return;
}


	 //  @line: 704
// <javaUtilEx.LinkedList$ListItr: void set(java.lang.Object)>
procedure void$javaUtilEx.LinkedList$ListItr$set$2685(__this : ref, $param_0 : ref) returns ($Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r6861 : ref;
var $r3857 : ref;
var $r5860 : ref;
var $r2856 : ref;
var $r4858 : ref;
var r1859 : ref;
var r0855 : ref;

 //temp local variables 
var $caughtEx2 : ref;

	 //  @line: 704
Block1235:
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1236;
Block1236:
	r0855 := __this;
	r1859 := $param_0;
	 assert ($neref((r0855), ($null))==1);
	 //  @line: 705
	$r3857 := $HeapVar[r0855, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 assert ($neref((r0855), ($null))==1);
	 //  @line: 705
	$r2856 := $HeapVar[r0855, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 705
	 call $r4858 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669(($r2856));
	 goto Block1237;
	 //  @line: 705
Block1237:
	 goto Block1240, Block1238;
	 //  @line: 705
Block1240:
	 //  @line: 705
	 assume ($negInt(($neref(($r3857), ($r4858))))==1);
	 //  @line: 706
	$r6861 := $newvariable((1241));
	 assume ($neref(($newvariable((1241))), ($null))==1);
	 assert ($neref(($r6861), ($null))==1);
	 //  @line: 706
	 call void$javaUtilEx.IllegalStateException$$la$init$ra$$2574(($r6861));
	 goto Block1242;
	 //  @line: 705
Block1238:
	 assume ($neref(($r3857), ($r4858))==1);
	 goto Block1239;
	 //  @line: 705
Block1242:
	$Exep0 := $r6861;
	 return;
	 //  @line: 707
Block1239:
	 assert ($neref((r0855), ($null))==1);
	 //  @line: 707
	 call $caughtEx2 := void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687((r0855));
	 goto Block1243, Block1245;
	 //  @line: 707
Block1243:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1244;
	 //  @line: 707
Block1245:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1246;
	 //  @line: 707
Block1244:
	$Exep1 := $caughtEx2;
	 return;
	 //  @line: 707
Block1246:
	 goto Block1247;
	 //  @line: 708
Block1247:
	 assert ($neref((r0855), ($null))==1);
	 //  @line: 708
	$r5860 := $HeapVar[r0855, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 assert ($neref(($r5860), ($null))==1);
	 //  @line: 708
	$HeapVar[$r5860, java.lang.Object$javaUtilEx.LinkedList$Entry$element300] := r1859;
	 return;
}


	 //  @line: 73
// <javaUtilEx.ConcurrentModificationException: void <init>()>
procedure void$javaUtilEx.ConcurrentModificationException$$la$init$ra$$2570(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0429 : ref;
Block682:
	r0429 := __this;
	 assert ($neref((r0429), ($null))==1);
	 //  @line: 74
	 call void$java.lang.RuntimeException$$la$init$ra$$760((r0429));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $shrreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// <javaUtilEx.ListIterator: boolean hasNext()>
procedure boolean$javaUtilEx.ListIterator$hasNext$2525(__this : ref) returns (__ret : int);



	 //  @line: 2
// <javaUtilEx.Random: void <init>()>
procedure void$javaUtilEx.Random$$la$init$ra$$2673(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0766 : ref;
Block1141:
	r0766 := __this;
	 assert ($neref((r0766), ($null))==1);
	 //  @line: 3
	 call void$java.lang.Object$$la$init$ra$$28((r0766));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $orint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $reftorealarr($param00 : ref) returns (__ret : [int]realVar);



	 //  @line: 126
// <javaUtilEx.AbstractCollection: boolean add(java.lang.Object)>
procedure boolean$javaUtilEx.AbstractCollection$add$2233(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r016 : ref;
var $r215 : ref;
var r117 : ref;

 //temp local variables 

	 //  @line: 126
Block42:
	$Exep0 := $null;
	 goto Block43;
Block43:
	r016 := __this;
	r117 := $param_0;
	 //  @line: 127
	$r215 := $newvariable((44));
	 assume ($neref(($newvariable((44))), ($null))==1);
	 assert ($neref(($r215), ($null))==1);
	 //  @line: 127
	 call void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2257(($r215));
	 goto Block45;
Block45:
	$Exep0 := $r215;
	 return;
}


	 //  @line: 752
// <javaUtilEx.SubList: javaUtilEx.List subList(int,int)>
procedure javaUtilEx.List$javaUtilEx.SubList$subList$2560(__this : ref, $param_0 : int, $param_1 : int) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var i0398 : int;
var r0397 : ref;
var i1399 : int;
var $r1396 : ref;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 752
Block636:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block637;
Block637:
	r0397 := __this;
	i0398 := $param_0;
	i1399 := $param_1;
	 //  @line: 753
	$r1396 := $newvariable((638));
	 assume ($neref(($newvariable((638))), ($null))==1);
	 assert ($neref(($r1396), ($null))==1);
	 //  @line: 753
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.SubList$$la$init$ra$$2549(($r1396), (r0397), (i0398), (i1399));
	 goto Block639, Block641;
Block639:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block640;
Block641:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block642;
Block640:
	$Exep0 := $caughtEx2;
	 return;
Block642:
	 goto Block645, Block643;
Block645:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block646;
Block643:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block644;
Block646:
	 //  @line: 753
	__ret := $r1396;
	 return;
Block644:
	$Exep1 := $caughtEx3;
	 return;
}


// <java.lang.StringBuilder: void <init>()>
procedure void$java.lang.StringBuilder$$la$init$ra$$2261(__this : ref);



// procedure is generated by joogie.
function {:inline true} $orreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $ushrref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 55
// <javaUtilEx.NoSuchElementException: void <init>(java.lang.String)>
procedure void$javaUtilEx.NoSuchElementException$$la$init$ra$$2573(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1434 : ref;
var r0433 : ref;
Block685:
	r0433 := __this;
	r1434 := $param_0;
	 assert ($neref((r0433), ($null))==1);
	 //  @line: 56
	 call void$java.lang.RuntimeException$$la$init$ra$$761((r0433), (r1434));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $modref($param00 : ref, $param11 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $nereal(x : realVar, y : realVar) returns (__ret : int) {
if (x != y) then 1 else 0
}


	 //  @line: 355
// <javaUtilEx.AbstractList$Itr: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.AbstractList$Itr$next$2536(__this : ref) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r2230 : ref;
var r0228 : ref;
var i1236 : int;
var r1232 : ref;
var $i0233 : int;
var $r4235 : ref;
var $r3234 : ref;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 355
Block355:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block356;
Block356:
	r0228 := __this;
	 assert ($neref((r0228), ($null))==1);
	 //  @line: 356
	 call $caughtEx2 := void$javaUtilEx.AbstractList$Itr$checkForComodification$2538((r0228));
	 goto Block357, Block359;
Block357:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block358;
Block359:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block360;
Block358:
	$Exep0 := $caughtEx2;
	 return;
Block360:
	 goto Block361;
	 //  @line: 358
Block361:
	 assert ($neref((r0228), ($null))==1);
	 //  @line: 358
	i1236 := $HeapVar[r0228, int$javaUtilEx.AbstractList$Itr$cursor0];
	 assert ($neref((r0228), ($null))==1);
	 //  @line: 359
	$r2230 := $HeapVar[r0228, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref(($r2230), ($null))==1);
	 //  @line: 359
	 call r1232 := java.lang.Object$javaUtilEx.AbstractList$get$2485(($r2230), (i1236));
	 assert ($neref((r0228), ($null))==1);
	 //  @line: 360
	$HeapVar[r0228, int$javaUtilEx.AbstractList$Itr$lastRet0] := i1236;
	 //  @line: 361
	$i0233 := $addint((i1236), (1));
	 assert ($neref((r0228), ($null))==1);
	 //  @line: 361
	$HeapVar[r0228, int$javaUtilEx.AbstractList$Itr$cursor0] := $i0233;
	 goto Block362;
	 //  @line: 362
Block362:
	 //  @line: 362
	__ret := r1232;
	 return;
}


// <javaUtilEx.ListIterator: void set(java.lang.Object)>
procedure void$javaUtilEx.ListIterator$set$2532(__this : ref, $param_0 : ref);



	 //  @line: 476
// <javaUtilEx.LinkedList: boolean offerLast(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$offerLast$2655(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r1679 : ref;
var r0678 : ref;
Block1005:
	r0678 := __this;
	r1679 := $param_0;
	 assert ($neref((r0678), ($null))==1);
	 //  @line: 477
	 call void$javaUtilEx.LinkedList$addLast$2636((r0678), (r1679));
	 //  @line: 478
	__ret := 1;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $orref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $shlreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 89
// <javaUtilEx.UnsupportedOperationException: void <init>(java.lang.Throwable)>
procedure void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2260(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0102 : ref;
var r1103 : ref;
Block137:
	r0102 := __this;
	r1103 := $param_0;
	 assert ($neref((r0102), ($null))==1);
	 //  @line: 90
	 call void$java.lang.RuntimeException$$la$init$ra$$763((r0102), (r1103));
	 return;
}


	 //  @line: 693
// <javaUtilEx.SubList: javaUtilEx.Iterator iterator()>
procedure javaUtilEx.Iterator$javaUtilEx.SubList$iterator$2558(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1392 : ref;
var r0391 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 693
Block614:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block615;
Block615:
	r0391 := __this;
	 assert ($neref((r0391), ($null))==1);
	 //  @line: 694
	 call $r1392, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2494((r0391));
	 goto Block618, Block616;
Block618:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block619;
Block616:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block617;
Block619:
	 //  @line: 694
	__ret := $r1392;
	 return;
Block617:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 202
// <javaUtilEx.AbstractList: int lastIndexOf(java.lang.Object)>
procedure int$javaUtilEx.AbstractList$lastIndexOf$2490(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i0131 : int;
var r0130 : ref;
var $z1137 : int;
var r2133 : ref;
var $i2141 : int;
var $i1138 : int;
var $r4140 : ref;
var $r3136 : ref;
var $z2139 : int;
var $z0135 : int;
var r1134 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 202
Block184:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block185;
Block185:
	r0130 := __this;
	r1134 := $param_0;
	 assert ($neref((r0130), ($null))==1);
	 //  @line: 203
	 call $i0131 := int$javaUtilEx.AbstractCollection$size$2230((r0130));
	 assert ($neref((r0130), ($null))==1);
	 //  @line: 203
	 call r2133, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2495((r0130), ($i0131));
	 goto Block188, Block186;
Block188:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block189;
Block186:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block187;
Block189:
	 goto Block190;
Block187:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 204
Block190:
	 goto Block193, Block191;
	 //  @line: 204
Block193:
	 //  @line: 204
	 assume ($negInt(($neref((r1134), ($null))))==1);
	 goto Block194;
	 //  @line: 204
Block191:
	 assume ($neref((r1134), ($null))==1);
	 goto Block192;
	 //  @line: 205
Block194:
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 205
	 call $z2139 := boolean$javaUtilEx.ListIterator$hasPrevious$2527((r2133));
	 goto Block195;
	 //  @line: 209
Block192:
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 209
	 call $z0135 := boolean$javaUtilEx.ListIterator$hasPrevious$2527((r2133));
	 goto Block202;
	 //  @line: 205
Block195:
	 goto Block196, Block198;
	 //  @line: 209
Block202:
	 goto Block203, Block204;
	 //  @line: 205
Block196:
	 assume ($eqint(($z2139), (0))==1);
	 goto Block197;
	 //  @line: 205
Block198:
	 //  @line: 205
	 assume ($negInt(($eqint(($z2139), (0))))==1);
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 206
	 call $r4140 := java.lang.Object$javaUtilEx.ListIterator$previous$2528((r2133));
	 goto Block199;
	 //  @line: 209
Block203:
	 assume ($eqint(($z0135), (0))==1);
	 goto Block197;
	 //  @line: 209
Block204:
	 //  @line: 209
	 assume ($negInt(($eqint(($z0135), (0))))==1);
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 210
	 call $r3136 := java.lang.Object$javaUtilEx.ListIterator$previous$2528((r2133));
	 assert ($neref((r1134), ($null))==1);
	 //  @line: 210
	 call $z1137 := boolean$java.lang.Object$equals$32((r1134), ($r3136));
	 goto Block205;
	 //  @line: 213
Block197:
	 //  @line: 213
	__ret := -1;
	 return;
	 //  @line: 206
Block199:
	 goto Block200, Block201;
	 //  @line: 210
Block205:
	 goto Block206, Block207;
	 //  @line: 206
Block200:
	 assume ($neref(($r4140), ($null))==1);
	 goto Block194;
	 //  @line: 206
Block201:
	 //  @line: 206
	 assume ($negInt(($neref(($r4140), ($null))))==1);
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 207
	 call $i2141 := int$javaUtilEx.ListIterator$nextIndex$2529((r2133));
	 //  @line: 207
	__ret := $i2141;
	 return;
	 //  @line: 210
Block206:
	 assume ($eqint(($z1137), (0))==1);
	 goto Block192;
	 //  @line: 210
Block207:
	 //  @line: 210
	 assume ($negInt(($eqint(($z1137), (0))))==1);
	 assert ($neref((r2133), ($null))==1);
	 //  @line: 211
	 call $i1138 := int$javaUtilEx.ListIterator$nextIndex$2529((r2133));
	 //  @line: 211
	__ret := $i1138;
	 return;
}


	 //  @line: 98
// <javaUtilEx.AbstractCollection: boolean contains(java.lang.Object)>
procedure boolean$javaUtilEx.AbstractCollection$contains$2232(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $r414 : ref;
var $z010 : int;
var r06 : ref;
var r19 : ref;
var $r311 : ref;
var r28 : ref;
var $z213 : int;
var $z112 : int;
Block23:
	r06 := __this;
	r19 := $param_0;
	 assert ($neref((r06), ($null))==1);
	 //  @line: 99
	 call r28 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r06));
	 goto Block24;
	 //  @line: 100
Block24:
	 goto Block27, Block25;
	 //  @line: 100
Block27:
	 //  @line: 100
	 assume ($negInt(($neref((r19), ($null))))==1);
	 goto Block28;
	 //  @line: 100
Block25:
	 assume ($neref((r19), ($null))==1);
	 goto Block26;
	 //  @line: 101
Block28:
	 assert ($neref((r28), ($null))==1);
	 //  @line: 101
	 call $z213 := boolean$javaUtilEx.Iterator$hasNext$2254((r28));
	 goto Block29;
	 //  @line: 105
Block26:
	 assert ($neref((r28), ($null))==1);
	 //  @line: 105
	 call $z010 := boolean$javaUtilEx.Iterator$hasNext$2254((r28));
	 goto Block36;
	 //  @line: 101
Block29:
	 goto Block32, Block30;
	 //  @line: 105
Block36:
	 goto Block37, Block38;
	 //  @line: 101
Block32:
	 //  @line: 101
	 assume ($negInt(($eqint(($z213), (0))))==1);
	 assert ($neref((r28), ($null))==1);
	 //  @line: 102
	 call $r414 := java.lang.Object$javaUtilEx.Iterator$next$2255((r28));
	 goto Block33;
	 //  @line: 101
Block30:
	 assume ($eqint(($z213), (0))==1);
	 goto Block31;
	 //  @line: 105
Block37:
	 assume ($eqint(($z010), (0))==1);
	 goto Block31;
	 //  @line: 105
Block38:
	 //  @line: 105
	 assume ($negInt(($eqint(($z010), (0))))==1);
	 assert ($neref((r28), ($null))==1);
	 //  @line: 106
	 call $r311 := java.lang.Object$javaUtilEx.Iterator$next$2255((r28));
	 assert ($neref((r19), ($null))==1);
	 //  @line: 106
	 call $z112 := boolean$java.lang.Object$equals$32((r19), ($r311));
	 goto Block39;
	 //  @line: 102
Block33:
	 goto Block35, Block34;
	 //  @line: 109
Block31:
	 //  @line: 109
	__ret := 0;
	 return;
	 //  @line: 106
Block39:
	 goto Block41, Block40;
	 //  @line: 102
Block35:
	 //  @line: 102
	 assume ($negInt(($neref(($r414), ($null))))==1);
	 //  @line: 103
	__ret := 1;
	 return;
	 //  @line: 102
Block34:
	 assume ($neref(($r414), ($null))==1);
	 goto Block28;
	 //  @line: 106
Block41:
	 //  @line: 106
	 assume ($negInt(($eqint(($z112), (0))))==1);
	 //  @line: 107
	__ret := 1;
	 return;
	 //  @line: 106
Block40:
	 assume ($eqint(($z112), (0))==1);
	 goto Block26;
}


	 //  @line: 137
// <javaUtilEx.LinkedList: java.lang.Object getLast()>
procedure java.lang.Object$javaUtilEx.LinkedList$getLast$2632(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r4548 : ref;
var $r3547 : ref;
var $r2546 : ref;
var $r1545 : ref;
var $i0544 : int;
var r0543 : ref;

 //temp local variables 

	 //  @line: 137
Block784:
	$Exep0 := $null;
	 goto Block785;
Block785:
	r0543 := __this;
	 assert ($neref((r0543), ($null))==1);
	 //  @line: 138
	$i0544 := $HeapVar[r0543, int$javaUtilEx.LinkedList$size0];
	 goto Block786;
	 //  @line: 138
Block786:
	 goto Block787, Block789;
	 //  @line: 138
Block787:
	 assume ($neint(($i0544), (0))==1);
	 goto Block788;
	 //  @line: 138
Block789:
	 //  @line: 138
	 assume ($negInt(($neint(($i0544), (0))))==1);
	 //  @line: 139
	$r4548 := $newvariable((790));
	 assume ($neref(($newvariable((790))), ($null))==1);
	 assert ($neref(($r4548), ($null))==1);
	 //  @line: 139
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r4548));
	 goto Block791;
	 //  @line: 141
Block788:
	 assert ($neref((r0543), ($null))==1);
	 //  @line: 141
	$r1545 := $HeapVar[r0543, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block792;
	 //  @line: 138
Block791:
	$Exep0 := $r4548;
	 return;
	 //  @line: 141
Block792:
	 assert ($neref(($r1545), ($null))==1);
	 //  @line: 141
	$r2546 := $HeapVar[$r1545, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref(($r2546), ($null))==1);
	 //  @line: 141
	$r3547 := $HeapVar[$r2546, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 //  @line: 141
	__ret := $r3547;
	 return;
}


	 //  @line: 4
// <javaUtilEx.Random: void <clinit>()>
procedure void$javaUtilEx.Random$$la$clinit$ra$$2675()
  modifies int$javaUtilEx.Random$index0;
 {
	 //  @line: 5
Block1143:
	 //  @line: 5
	int$javaUtilEx.Random$index0 := 0;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $andreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 719
// <javaUtilEx.LinkedList$ListItr: void checkForComodification()>
procedure void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687(__this : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0873 : ref;
var $r2877 : ref;
var $r1874 : ref;
var $i1876 : int;
var $i0875 : int;

 //temp local variables 

	 //  @line: 719
Block1177:
	$Exep0 := $null;
	 goto Block1254;
Block1254:
	r0873 := __this;
	 assert ($neref((r0873), ($null))==1);
	 //  @line: 720
	$r1874 := $HeapVar[r0873, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 assert ($neref(($r1874), ($null))==1);
	 //  @line: 720
	$i1876 := $HeapVar[$r1874, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0873), ($null))==1);
	 //  @line: 720
	$i0875 := $HeapVar[r0873, int$javaUtilEx.LinkedList$ListItr$expectedModCount0];
	 goto Block1255;
	 //  @line: 720
Block1255:
	 goto Block1258, Block1256;
	 //  @line: 720
Block1258:
	 //  @line: 720
	 assume ($negInt(($eqint(($i1876), ($i0875))))==1);
	 //  @line: 721
	$r2877 := $newvariable((1259));
	 assume ($neref(($newvariable((1259))), ($null))==1);
	 assert ($neref(($r2877), ($null))==1);
	 //  @line: 721
	 call void$javaUtilEx.ConcurrentModificationException$$la$init$ra$$2570(($r2877));
	 goto Block1260;
	 //  @line: 720
Block1256:
	 assume ($eqint(($i1876), ($i0875))==1);
	 goto Block1257;
	 //  @line: 720
Block1260:
	$Exep0 := $r2877;
	 return;
	 //  @line: 722
Block1257:
	 return;
}


	 //  @line: 180
// <javaUtilEx.LinkedList: void addLast(java.lang.Object)>
procedure void$javaUtilEx.LinkedList$addLast$2636(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1563 : ref;
var $r2564 : ref;
var r0562 : ref;

 //temp local variables 
var $freshlocal0 : ref;

Block807:
	r0562 := __this;
	r1563 := $param_0;
	 assert ($neref((r0562), ($null))==1);
	 //  @line: 181
	$r2564 := $HeapVar[r0562, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref((r0562), ($null))==1);
	 //  @line: 181
	 call $freshlocal0 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665((r0562), (r1563), ($r2564));
	 return;
}


	 //  @line: 71
// <javaUtilEx.UnsupportedOperationException: void <init>(java.lang.String,java.lang.Throwable)>
procedure void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2259(__this : ref, $param_0 : ref, $param_1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1100 : ref;
var r099 : ref;
var r2101 : ref;
Block136:
	r099 := __this;
	r1100 := $param_0;
	r2101 := $param_1;
	 assert ($neref((r099), ($null))==1);
	 //  @line: 72
	 call void$java.lang.RuntimeException$$la$init$ra$$762((r099), (r1100), (r2101));
	 return;
}


	 //  @line: 539
// <javaUtilEx.AbstractList: int hashCode()>
procedure int$javaUtilEx.AbstractList$hashCode$2498(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r1194 : ref;
var r2197 : ref;
var r0192 : ref;
var $i2201 : int;
var i1200 : int;
var $z0195 : int;
var $i0198 : int;
Block314:
	r0192 := __this;
	 //  @line: 540
	i1200 := 1;
	 assert ($neref((r0192), ($null))==1);
	 //  @line: 541
	 call r1194 := javaUtilEx.Iterator$javaUtilEx.AbstractList$iterator$2493((r0192));
	 goto Block315;
	 //  @line: 542
Block315:
	 assert ($neref((r1194), ($null))==1);
	 //  @line: 542
	 call $z0195 := boolean$javaUtilEx.Iterator$hasNext$2254((r1194));
	 goto Block316;
	 //  @line: 542
Block316:
	 goto Block317, Block319;
	 //  @line: 542
Block317:
	 assume ($eqint(($z0195), (0))==1);
	 goto Block318;
	 //  @line: 542
Block319:
	 //  @line: 542
	 assume ($negInt(($eqint(($z0195), (0))))==1);
	 assert ($neref((r1194), ($null))==1);
	 //  @line: 543
	 call r2197 := java.lang.Object$javaUtilEx.Iterator$next$2255((r1194));
	 //  @line: 544
	$i0198 := $mulint((31), (i1200));
	 goto Block320;
	 //  @line: 546
Block318:
	 //  @line: 546
	__ret := i1200;
	 return;
	 //  @line: 544
Block320:
	 goto Block323, Block321;
	 //  @line: 544
Block323:
	 //  @line: 544
	 assume ($negInt(($neref((r2197), ($null))))==1);
	 //  @line: 542
	$i2201 := 0;
	 goto Block324;
	 //  @line: 544
Block321:
	 assume ($neref((r2197), ($null))==1);
	 goto Block322;
	 //  @line: 544
Block324:
	 //  @line: 544
	i1200 := $addint(($i0198), ($i2201));
	 goto Block325;
	 //  @line: 544
Block322:
	 assert ($neref((r2197), ($null))==1);
	 //  @line: 544
	 call $i2201 := int$java.lang.Object$hashCode$31((r2197));
	 goto Block324;
	 //  @line: 545
Block325:
	 goto Block315;
}


	 //  @line: 391
// <javaUtilEx.AbstractList$ListItr: void <init>(javaUtilEx.AbstractList,int)>
procedure void$javaUtilEx.AbstractList$ListItr$$la$init$ra$$2542(__this : ref, $param_0 : ref, $param_1 : int)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1270 : ref;
var i0271 : int;
var r0269 : ref;
Block424:
	r0269 := __this;
	r1270 := $param_0;
	i0271 := $param_1;
	 assert ($neref((r0269), ($null))==1);
	 //  @line: 392
	$HeapVar[r0269, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296] := r1270;
	 assert ($neref((r0269), ($null))==1);
	 //  @line: 392
	 call void$javaUtilEx.AbstractList$Itr$$la$init$ra$$2539((r0269), (r1270), ($null));
	 assert ($neref((r0269), ($null))==1);
	 //  @line: 393
	$HeapVar[r0269, int$javaUtilEx.AbstractList$Itr$cursor0] := i0271;
	 return;
}


	 //  @line: 767
// <javaUtilEx.LinkedList$DescendingIterator: void <init>(javaUtilEx.LinkedList,javaUtilEx.LinkedList$1)>
procedure void$javaUtilEx.LinkedList$DescendingIterator$$la$init$ra$$2692(__this : ref, $param_0 : ref, $param_1 : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r2894 : ref;
var r1893 : ref;
var r0892 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 767
Block1117:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1288;
Block1288:
	r0892 := __this;
	r1893 := $param_0;
	r2894 := $param_1;
	 assert ($neref((r0892), ($null))==1);
	 //  @line: 768
	 call $caughtEx1 := void$javaUtilEx.LinkedList$DescendingIterator$$la$init$ra$$2688((r0892), (r1893));
	 goto Block1291, Block1289;
Block1291:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1292;
Block1289:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1290;
Block1292:
	 return;
Block1290:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 676
// <javaUtilEx.SubList: boolean addAll(javaUtilEx.Collection)>
procedure boolean$javaUtilEx.SubList$addAll$2556(__this : ref, $param_0 : ref) returns (__ret : int, $Exep2 : ref, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $z0377 : int;
var r0374 : ref;
var r1375 : ref;
var $i0376 : int;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx4 : ref;
var $caughtEx5 : ref;

	 //  @line: 676
Block578:
	$caughtEx5 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block579;
Block579:
	r0374 := __this;
	r1375 := $param_0;
	 assert ($neref((r0374), ($null))==1);
	 //  @line: 677
	$i0376 := $HeapVar[r0374, int$javaUtilEx.SubList$size0];
	 assert ($neref((r0374), ($null))==1);
	 //  @line: 677
	 call $z0377, $caughtEx3, $caughtEx4, $caughtEx5 := boolean$javaUtilEx.SubList$addAll$2557((r0374), ($i0376), (r1375));
	 goto Block580, Block582;
Block580:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block581;
Block582:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block583;
Block581:
	$Exep2 := $caughtEx3;
	 return;
Block583:
	 goto Block584, Block586;
Block584:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block585;
Block586:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block587;
Block585:
	$Exep1 := $caughtEx4;
	 return;
Block587:
	 goto Block590, Block588;
Block590:
	 assume ($eqref(($caughtEx5), ($null))==1);
	 goto Block591;
Block588:
	 assume ($neref(($caughtEx5), ($null))==1);
	 goto Block589;
Block591:
	 //  @line: 677
	__ret := $z0377;
	 return;
Block589:
	$Exep0 := $caughtEx5;
	 return;
}


	 //  @line: 795
// <javaUtilEx.LinkedList: java.lang.Object[] toArray()>
procedure java.lang.Object$lp$$rp$$javaUtilEx.LinkedList$toArray$2668(__this : ref) returns (__ret : [int]ref)
  modifies $refArrSize;
  requires ($neref((__this), ($null))==1);
 {
var $i1751 : int;
var r1746 : [int]ref;
var i2753 : int;
var r5754 : ref;
var $i0745 : int;
var r0744 : ref;
var $r2748 : ref;
var $r3750 : ref;
var $r4752 : ref;
Block1125:
	r0744 := __this;
	 assert ($neref((r0744), ($null))==1);
	 //  @line: 796
	$i0745 := $HeapVar[r0744, int$javaUtilEx.LinkedList$size0];
	 //  @line: 796
	r1746 := $reftorefarr(($newvariable((1126))));
	$refArrSize[$reftorefarr(($newvariable((1126))))[$arrSizeIdx]] := $i0745;
	 assume ($negInt(($eqrefarray(($reftorefarr(($newvariable((1126))))), ($refArrNull))))==1);
	 //  @line: 797
	i2753 := 0;
	 assert ($neref((r0744), ($null))==1);
	 //  @line: 798
	$r2748 := $HeapVar[r0744, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r2748), ($null))==1);
	 //  @line: 798
	r5754 := $HeapVar[$r2748, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block1127;
	 //  @line: 798
Block1127:
	 assert ($neref((r0744), ($null))==1);
	 //  @line: 798
	$r3750 := $HeapVar[r0744, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block1128;
	 //  @line: 798
Block1128:
	 goto Block1131, Block1129;
	 //  @line: 798
Block1131:
	 //  @line: 798
	 assume ($negInt(($eqref((r5754), ($r3750))))==1);
	 //  @line: 799
	$i1751 := i2753;
	 //  @line: 799
	i2753 := $addint((i2753), (1));
	 assert ($neref((r5754), ($null))==1);
	 //  @line: 799
	$r4752 := $HeapVar[r5754, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($geint(($i1751), (0))==1);
	 assert ($ltint(($i1751), ($refArrSize[r1746[$arrSizeIdx]]))==1);
	 //  @line: 799
	r1746[$i1751] := $r4752;
	 assert ($neref((r5754), ($null))==1);
	 //  @line: 798
	r5754 := $HeapVar[r5754, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block1127;
	 //  @line: 798
Block1129:
	 assume ($eqref((r5754), ($r3750))==1);
	 goto Block1130;
	 //  @line: 800
Block1130:
	 //  @line: 800
	__ret := r1746;
	 return;
}


	 //  @line: 87
// <javaUtilEx.AbstractSequentialList: java.lang.Object get(int)>
procedure java.lang.Object$javaUtilEx.AbstractSequentialList$get$2579(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r2446 : ref;
var $r3447 : ref;
var r0444 : ref;
var $r4448 : ref;
var i0445 : int;
var $r5450 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 87
Block691:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block692;
Block692:
	r0444 := __this;
	i0445 := $param_0;
	 goto Block693;
	 //  @line: 88
Block693:
	 assert ($neref((r0444), ($null))==1);
	 //  @line: 88
	 call $r2446 := javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585((r0444), (i0445));
	 assert ($neref(($r2446), ($null))==1);
	 //  @line: 88
	 call $r3447 := java.lang.Object$javaUtilEx.ListIterator$next$2526(($r2446));
	 goto Block694;
	 //  @line: 88
Block694:
	 //  @line: 88
	__ret := $r3447;
	 return;
}


	 //  @line: 23
// <javaUtilEx.Content: void <init>(int)>
procedure void$javaUtilEx.Content$$la$init$ra$$2586(__this : ref, $param_0 : int)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var i0496 : int;
var r0495 : ref;
Block737:
	r0495 := __this;
	i0496 := $param_0;
	 assert ($neref((r0495), ($null))==1);
	 //  @line: 24
	 call void$java.lang.Object$$la$init$ra$$28((r0495));
	 assert ($neref((r0495), ($null))==1);
	 //  @line: 25
	$HeapVar[r0495, int$javaUtilEx.Content$val0] := i0496;
	 return;
}


	 //  @line: 146
// <javaUtilEx.AbstractCollection: boolean remove(java.lang.Object)>
procedure boolean$javaUtilEx.AbstractCollection$remove$2234(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r121 : ref;
var r018 : ref;
var $z225 : int;
var $r426 : ref;
var $r323 : ref;
var $z124 : int;
var $z022 : int;
var r220 : ref;
Block46:
	r018 := __this;
	r121 := $param_0;
	 assert ($neref((r018), ($null))==1);
	 //  @line: 147
	 call r220 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r018));
	 goto Block47;
	 //  @line: 148
Block47:
	 goto Block48, Block50;
	 //  @line: 148
Block48:
	 assume ($neref((r121), ($null))==1);
	 goto Block49;
	 //  @line: 148
Block50:
	 //  @line: 148
	 assume ($negInt(($neref((r121), ($null))))==1);
	 goto Block51;
	 //  @line: 156
Block49:
	 assert ($neref((r220), ($null))==1);
	 //  @line: 156
	 call $z022 := boolean$javaUtilEx.Iterator$hasNext$2254((r220));
	 goto Block59;
	 //  @line: 149
Block51:
	 assert ($neref((r220), ($null))==1);
	 //  @line: 149
	 call $z225 := boolean$javaUtilEx.Iterator$hasNext$2254((r220));
	 goto Block52;
	 //  @line: 156
Block59:
	 goto Block60, Block61;
	 //  @line: 149
Block52:
	 goto Block55, Block53;
	 //  @line: 156
Block60:
	 assume ($eqint(($z022), (0))==1);
	 goto Block54;
	 //  @line: 156
Block61:
	 //  @line: 156
	 assume ($negInt(($eqint(($z022), (0))))==1);
	 assert ($neref((r220), ($null))==1);
	 //  @line: 157
	 call $r323 := java.lang.Object$javaUtilEx.Iterator$next$2255((r220));
	 assert ($neref((r121), ($null))==1);
	 //  @line: 157
	 call $z124 := boolean$java.lang.Object$equals$32((r121), ($r323));
	 goto Block62;
	 //  @line: 149
Block55:
	 //  @line: 149
	 assume ($negInt(($eqint(($z225), (0))))==1);
	 assert ($neref((r220), ($null))==1);
	 //  @line: 150
	 call $r426 := java.lang.Object$javaUtilEx.Iterator$next$2255((r220));
	 goto Block56;
	 //  @line: 149
Block53:
	 assume ($eqint(($z225), (0))==1);
	 goto Block54;
	 //  @line: 163
Block54:
	 //  @line: 163
	__ret := 0;
	 return;
	 //  @line: 157
Block62:
	 goto Block63, Block64;
	 //  @line: 150
Block56:
	 goto Block57, Block58;
	 //  @line: 157
Block63:
	 assume ($eqint(($z124), (0))==1);
	 goto Block49;
	 //  @line: 157
Block64:
	 //  @line: 157
	 assume ($negInt(($eqint(($z124), (0))))==1);
	 assert ($neref((r220), ($null))==1);
	 //  @line: 158
	 call void$javaUtilEx.Iterator$remove$2256((r220));
	 //  @line: 159
	__ret := 1;
	 return;
	 //  @line: 150
Block57:
	 assume ($neref(($r426), ($null))==1);
	 goto Block51;
	 //  @line: 150
Block58:
	 //  @line: 150
	 assume ($negInt(($neref(($r426), ($null))))==1);
	 assert ($neref((r220), ($null))==1);
	 //  @line: 151
	 call void$javaUtilEx.Iterator$remove$2256((r220));
	 //  @line: 152
	__ret := 1;
	 return;
}


	 //  @line: 170
// <javaUtilEx.AbstractSequentialList: java.lang.Object remove(int)>
procedure java.lang.Object$javaUtilEx.AbstractSequentialList$remove$2582(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0469 : ref;
var i0470 : int;
var $r2475 : ref;
var r4477 : ref;
var r1474 : ref;
var $r3476 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 170
Block713:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block714;
Block714:
	r0469 := __this;
	i0470 := $param_0;
	 goto Block715;
	 //  @line: 171
Block715:
	 assert ($neref((r0469), ($null))==1);
	 //  @line: 171
	 call r4477 := javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585((r0469), (i0470));
	 assert ($neref((r4477), ($null))==1);
	 //  @line: 172
	 call r1474 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r4477));
	 assert ($neref((r4477), ($null))==1);
	 //  @line: 173
	 call void$javaUtilEx.ListIterator$remove$2531((r4477));
	 goto Block716;
	 //  @line: 174
Block716:
	 //  @line: 174
	__ret := r1474;
	 return;
}


	 //  @line: 90
// <javaUtilEx.LinkedList: java.lang.Object access$200(javaUtilEx.LinkedList,javaUtilEx.LinkedList$Entry)>
procedure java.lang.Object$javaUtilEx.LinkedList$access$200$2671($param_0 : ref, $param_1 : ref) returns (__ret : ref, $Exep0 : ref) {
var r0759 : ref;
var $r2761 : ref;
var r1760 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 90
Block1134:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1135;
Block1135:
	r0759 := $param_0;
	r1760 := $param_1;
	 assert ($neref((r0759), ($null))==1);
	 //  @line: 91
	 call $r2761, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0759), (r1760));
	 goto Block1136, Block1138;
Block1136:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1137;
Block1138:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1139;
Block1137:
	$Exep0 := $caughtEx1;
	 return;
Block1139:
	 //  @line: 91
	__ret := $r2761;
	 return;
}


	 //  @line: 75
// <javaUtilEx.AbstractList: void <init>()>
procedure void$javaUtilEx.AbstractList$$la$init$ra$$2483(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0104 : ref;
Block138:
	r0104 := __this;
	 assert ($neref((r0104), ($null))==1);
	 //  @line: 76
	 call void$javaUtilEx.AbstractCollection$$la$init$ra$$2228((r0104));
	 assert ($neref((r0104), ($null))==1);
	 //  @line: 605
	$HeapVar[r0104, int$javaUtilEx.AbstractList$modCount0] := 0;
	 return;
}


	 //  @line: 114
// <javaUtilEx.AbstractSequentialList: java.lang.Object set(int,java.lang.Object)>
procedure java.lang.Object$javaUtilEx.AbstractSequentialList$set$2580(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0451 : ref;
var r1457 : ref;
var r2456 : ref;
var i0452 : int;
var $r4459 : ref;
var r5460 : ref;
var $r3458 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 114
Block698:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block699;
Block699:
	r0451 := __this;
	i0452 := $param_0;
	r1457 := $param_1;
	 goto Block700;
	 //  @line: 115
Block700:
	 assert ($neref((r0451), ($null))==1);
	 //  @line: 115
	 call r5460 := javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585((r0451), (i0452));
	 assert ($neref((r5460), ($null))==1);
	 //  @line: 116
	 call r2456 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r5460));
	 assert ($neref((r5460), ($null))==1);
	 //  @line: 117
	 call void$javaUtilEx.ListIterator$set$2532((r5460), (r1457));
	 goto Block701;
	 //  @line: 118
Block701:
	 //  @line: 118
	__ret := r2456;
	 return;
}


// <java.lang.Object: int hashCode()>
procedure int$java.lang.Object$hashCode$31(__this : ref) returns (__ret : int);



	 //  @line: 680
// <javaUtilEx.LinkedList$ListItr: int nextIndex()>
procedure int$javaUtilEx.LinkedList$ListItr$nextIndex$2682(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $i0834 : int;
var r0833 : ref;
Block1210:
	r0833 := __this;
	 assert ($neref((r0833), ($null))==1);
	 //  @line: 681
	$i0834 := $HeapVar[r0833, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 681
	__ret := $i0834;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $addint(x : int, y : int) returns (__ret : int) {
(x + y)
}


// procedure is generated by joogie.
function {:inline true} $subref($param00 : ref, $param11 : ref) returns (__ret : ref);



	 //  @line: 150
// <javaUtilEx.LinkedList: java.lang.Object removeFirst()>
procedure java.lang.Object$javaUtilEx.LinkedList$removeFirst$2633(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r2551 : ref;
var $r3552 : ref;
var r0549 : ref;
var $r1550 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 150
Block794:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block795;
Block795:
	r0549 := __this;
	 assert ($neref((r0549), ($null))==1);
	 //  @line: 151
	$r1550 := $HeapVar[r0549, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r1550), ($null))==1);
	 //  @line: 151
	$r2551 := $HeapVar[$r1550, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r0549), ($null))==1);
	 //  @line: 151
	 call $r3552, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0549), ($r2551));
	 goto Block798, Block796;
Block798:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block799;
Block796:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block797;
Block799:
	 //  @line: 151
	__ret := $r3552;
	 return;
Block797:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 147
// <javaUtilEx.AbstractList: void add(int,java.lang.Object)>
procedure void$javaUtilEx.AbstractList$add$2487(__this : ref, $param_0 : int, $param_1 : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var i0114 : int;
var r0113 : ref;
var r1115 : ref;
var $r2112 : ref;

 //temp local variables 

	 //  @line: 147
Block139:
	$Exep0 := $null;
	 goto Block150;
Block150:
	r0113 := __this;
	i0114 := $param_0;
	r1115 := $param_1;
	 //  @line: 148
	$r2112 := $newvariable((151));
	 assume ($neref(($newvariable((151))), ($null))==1);
	 assert ($neref(($r2112), ($null))==1);
	 //  @line: 148
	 call void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2257(($r2112));
	 goto Block152;
Block152:
	$Exep0 := $r2112;
	 return;
}


	 //  @line: 28
// <javaUtilEx.Content: int hashCode()>
procedure int$javaUtilEx.Content$hashCode$2587(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $i0498 : int;
var r0497 : ref;
var $i1499 : int;
Block738:
	r0497 := __this;
	 assert ($neref((r0497), ($null))==1);
	 //  @line: 29
	$i0498 := $HeapVar[r0497, int$javaUtilEx.Content$val0];
	 //  @line: 29
	$i1499 := $xorint(($i0498), (31));
	 //  @line: 29
	__ret := $i1499;
	 return;
}


// <java.lang.RuntimeException: void <init>(java.lang.String,java.lang.Throwable)>
procedure void$java.lang.RuntimeException$$la$init$ra$$762(__this : ref, $param_0 : ref, $param_1 : ref);



// <java.lang.StringBuilder: java.lang.StringBuilder append(java.lang.Object)>
procedure java.lang.StringBuilder$java.lang.StringBuilder$append$2265(__this : ref, $param_0 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $divref($param00 : ref, $param11 : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $neint(x : int, y : int) returns (__ret : int) {
if (x != y) then 1 else 0
}


// <java.lang.Object: boolean equals(java.lang.Object)>
procedure boolean$java.lang.Object$equals$32(__this : ref, $param_0 : ref) returns (__ret : int);



	 //  @line: 607
// <javaUtilEx.AbstractList: void rangeCheckForAdd(int)>
procedure void$javaUtilEx.AbstractList$rangeCheckForAdd$2500(__this : ref, $param_0 : int) returns ($Exep0 : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var $r1212 : ref;
var r0213 : ref;
var $i1215 : int;
var $r2214 : ref;
var i0211 : int;

 //temp local variables 

	 //  @line: 607
Block157:
	$Exep0 := $null;
	 goto Block335;
Block335:
	r0213 := __this;
	i0211 := $param_0;
	 goto Block336;
	 //  @line: 608
Block336:
	 goto Block339, Block337;
	 //  @line: 608
Block339:
	 //  @line: 608
	 assume ($negInt(($ltint((i0211), (0))))==1);
	 assert ($neref((r0213), ($null))==1);
	 //  @line: 609
	 call $i1215 := int$javaUtilEx.AbstractCollection$size$2230((r0213));
	 goto Block340;
	 //  @line: 608
Block337:
	 assume ($ltint((i0211), (0))==1);
	 goto Block338;
	 //  @line: 609
Block340:
	 goto Block343, Block341;
	 //  @line: 609
Block338:
	 //  @line: 609
	$r1212 := $newvariable((344));
	 assume ($neref(($newvariable((344))), ($null))==1);
	 assert ($neref((r0213), ($null))==1);
	 //  @line: 609
	 call $r2214 := java.lang.String$javaUtilEx.AbstractList$outOfBoundsMsg$2501((r0213), (i0211));
	 assert ($neref(($r1212), ($null))==1);
	 //  @line: 609
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2076(($r1212), ($r2214));
	 goto Block345;
	 //  @line: 609
Block343:
	 //  @line: 609
	 assume ($negInt(($leint((i0211), ($i1215))))==1);
	 goto Block338;
	 //  @line: 609
Block341:
	 assume ($leint((i0211), ($i1215))==1);
	 goto Block342;
	 //  @line: 609
Block345:
	$Exep0 := $r1212;
	 return;
	 //  @line: 610
Block342:
	 return;
}


// <javaUtilEx.ListIterator: int previousIndex()>
procedure int$javaUtilEx.ListIterator$previousIndex$2530(__this : ref) returns (__ret : int);



	 //  @line: 666
// <javaUtilEx.LinkedList$ListItr: boolean hasPrevious()>
procedure boolean$javaUtilEx.LinkedList$ListItr$hasPrevious$2680(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0823 : int;
var r0820 : ref;
var $i0821 : int;
Block1191:
	r0820 := __this;
	 assert ($neref((r0820), ($null))==1);
	 //  @line: 667
	$i0821 := $HeapVar[r0820, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 goto Block1192;
	 //  @line: 667
Block1192:
	 goto Block1193, Block1195;
	 //  @line: 667
Block1193:
	 assume ($eqint(($i0821), (0))==1);
	 goto Block1194;
	 //  @line: 667
Block1195:
	 //  @line: 667
	 assume ($negInt(($eqint(($i0821), (0))))==1);
	 //  @line: 667
	$z0823 := 1;
	 goto Block1196;
	 //  @line: 667
Block1194:
	 //  @line: 667
	$z0823 := 0;
	 goto Block1196;
	 //  @line: 667
Block1196:
	 //  @line: 667
	__ret := $z0823;
	 return;
}


	 //  @line: 652
// <javaUtilEx.SubList: void add(int,java.lang.Object)>
procedure void$javaUtilEx.SubList$add$2553(__this : ref, $param_0 : int, $param_1 : ref) returns ($Exep2 : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1343 : ref;
var r0340 : ref;
var $i3347 : int;
var $i1342 : int;
var $r3346 : ref;
var i0341 : int;
var $r2345 : ref;
var $i4348 : int;
var $i2344 : int;
var $i5349 : int;

 //temp local variables 
var $caughtEx4 : ref;
var $caughtEx3 : ref;
var $caughtEx5 : ref;

	 //  @line: 652
Block539:
	$caughtEx5 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block540;
Block540:
	r0340 := __this;
	i0341 := $param_0;
	r1343 := $param_1;
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 653
	 call $caughtEx3 := void$javaUtilEx.SubList$rangeCheckForAdd$2562((r0340), (i0341));
	 goto Block541, Block543;
Block541:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block542;
Block543:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block544;
Block542:
	$Exep0 := $caughtEx3;
	 return;
Block544:
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 654
	 call $caughtEx4 := void$javaUtilEx.SubList$checkForComodification$2564((r0340));
	 goto Block545, Block547;
Block545:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block546;
Block547:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block548;
Block546:
	$Exep1 := $caughtEx4;
	 return;
Block548:
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 655
	$r2345 := $HeapVar[r0340, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 655
	$i1342 := $HeapVar[r0340, int$javaUtilEx.SubList$offset0];
	 //  @line: 655
	$i2344 := $addint((i0341), ($i1342));
	 assert ($neref(($r2345), ($null))==1);
	 //  @line: 655
	 call $caughtEx5 := void$javaUtilEx.AbstractList$add$2487(($r2345), ($i2344), (r1343));
	 goto Block549, Block551;
Block549:
	 assume ($neref(($caughtEx5), ($null))==1);
	 goto Block550;
Block551:
	 assume ($eqref(($caughtEx5), ($null))==1);
	 goto Block552;
Block550:
	$Exep2 := $caughtEx5;
	 return;
Block552:
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 656
	$r3346 := $HeapVar[r0340, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r3346), ($null))==1);
	 //  @line: 656
	$i3347 := $HeapVar[$r3346, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 656
	$HeapVar[r0340, int$javaUtilEx.AbstractList$modCount0] := $i3347;
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 657
	$i4348 := $HeapVar[r0340, int$javaUtilEx.SubList$size0];
	 //  @line: 657
	$i5349 := $addint(($i4348), (1));
	 assert ($neref((r0340), ($null))==1);
	 //  @line: 657
	$HeapVar[r0340, int$javaUtilEx.SubList$size0] := $i5349;
	 return;
}


	 //  @line: 325
// <javaUtilEx.LinkedList: javaUtilEx.LinkedList$Entry entry(int)>
procedure javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$entry$2646(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i1627 : int;
var $i2629 : int;
var i4633 : int;
var i0624 : int;
var $r1625 : ref;
var $i3630 : int;
var r0626 : ref;
var r2632 : ref;
var i5634 : int;

 //temp local variables 

	 //  @line: 325
Block858:
	$Exep0 := $null;
	 goto Block893;
Block893:
	r0626 := __this;
	i0624 := $param_0;
	 goto Block894;
	 //  @line: 326
Block894:
	 goto Block897, Block895;
	 //  @line: 326
Block897:
	 //  @line: 326
	 assume ($negInt(($ltint((i0624), (0))))==1);
	 assert ($neref((r0626), ($null))==1);
	 //  @line: 327
	$i1627 := $HeapVar[r0626, int$javaUtilEx.LinkedList$size0];
	 goto Block898;
	 //  @line: 326
Block895:
	 assume ($ltint((i0624), (0))==1);
	 goto Block896;
	 //  @line: 327
Block898:
	 goto Block899, Block901;
	 //  @line: 327
Block896:
	 //  @line: 327
	$r1625 := $newvariable((902));
	 assume ($neref(($newvariable((902))), ($null))==1);
	 assert ($neref(($r1625), ($null))==1);
	 //  @line: 327
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2075(($r1625));
	 goto Block903;
	 //  @line: 327
Block899:
	 assume ($ltint((i0624), ($i1627))==1);
	 goto Block900;
	 //  @line: 327
Block901:
	 //  @line: 327
	 assume ($negInt(($ltint((i0624), ($i1627))))==1);
	 goto Block896;
	 //  @line: 327
Block903:
	$Exep0 := $r1625;
	 return;
	 //  @line: 328
Block900:
	 assert ($neref((r0626), ($null))==1);
	 //  @line: 328
	r2632 := $HeapVar[r0626, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block904;
	 //  @line: 329
Block904:
	 assert ($neref((r0626), ($null))==1);
	 //  @line: 329
	$i2629 := $HeapVar[r0626, int$javaUtilEx.LinkedList$size0];
	 //  @line: 329
	$i3630 := $shrint(($i2629), (1));
	 goto Block905;
	 //  @line: 329
Block905:
	 goto Block906, Block908;
	 //  @line: 329
Block906:
	 assume ($geint((i0624), ($i3630))==1);
	 goto Block907;
	 //  @line: 329
Block908:
	 //  @line: 329
	 assume ($negInt(($geint((i0624), ($i3630))))==1);
	 //  @line: 330
	i4633 := 0;
	 goto Block909;
	 //  @line: 333
Block907:
	 assert ($neref((r0626), ($null))==1);
	 //  @line: 333
	i5634 := $HeapVar[r0626, int$javaUtilEx.LinkedList$size0];
	 goto Block914;
	 //  @line: 330
Block909:
	 goto Block910, Block912;
	 //  @line: 333
Block914:
	 goto Block915, Block916;
	 //  @line: 330
Block910:
	 assume ($gtint((i4633), (i0624))==1);
	 goto Block911;
	 //  @line: 330
Block912:
	 //  @line: 330
	 assume ($negInt(($gtint((i4633), (i0624))))==1);
	 assert ($neref((r2632), ($null))==1);
	 //  @line: 331
	r2632 := $HeapVar[r2632, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 //  @line: 330
	i4633 := $addint((i4633), (1));
	 goto Block909;
	 //  @line: 333
Block915:
	 assume ($leint((i5634), (i0624))==1);
	 goto Block913;
	 //  @line: 333
Block916:
	 //  @line: 333
	 assume ($negInt(($leint((i5634), (i0624))))==1);
	 assert ($neref((r2632), ($null))==1);
	 //  @line: 334
	r2632 := $HeapVar[r2632, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 //  @line: 333
	i5634 := $addint((i5634), (-1));
	 goto Block914;
	 //  @line: 330
Block911:
	 goto Block913;
	 //  @line: 336
Block913:
	 //  @line: 336
	__ret := r2632;
	 return;
}


	 //  @line: 107
// <javaUtilEx.AbstractList: boolean add(java.lang.Object)>
procedure boolean$javaUtilEx.AbstractList$add$2484(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1107 : ref;
var r0105 : ref;
var $i0106 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 107
Block140:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block141;
Block141:
	r0105 := __this;
	r1107 := $param_0;
	 assert ($neref((r0105), ($null))==1);
	 //  @line: 108
	 call $i0106 := int$javaUtilEx.AbstractCollection$size$2230((r0105));
	 assert ($neref((r0105), ($null))==1);
	 //  @line: 108
	 call $caughtEx1 := void$javaUtilEx.AbstractList$add$2487((r0105), ($i0106), (r1107));
	 goto Block142, Block144;
Block142:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block143;
Block144:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block145;
Block143:
	$Exep0 := $caughtEx1;
	 return;
Block145:
	 //  @line: 109
	__ret := 1;
	 return;
}


	 //  @line: 517
// <javaUtilEx.LinkedList: java.lang.Object pollFirst()>
procedure java.lang.Object$javaUtilEx.LinkedList$pollFirst$2658(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1688 : ref;
var r0686 : ref;
var $i0687 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 517
Block1028:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1029;
Block1029:
	r0686 := __this;
	 assert ($neref((r0686), ($null))==1);
	 //  @line: 518
	$i0687 := $HeapVar[r0686, int$javaUtilEx.LinkedList$size0];
	 goto Block1030;
	 //  @line: 518
Block1030:
	 goto Block1033, Block1031;
	 //  @line: 518
Block1033:
	 //  @line: 518
	 assume ($negInt(($neint(($i0687), (0))))==1);
	 //  @line: 519
	__ret := $null;
	 return;
	 //  @line: 518
Block1031:
	 assume ($neint(($i0687), (0))==1);
	 goto Block1032;
	 //  @line: 520
Block1032:
	 assert ($neref((r0686), ($null))==1);
	 //  @line: 520
	 call $r1688, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$removeFirst$2633((r0686));
	 goto Block1034, Block1036;
	 //  @line: 520
Block1034:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1035;
	 //  @line: 520
Block1036:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1037;
	 //  @line: 520
Block1035:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 520
Block1037:
	 goto Block1038;
	 //  @line: 520
Block1038:
	 //  @line: 520
	__ret := $r1688;
	 return;
}


	 //  @line: 288
// <javaUtilEx.AbstractList: javaUtilEx.Iterator iterator()>
procedure javaUtilEx.Iterator$javaUtilEx.AbstractList$iterator$2493(__this : ref) returns (__ret : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1156 : ref;
var r0157 : ref;
Block230:
	r0157 := __this;
	 //  @line: 289
	$r1156 := $newvariable((231));
	 assume ($neref(($newvariable((231))), ($null))==1);
	 assert ($neref(($r1156), ($null))==1);
	 //  @line: 289
	 call void$javaUtilEx.AbstractList$Itr$$la$init$ra$$2539(($r1156), (r0157), ($null));
	 //  @line: 289
	__ret := $r1156;
	 return;
}


	 //  @line: 41
// <javaUtilEx.UnsupportedOperationException: void <init>()>
procedure void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2257(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r096 : ref;
Block134:
	r096 := __this;
	 assert ($neref((r096), ($null))==1);
	 //  @line: 42
	 call void$java.lang.RuntimeException$$la$init$ra$$760((r096));
	 return;
}


	 //  @line: 708
// <javaUtilEx.SubList$1: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.SubList$1$next$2695(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1913 : ref;
var $z0912 : int;
var r0911 : ref;
var $r3915 : ref;
var $r2914 : ref;

 //temp local variables 

	 //  @line: 708
Block1304:
	$Exep0 := $null;
	 goto Block1305;
Block1305:
	r0911 := __this;
	 assert ($neref((r0911), ($null))==1);
	 //  @line: 709
	 call $z0912 := boolean$javaUtilEx.SubList$1$hasNext$2694((r0911));
	 goto Block1306;
	 //  @line: 709
Block1306:
	 goto Block1307, Block1309;
	 //  @line: 709
Block1307:
	 assume ($eqint(($z0912), (0))==1);
	 goto Block1308;
	 //  @line: 709
Block1309:
	 //  @line: 709
	 assume ($negInt(($eqint(($z0912), (0))))==1);
	 assert ($neref((r0911), ($null))==1);
	 //  @line: 710
	$r2914 := $HeapVar[r0911, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r2914), ($null))==1);
	 //  @line: 710
	 call $r3915 := java.lang.Object$javaUtilEx.ListIterator$next$2526(($r2914));
	 //  @line: 710
	__ret := $r3915;
	 return;
	 //  @line: 712
Block1308:
	 //  @line: 712
	$r1913 := $newvariable((1310));
	 assume ($neref(($newvariable((1310))), ($null))==1);
	 goto Block1311;
	 //  @line: 712
Block1311:
	 assert ($neref(($r1913), ($null))==1);
	 //  @line: 712
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r1913));
	 goto Block1312;
	 //  @line: 712
Block1312:
	$Exep0 := $r1913;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $eqrefarray($param00 : [int]ref, $param11 : [int]ref) returns (__ret : int);



// <javaUtilEx.AbstractCollection: int size()>
procedure int$javaUtilEx.AbstractCollection$size$2230(__this : ref) returns (__ret : int);



	 //  @line: 202
// <javaUtilEx.LinkedList: int size()>
procedure int$javaUtilEx.LinkedList$size$2638(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0571 : ref;
var $i0572 : int;
Block814:
	r0571 := __this;
	 assert ($neref((r0571), ($null))==1);
	 //  @line: 203
	$i0572 := $HeapVar[r0571, int$javaUtilEx.LinkedList$size0];
	 //  @line: 203
	__ret := $i0572;
	 return;
}


	 //  @line: 503
// <javaUtilEx.LinkedList: java.lang.Object peekLast()>
procedure java.lang.Object$javaUtilEx.LinkedList$peekLast$2657(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0683 : ref;
var $i0684 : int;
var $r1685 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 503
Block1017:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1018;
Block1018:
	r0683 := __this;
	 assert ($neref((r0683), ($null))==1);
	 //  @line: 504
	$i0684 := $HeapVar[r0683, int$javaUtilEx.LinkedList$size0];
	 goto Block1019;
	 //  @line: 504
Block1019:
	 goto Block1020, Block1022;
	 //  @line: 504
Block1020:
	 assume ($neint(($i0684), (0))==1);
	 goto Block1021;
	 //  @line: 504
Block1022:
	 //  @line: 504
	 assume ($negInt(($neint(($i0684), (0))))==1);
	 //  @line: 505
	__ret := $null;
	 return;
	 //  @line: 506
Block1021:
	 assert ($neref((r0683), ($null))==1);
	 //  @line: 506
	 call $r1685, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$getLast$2632((r0683));
	 goto Block1025, Block1023;
	 //  @line: 506
Block1025:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1026;
	 //  @line: 506
Block1023:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1024;
	 //  @line: 506
Block1026:
	 goto Block1027;
	 //  @line: 506
Block1024:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 506
Block1027:
	 //  @line: 506
	__ret := $r1685;
	 return;
}


	 //  @line: 318
// <javaUtilEx.LinkedList: java.lang.Object remove(int)>
procedure java.lang.Object$javaUtilEx.LinkedList$remove$2645(__this : ref, $param_0 : int) returns (__ret : ref, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r2623 : ref;
var $r1622 : ref;
var r0620 : ref;
var i0621 : int;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 318
Block883:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block884;
Block884:
	r0620 := __this;
	i0621 := $param_0;
	 assert ($neref((r0620), ($null))==1);
	 //  @line: 319
	 call $r1622, $caughtEx2 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$entry$2646((r0620), (i0621));
	 goto Block887, Block885;
Block887:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block888;
Block885:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block886;
Block888:
	 assert ($neref((r0620), ($null))==1);
	 //  @line: 319
	 call $r2623, $caughtEx3 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0620), ($r1622));
	 goto Block889, Block891;
Block886:
	$Exep0 := $caughtEx2;
	 return;
Block889:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block890;
Block891:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block892;
Block890:
	$Exep1 := $caughtEx3;
	 return;
Block892:
	 //  @line: 319
	__ret := $r2623;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $shrref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 612
// <javaUtilEx.AbstractList: java.lang.String outOfBoundsMsg(int)>
procedure java.lang.String$javaUtilEx.AbstractList$outOfBoundsMsg$2501(__this : ref, $param_0 : int) returns (__ret : ref)
  modifies $stringSize;
  requires ($neref((__this), ($null))==1);
 {
var r0216 : ref;
var i0217 : int;
Block346:
	r0216 := __this;
	i0217 := $param_0;
	$stringSize[$fresh2] := 0;
	 //  @line: 613
	__ret := $fresh2;
	 return;
}


	 //  @line: 72
// <javaUtilEx.IllegalArgumentException: void <init>(java.lang.String,java.lang.Throwable)>
procedure void$javaUtilEx.IllegalArgumentException$$la$init$ra$$2624(__this : ref, $param_0 : ref, $param_1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0511 : ref;
var r2513 : ref;
var r1512 : ref;
Block751:
	r0511 := __this;
	r1512 := $param_0;
	r2513 := $param_1;
	 assert ($neref((r0511), ($null))==1);
	 //  @line: 73
	 call void$java.lang.RuntimeException$$la$init$ra$$762((r0511), (r1512), (r2513));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $geref($param00 : ref, $param11 : ref) returns (__ret : int);



// <java.lang.RuntimeException: void <init>(java.lang.String)>
procedure void$java.lang.RuntimeException$$la$init$ra$$761(__this : ref, $param_0 : ref);



// procedure is generated by joogie.
function {:inline true} $eqint(x : int, y : int) returns (__ret : int) {
if (x == y) then 1 else 0
}


	 //  @line: 571
// <javaUtilEx.AbstractList: void removeRange(int,int)>
procedure void$javaUtilEx.AbstractList$removeRange$2499(__this : ref, $param_0 : int, $param_1 : int) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1205 : ref;
var i3210 : int;
var i2208 : int;
var r0202 : ref;
var i0203 : int;
var i1207 : int;

 //temp local variables 
var $freshlocal2 : ref;
var $caughtEx1 : ref;

	 //  @line: 571
Block208:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block326;
Block326:
	r0202 := __this;
	i0203 := $param_0;
	i1207 := $param_1;
	 assert ($neref((r0202), ($null))==1);
	 //  @line: 572
	 call r1205, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2495((r0202), (i0203));
	 goto Block327, Block329;
Block327:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block328;
Block329:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block330;
Block328:
	$Exep0 := $caughtEx1;
	 return;
Block330:
	 //  @line: 573
	i3210 := 0;
	 //  @line: 573
	i2208 := $subint((i1207), (i0203));
	 goto Block331;
	 //  @line: 573
Block331:
	 goto Block332, Block334;
	 //  @line: 573
Block332:
	 assume ($geint((i3210), (i2208))==1);
	 goto Block333;
	 //  @line: 573
Block334:
	 //  @line: 573
	 assume ($negInt(($geint((i3210), (i2208))))==1);
	 assert ($neref((r1205), ($null))==1);
	 //  @line: 574
	 call $freshlocal2 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r1205));
	 assert ($neref((r1205), ($null))==1);
	 //  @line: 575
	 call void$javaUtilEx.ListIterator$remove$2531((r1205));
	 //  @line: 573
	i3210 := $addint((i3210), (1));
	 goto Block331;
	 //  @line: 577
Block333:
	 return;
}


	 //  @line: 42
// <javaUtilEx.IllegalArgumentException: void <init>()>
procedure void$javaUtilEx.IllegalArgumentException$$la$init$ra$$2622(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0508 : ref;
Block749:
	r0508 := __this;
	 assert ($neref((r0508), ($null))==1);
	 //  @line: 43
	 call void$java.lang.RuntimeException$$la$init$ra$$760((r0508));
	 return;
}


	 //  @line: 546
// <javaUtilEx.LinkedList: void push(java.lang.Object)>
procedure void$javaUtilEx.LinkedList$push$2660(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1693 : ref;
var r0692 : ref;
Block1050:
	r0692 := __this;
	r1693 := $param_0;
	 assert ($neref((r0692), ($null))==1);
	 //  @line: 547
	 call void$javaUtilEx.LinkedList$addFirst$2635((r0692), (r1693));
	 return;
}


	 //  @line: 382
// <javaUtilEx.LinkedList: int lastIndexOf(java.lang.Object)>
procedure int$javaUtilEx.LinkedList$lastIndexOf$2648(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r9662 : ref;
var $z0656 : int;
var r8661 : ref;
var r1651 : ref;
var $r6658 : ref;
var $r4655 : ref;
var i0660 : int;
var $r2652 : ref;
var $r5657 : ref;
var $r3654 : ref;
var r0649 : ref;
var $r7659 : ref;
Block943:
	r0649 := __this;
	r1651 := $param_0;
	 assert ($neref((r0649), ($null))==1);
	 //  @line: 383
	i0660 := $HeapVar[r0649, int$javaUtilEx.LinkedList$size0];
	 goto Block944;
	 //  @line: 384
Block944:
	 goto Block945, Block947;
	 //  @line: 384
Block945:
	 assume ($neref((r1651), ($null))==1);
	 goto Block946;
	 //  @line: 384
Block947:
	 //  @line: 384
	 assume ($negInt(($neref((r1651), ($null))))==1);
	 assert ($neref((r0649), ($null))==1);
	 //  @line: 385
	$r5657 := $HeapVar[r0649, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r5657), ($null))==1);
	 //  @line: 385
	r8661 := $HeapVar[$r5657, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block948;
	 //  @line: 391
Block946:
	 assert ($neref((r0649), ($null))==1);
	 //  @line: 391
	$r2652 := $HeapVar[r0649, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block959;
	 //  @line: 385
Block948:
	 assert ($neref((r0649), ($null))==1);
	 //  @line: 385
	$r6658 := $HeapVar[r0649, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block949;
	 //  @line: 391
Block959:
	 assert ($neref(($r2652), ($null))==1);
	 //  @line: 391
	r9662 := $HeapVar[$r2652, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block960;
	 //  @line: 385
Block949:
	 goto Block950, Block952;
	 //  @line: 391
Block960:
	 assert ($neref((r0649), ($null))==1);
	 //  @line: 391
	$r3654 := $HeapVar[r0649, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block961;
	 //  @line: 385
Block950:
	 assume ($eqref((r8661), ($r6658))==1);
	 goto Block951;
	 //  @line: 385
Block952:
	 //  @line: 385
	 assume ($negInt(($eqref((r8661), ($r6658))))==1);
	 //  @line: 386
	i0660 := $addint((i0660), (-1));
	 assert ($neref((r8661), ($null))==1);
	 //  @line: 387
	$r7659 := $HeapVar[r8661, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 goto Block953;
	 //  @line: 391
Block961:
	 goto Block963, Block962;
	 //  @line: 385
Block951:
	 goto Block958;
	 //  @line: 387
Block953:
	 goto Block956, Block954;
	 //  @line: 391
Block963:
	 //  @line: 391
	 assume ($negInt(($eqref((r9662), ($r3654))))==1);
	 //  @line: 392
	i0660 := $addint((i0660), (-1));
	 assert ($neref((r9662), ($null))==1);
	 //  @line: 393
	$r4655 := $HeapVar[r9662, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($neref((r1651), ($null))==1);
	 //  @line: 393
	 call $z0656 := boolean$java.lang.Object$equals$32((r1651), ($r4655));
	 goto Block964;
	 //  @line: 391
Block962:
	 assume ($eqref((r9662), ($r3654))==1);
	 goto Block958;
	 //  @line: 397
Block958:
	 //  @line: 397
	__ret := -1;
	 return;
	 //  @line: 387
Block956:
	 //  @line: 387
	 assume ($negInt(($neref(($r7659), ($null))))==1);
	 //  @line: 388
	__ret := i0660;
	 return;
	 //  @line: 387
Block954:
	 assume ($neref(($r7659), ($null))==1);
	 goto Block955;
	 //  @line: 393
Block964:
	 goto Block967, Block965;
	 //  @line: 385
Block955:
	 assert ($neref((r8661), ($null))==1);
	 //  @line: 385
	r8661 := $HeapVar[r8661, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block957;
	 //  @line: 393
Block967:
	 //  @line: 393
	 assume ($negInt(($eqint(($z0656), (0))))==1);
	 //  @line: 394
	__ret := i0660;
	 return;
	 //  @line: 393
Block965:
	 assume ($eqint(($z0656), (0))==1);
	 goto Block966;
	 //  @line: 385
Block957:
	 goto Block948;
	 //  @line: 391
Block966:
	 assert ($neref((r9662), ($null))==1);
	 //  @line: 391
	r9662 := $HeapVar[r9662, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block968;
	 //  @line: 391
Block968:
	 goto Block960;
}


// <java.lang.RuntimeException: void <init>()>
procedure void$java.lang.RuntimeException$$la$init$ra$$760(__this : ref);



	 //  @line: 621
// <javaUtilEx.SubList: void <init>(javaUtilEx.AbstractList,int,int)>
procedure void$javaUtilEx.SubList$$la$init$ra$$2549(__this : ref, $param_0 : ref, $param_1 : int, $param_2 : int) returns ($Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1317 : ref;
var $i3319 : int;
var i1316 : int;
var r0314 : ref;
var $i4321 : int;
var i0315 : int;
var $r5324 : ref;
var $r3322 : ref;
var $i2318 : int;
var $r4323 : ref;
var $r2320 : ref;

 //temp local variables 

	 //  @line: 621
Block243:
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block486;
Block486:
	r0314 := __this;
	r1317 := $param_0;
	i0315 := $param_1;
	i1316 := $param_2;
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 622
	 call void$javaUtilEx.AbstractList$$la$init$ra$$2483((r0314));
	 goto Block487;
	 //  @line: 623
Block487:
	 goto Block490, Block488;
	 //  @line: 623
Block490:
	 //  @line: 623
	 assume ($negInt(($geint((i0315), (0))))==1);
	 //  @line: 624
	$r5324 := $newvariable((491));
	 assume ($neref(($newvariable((491))), ($null))==1);
	 assert ($neref(($r5324), ($null))==1);
	 //  @line: 624
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2075(($r5324));
	 goto Block492;
	 //  @line: 623
Block488:
	 assume ($geint((i0315), (0))==1);
	 goto Block489;
	 //  @line: 623
Block492:
	$Exep0 := $r5324;
	 return;
	 //  @line: 625
Block489:
	 assert ($neref((r1317), ($null))==1);
	 //  @line: 625
	 call $i2318 := int$javaUtilEx.AbstractCollection$size$2230((r1317));
	 goto Block493;
	 //  @line: 625
Block493:
	 goto Block494, Block496;
	 //  @line: 625
Block494:
	 assume ($leint((i1316), ($i2318))==1);
	 goto Block495;
	 //  @line: 625
Block496:
	 //  @line: 625
	 assume ($negInt(($leint((i1316), ($i2318))))==1);
	 //  @line: 626
	$r4323 := $newvariable((497));
	 assume ($neref(($newvariable((497))), ($null))==1);
	 assert ($neref(($r4323), ($null))==1);
	 //  @line: 626
	 call void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2075(($r4323));
	 goto Block498;
	 //  @line: 627
Block495:
	 goto Block499, Block501;
	 //  @line: 625
Block498:
	$Exep0 := $r4323;
	 return;
	 //  @line: 627
Block499:
	 assume ($leint((i0315), (i1316))==1);
	 goto Block500;
	 //  @line: 627
Block501:
	 //  @line: 627
	 assume ($negInt(($leint((i0315), (i1316))))==1);
	 goto Block502;
	 //  @line: 629
Block500:
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 629
	$HeapVar[r0314, javaUtilEx.AbstractList$javaUtilEx.SubList$l297] := r1317;
	 goto Block505;
	 //  @line: 628
Block502:
	 //  @line: 628
	$r3322 := $newvariable((503));
	 assume ($neref(($newvariable((503))), ($null))==1);
	 assert ($neref(($r3322), ($null))==1);
	 //  @line: 628
	 call void$javaUtilEx.IllegalArgumentException$$la$init$ra$$2622(($r3322));
	 goto Block504;
	 //  @line: 630
Block505:
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 630
	$HeapVar[r0314, int$javaUtilEx.SubList$offset0] := i0315;
	 //  @line: 631
	$i3319 := $subint((i1316), (i0315));
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 631
	$HeapVar[r0314, int$javaUtilEx.SubList$size0] := $i3319;
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 632
	$r2320 := $HeapVar[r0314, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r2320), ($null))==1);
	 //  @line: 632
	$i4321 := $HeapVar[$r2320, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0314), ($null))==1);
	 //  @line: 632
	$HeapVar[r0314, int$javaUtilEx.AbstractList$modCount0] := $i4321;
	 return;
	 //  @line: 628
Block504:
	$Exep1 := $r3322;
	 return;
}


	 //  @line: 513
// <javaUtilEx.AbstractList: boolean equals(java.lang.Object)>
procedure boolean$javaUtilEx.AbstractList$equals$2497(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r4186 : ref;
var r5188 : ref;
var $z5189 : int;
var $z0174 : int;
var $z1180 : int;
var r0173 : ref;
var $z4184 : int;
var $z3182 : int;
var $r6177 : ref;
var r3179 : ref;
var r1172 : ref;
var $z2181 : int;
var $z6190 : int;
var r2176 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 513
Block271:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block272;
Block272:
	r0173 := __this;
	r1172 := $param_0;
	 goto Block273;
	 //  @line: 514
Block273:
	 goto Block274, Block276;
	 //  @line: 514
Block274:
	 assume ($neref((r1172), (r0173))==1);
	 goto Block275;
	 //  @line: 514
Block276:
	 //  @line: 514
	 assume ($negInt(($neref((r1172), (r0173))))==1);
	 //  @line: 515
	__ret := 1;
	 return;
	 //  @line: 516
Block275:
	 //  @line: 516
	$z0174 := $instanceof((r1172), (javaUtilEx.List));
	 goto Block277;
	 //  @line: 516
Block277:
	 goto Block280, Block278;
	 //  @line: 516
Block280:
	 //  @line: 516
	 assume ($negInt(($neint(($z0174), (0))))==1);
	 //  @line: 517
	__ret := 0;
	 return;
	 //  @line: 516
Block278:
	 assume ($neint(($z0174), (0))==1);
	 goto Block279;
	 //  @line: 519
Block279:
	 assert ($neref((r0173), ($null))==1);
	 //  @line: 519
	 call r2176, $caughtEx1 := javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2494((r0173));
	 goto Block281, Block283;
	 //  @line: 519
Block281:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block282;
	 //  @line: 519
Block283:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block284;
	 //  @line: 519
Block282:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 519
Block284:
	 goto Block285;
	 //  @line: 520
Block285:
	 //  @line: 520
	$r6177 := r1172;
	 assert ($neref(($r6177), ($null))==1);
	 //  @line: 520
	 call r3179 := javaUtilEx.ListIterator$javaUtilEx.List$listIterator$2522(($r6177));
	 goto Block286;
	 //  @line: 521
Block286:
	 assert ($neref((r2176), ($null))==1);
	 //  @line: 521
	 call $z1180 := boolean$javaUtilEx.ListIterator$hasNext$2525((r2176));
	 goto Block287;
	 //  @line: 521
Block287:
	 goto Block288, Block290;
	 //  @line: 521
Block288:
	 assume ($eqint(($z1180), (0))==1);
	 goto Block289;
	 //  @line: 521
Block290:
	 //  @line: 521
	 assume ($negInt(($eqint(($z1180), (0))))==1);
	 assert ($neref((r3179), ($null))==1);
	 //  @line: 527
	 call $z4184 := boolean$javaUtilEx.ListIterator$hasNext$2525((r3179));
	 goto Block291;
	 //  @line: 527
Block289:
	 assert ($neref((r2176), ($null))==1);
	 //  @line: 527
	 call $z2181 := boolean$javaUtilEx.ListIterator$hasNext$2525((r2176));
	 goto Block306;
	 //  @line: 527
Block291:
	 goto Block293, Block292;
	 //  @line: 527
Block306:
	 goto Block307, Block309;
	 //  @line: 527
Block293:
	 //  @line: 527
	 assume ($negInt(($eqint(($z4184), (0))))==1);
	 assert ($neref((r2176), ($null))==1);
	 //  @line: 522
	 call r4186 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r2176));
	 assert ($neref((r3179), ($null))==1);
	 //  @line: 523
	 call r5188 := java.lang.Object$javaUtilEx.ListIterator$next$2526((r3179));
	 goto Block294;
	 //  @line: 527
Block292:
	 assume ($eqint(($z4184), (0))==1);
	 goto Block289;
	 //  @line: 527
Block307:
	 assume ($neint(($z2181), (0))==1);
	 goto Block308;
	 //  @line: 527
Block309:
	 //  @line: 527
	 assume ($negInt(($neint(($z2181), (0))))==1);
	 assert ($neref((r3179), ($null))==1);
	 //  @line: 527
	 call $z3182 := boolean$javaUtilEx.ListIterator$hasNext$2525((r3179));
	 goto Block310;
	 //  @line: 524
Block294:
	 goto Block297, Block295;
	 //  @line: 527
Block308:
	 //  @line: 527
	$z6190 := 0;
	 goto Block313;
	 //  @line: 527
Block310:
	 goto Block312, Block311;
	 //  @line: 524
Block297:
	 //  @line: 524
	 assume ($negInt(($neref((r4186), ($null))))==1);
	 goto Block298;
	 //  @line: 524
Block295:
	 assume ($neref((r4186), ($null))==1);
	 goto Block296;
	 //  @line: 527
Block313:
	 //  @line: 527
	__ret := $z6190;
	 return;
	 //  @line: 527
Block312:
	 //  @line: 527
	 assume ($negInt(($neint(($z3182), (0))))==1);
	 //  @line: 527
	$z6190 := 1;
	 goto Block313;
	 //  @line: 527
Block311:
	 assume ($neint(($z3182), (0))==1);
	 goto Block308;
	 //  @line: 525
Block298:
	 goto Block301, Block299;
	 //  @line: 524
Block296:
	 assert ($neref((r4186), ($null))==1);
	 //  @line: 524
	 call $z5189 := boolean$java.lang.Object$equals$32((r4186), (r5188));
	 goto Block303;
	 //  @line: 525
Block301:
	 //  @line: 525
	 assume ($negInt(($neref((r5188), ($null))))==1);
	 goto Block302;
	 //  @line: 525
Block299:
	 assume ($neref((r5188), ($null))==1);
	 goto Block300;
	 //  @line: 524
Block303:
	 goto Block305, Block304;
	 //  @line: 526
Block302:
	 goto Block286;
	 //  @line: 525
Block300:
	 //  @line: 525
	__ret := 0;
	 return;
	 //  @line: 524
Block305:
	 //  @line: 524
	 assume ($negInt(($neint(($z5189), (0))))==1);
	 goto Block300;
	 //  @line: 524
Block304:
	 assume ($neint(($z5189), (0))==1);
	 goto Block302;
}


// <javaUtilEx.Collection: int size()>
procedure int$javaUtilEx.Collection$size$2241(__this : ref) returns (__ret : int);



	 //  @line: 489
// <javaUtilEx.LinkedList: java.lang.Object peekFirst()>
procedure java.lang.Object$javaUtilEx.LinkedList$peekFirst$2656(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1682 : ref;
var r0680 : ref;
var $i0681 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 489
Block1006:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1007;
Block1007:
	r0680 := __this;
	 assert ($neref((r0680), ($null))==1);
	 //  @line: 490
	$i0681 := $HeapVar[r0680, int$javaUtilEx.LinkedList$size0];
	 goto Block1008;
	 //  @line: 490
Block1008:
	 goto Block1009, Block1011;
	 //  @line: 490
Block1009:
	 assume ($neint(($i0681), (0))==1);
	 goto Block1010;
	 //  @line: 490
Block1011:
	 //  @line: 490
	 assume ($negInt(($neint(($i0681), (0))))==1);
	 //  @line: 491
	__ret := $null;
	 return;
	 //  @line: 492
Block1010:
	 assert ($neref((r0680), ($null))==1);
	 //  @line: 492
	 call $r1682, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$getFirst$2631((r0680));
	 goto Block1014, Block1012;
	 //  @line: 492
Block1014:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1015;
	 //  @line: 492
Block1012:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1013;
	 //  @line: 492
Block1015:
	 goto Block1016;
	 //  @line: 492
Block1013:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 492
Block1016:
	 //  @line: 492
	__ret := $r1682;
	 return;
}


// <javaUtilEx.Collection: javaUtilEx.Iterator iterator()>
procedure javaUtilEx.Iterator$javaUtilEx.Collection$iterator$2244(__this : ref) returns (__ret : ref);



// procedure is generated by joogie.
function {:inline true} $instanceof($param00 : ref, $param11 : classConst) returns (__ret : int);



// <java.lang.StringBuilder: java.lang.StringBuilder append(java.lang.String)>
procedure java.lang.StringBuilder$java.lang.StringBuilder$append$2266(__this : ref, $param_0 : ref) returns (__ret : ref);



	 //  @line: 660
// <javaUtilEx.SubList: java.lang.Object remove(int)>
procedure java.lang.Object$javaUtilEx.SubList$remove$2554(__this : ref, $param_0 : int) returns (__ret : ref, $Exep2 : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0350 : ref;
var $i3358 : int;
var i0351 : int;
var $i2353 : int;
var $r3357 : ref;
var r1356 : ref;
var $i1352 : int;
var $i4359 : int;
var $i5360 : int;
var $r2354 : ref;

 //temp local variables 
var $caughtEx4 : ref;
var $caughtEx3 : ref;
var $caughtEx5 : ref;

	 //  @line: 660
Block553:
	$caughtEx5 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block554;
Block554:
	r0350 := __this;
	i0351 := $param_0;
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 661
	 call $caughtEx3 := void$javaUtilEx.SubList$rangeCheck$2561((r0350), (i0351));
	 goto Block557, Block555;
Block557:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block558;
Block555:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block556;
Block558:
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 662
	 call $caughtEx4 := void$javaUtilEx.SubList$checkForComodification$2564((r0350));
	 goto Block559, Block561;
Block556:
	$Exep0 := $caughtEx3;
	 return;
Block559:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block560;
Block561:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block562;
Block560:
	$Exep1 := $caughtEx4;
	 return;
Block562:
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 663
	$r2354 := $HeapVar[r0350, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 663
	$i1352 := $HeapVar[r0350, int$javaUtilEx.SubList$offset0];
	 //  @line: 663
	$i2353 := $addint((i0351), ($i1352));
	 assert ($neref(($r2354), ($null))==1);
	 //  @line: 663
	 call r1356, $caughtEx5 := java.lang.Object$javaUtilEx.AbstractList$remove$2488(($r2354), ($i2353));
	 goto Block563, Block565;
Block563:
	 assume ($neref(($caughtEx5), ($null))==1);
	 goto Block564;
Block565:
	 assume ($eqref(($caughtEx5), ($null))==1);
	 goto Block566;
Block564:
	$Exep2 := $caughtEx5;
	 return;
Block566:
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 664
	$r3357 := $HeapVar[r0350, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r3357), ($null))==1);
	 //  @line: 664
	$i3358 := $HeapVar[$r3357, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 664
	$HeapVar[r0350, int$javaUtilEx.AbstractList$modCount0] := $i3358;
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 665
	$i4359 := $HeapVar[r0350, int$javaUtilEx.SubList$size0];
	 //  @line: 665
	$i5360 := $subint(($i4359), (1));
	 assert ($neref((r0350), ($null))==1);
	 //  @line: 665
	$HeapVar[r0350, int$javaUtilEx.SubList$size0] := $i5360;
	 //  @line: 666
	__ret := r1356;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $gereal($param00 : realVar, $param11 : realVar) returns (__ret : int);



// <javaUtilEx.Iterator: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.Iterator$next$2255(__this : ref) returns (__ret : ref);



	 //  @line: 2
// <javaUtilEx.juLinkedListCreateRemoveRange: void <init>()>
procedure void$javaUtilEx.juLinkedListCreateRemoveRange$$la$init$ra$$2626(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0516 : ref;
Block753:
	r0516 := __this;
	 assert ($neref((r0516), ($null))==1);
	 //  @line: 3
	 call void$java.lang.Object$$la$init$ra$$28((r0516));
	 return;
}


	 //  @line: 441
// <javaUtilEx.LinkedList: java.lang.Object remove()>
procedure java.lang.Object$javaUtilEx.LinkedList$remove$2652(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1672 : ref;
var r0671 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 441
Block997:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block998;
Block998:
	r0671 := __this;
	 assert ($neref((r0671), ($null))==1);
	 //  @line: 442
	 call $r1672, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$removeFirst$2633((r0671));
	 goto Block1001, Block999;
Block1001:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1002;
Block999:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1000;
Block1002:
	 //  @line: 442
	__ret := $r1672;
	 return;
Block1000:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 670
// <javaUtilEx.LinkedList$ListItr: java.lang.Object previous()>
procedure java.lang.Object$javaUtilEx.LinkedList$ListItr$previous$2681(__this : ref) returns (__ret : ref, $Exep1 : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i1828 : int;
var $r3830 : ref;
var $r1826 : ref;
var $i0825 : int;
var $r2827 : ref;
var $r4831 : ref;
var r0824 : ref;
var $i2829 : int;
var $r5832 : ref;

 //temp local variables 
var $caughtEx2 : ref;

	 //  @line: 670
Block1197:
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1198;
Block1198:
	r0824 := __this;
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 671
	$i0825 := $HeapVar[r0824, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 goto Block1199;
	 //  @line: 671
Block1199:
	 goto Block1202, Block1200;
	 //  @line: 671
Block1202:
	 //  @line: 671
	 assume ($negInt(($neint(($i0825), (0))))==1);
	 //  @line: 672
	$r5832 := $newvariable((1203));
	 assume ($neref(($newvariable((1203))), ($null))==1);
	 assert ($neref(($r5832), ($null))==1);
	 //  @line: 672
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r5832));
	 goto Block1204;
	 //  @line: 671
Block1200:
	 assume ($neint(($i0825), (0))==1);
	 goto Block1201;
	 //  @line: 671
Block1204:
	$Exep0 := $r5832;
	 return;
	 //  @line: 674
Block1201:
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 674
	$r1826 := $HeapVar[r0824, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 goto Block1205;
	 //  @line: 674
Block1205:
	 assert ($neref(($r1826), ($null))==1);
	 //  @line: 674
	$r2827 := $HeapVar[$r1826, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 674
	$HeapVar[r0824, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r2827;
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 674
	$HeapVar[r0824, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303] := $r2827;
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 675
	$i1828 := $HeapVar[r0824, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 675
	$i2829 := $subint(($i1828), (1));
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 675
	$HeapVar[r0824, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i2829;
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 676
	 call $caughtEx2 := void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687((r0824));
	 goto Block1206, Block1208;
	 //  @line: 674
Block1206:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1207;
	 //  @line: 674
Block1208:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1209;
	 //  @line: 674
Block1207:
	$Exep1 := $caughtEx2;
	 return;
	 //  @line: 674
Block1209:
	 assert ($neref((r0824), ($null))==1);
	 //  @line: 677
	$r3830 := $HeapVar[r0824, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 assert ($neref(($r3830), ($null))==1);
	 //  @line: 677
	$r4831 := $HeapVar[$r3830, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 //  @line: 677
	__ret := $r4831;
	 return;
}


	 //  @line: 73
// <javaUtilEx.AbstractSequentialList: void <init>()>
procedure void$javaUtilEx.AbstractSequentialList$$la$init$ra$$2578(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0443 : ref;
Block690:
	r0443 := __this;
	 assert ($neref((r0443), ($null))==1);
	 //  @line: 74
	 call void$javaUtilEx.AbstractList$$la$init$ra$$2483((r0443));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $andint($param00 : int, $param11 : int) returns (__ret : int);



	 //  @line: 616
// <javaUtilEx.SubList: int access$208(javaUtilEx.SubList)>
procedure int$javaUtilEx.SubList$access$208$2569($param_0 : ref) returns (__ret : int)
  modifies $HeapVar;
 {
var r0426 : ref;
var $i1428 : int;
var $i0427 : int;
Block681:
	r0426 := $param_0;
	 assert ($neref((r0426), ($null))==1);
	 //  @line: 617
	$i0427 := $HeapVar[r0426, int$javaUtilEx.SubList$size0];
	 //  @line: 617
	$i1428 := $addint(($i0427), (1));
	 assert ($neref((r0426), ($null))==1);
	 //  @line: 617
	$HeapVar[r0426, int$javaUtilEx.SubList$size0] := $i1428;
	 //  @line: 617
	__ret := $i0427;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $shlint($param00 : int, $param11 : int) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $xorint($param00 : int, $param11 : int) returns (__ret : int);



	 //  @line: 669
// <javaUtilEx.SubList: void removeRange(int,int)>
procedure void$javaUtilEx.SubList$removeRange$2555(__this : ref, $param_0 : int, $param_1 : int) returns ($Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $i5367 : int;
var $i7371 : int;
var $r1368 : ref;
var $r2369 : ref;
var $i3365 : int;
var i0362 : int;
var $i4366 : int;
var r0361 : ref;
var $i2363 : int;
var $i6370 : int;
var $i9373 : int;
var i1364 : int;
var $i8372 : int;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 669
Block567:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block568;
Block568:
	r0361 := __this;
	i0362 := $param_0;
	i1364 := $param_1;
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 670
	 call $caughtEx2 := void$javaUtilEx.SubList$checkForComodification$2564((r0361));
	 goto Block569, Block571;
Block569:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block570;
Block571:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block572;
Block570:
	$Exep0 := $caughtEx2;
	 return;
Block572:
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 671
	$r1368 := $HeapVar[r0361, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 671
	$i2363 := $HeapVar[r0361, int$javaUtilEx.SubList$offset0];
	 //  @line: 671
	$i5367 := $addint((i0362), ($i2363));
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 671
	$i3365 := $HeapVar[r0361, int$javaUtilEx.SubList$offset0];
	 //  @line: 671
	$i4366 := $addint((i1364), ($i3365));
	 assert ($neref(($r1368), ($null))==1);
	 //  @line: 671
	 call $caughtEx3 := void$javaUtilEx.AbstractList$removeRange$2499(($r1368), ($i5367), ($i4366));
	 goto Block575, Block573;
Block575:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block576;
Block573:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block574;
Block576:
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 672
	$r2369 := $HeapVar[r0361, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r2369), ($null))==1);
	 //  @line: 672
	$i6370 := $HeapVar[$r2369, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 672
	$HeapVar[r0361, int$javaUtilEx.AbstractList$modCount0] := $i6370;
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 673
	$i8372 := $HeapVar[r0361, int$javaUtilEx.SubList$size0];
	 //  @line: 673
	$i7371 := $subint((i1364), (i0362));
	 //  @line: 673
	$i9373 := $subint(($i8372), ($i7371));
	 assert ($neref((r0361), ($null))==1);
	 //  @line: 673
	$HeapVar[r0361, int$javaUtilEx.SubList$size0] := $i9373;
	 return;
Block574:
	$Exep1 := $caughtEx3;
	 return;
}


	 //  @line: 298
// <javaUtilEx.AbstractCollection: void clear()>
procedure void$javaUtilEx.AbstractCollection$clear$2239(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var $z064 : int;
var r163 : ref;
var r061 : ref;

 //temp local variables 
var $freshlocal0 : ref;

Block106:
	r061 := __this;
	 assert ($neref((r061), ($null))==1);
	 //  @line: 299
	 call r163 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r061));
	 goto Block107;
	 //  @line: 300
Block107:
	 assert ($neref((r163), ($null))==1);
	 //  @line: 300
	 call $z064 := boolean$javaUtilEx.Iterator$hasNext$2254((r163));
	 goto Block108;
	 //  @line: 300
Block108:
	 goto Block109, Block111;
	 //  @line: 300
Block109:
	 assume ($eqint(($z064), (0))==1);
	 goto Block110;
	 //  @line: 300
Block111:
	 //  @line: 300
	 assume ($negInt(($eqint(($z064), (0))))==1);
	 assert ($neref((r163), ($null))==1);
	 //  @line: 301
	 call $freshlocal0 := java.lang.Object$javaUtilEx.Iterator$next$2255((r163));
	 assert ($neref((r163), ($null))==1);
	 //  @line: 302
	 call void$javaUtilEx.Iterator$remove$2256((r163));
	 goto Block107;
	 //  @line: 304
Block110:
	 return;
}


	 //  @line: 90
// <javaUtilEx.IllegalArgumentException: void <init>(java.lang.Throwable)>
procedure void$javaUtilEx.IllegalArgumentException$$la$init$ra$$2625(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1515 : ref;
var r0514 : ref;
Block752:
	r0514 := __this;
	r1515 := $param_0;
	 assert ($neref((r0514), ($null))==1);
	 //  @line: 91
	 call void$java.lang.RuntimeException$$la$init$ra$$763((r0514), (r1515));
	 return;
}


	 //  @line: 616
// <javaUtilEx.SubList: int access$000(javaUtilEx.SubList)>
procedure int$javaUtilEx.SubList$access$000$2565($param_0 : ref) returns (__ret : int) {
var r0417 : ref;
var $i0418 : int;
Block677:
	r0417 := $param_0;
	 assert ($neref((r0417), ($null))==1);
	 //  @line: 617
	$i0418 := $HeapVar[r0417, int$javaUtilEx.SubList$offset0];
	 //  @line: 617
	__ret := $i0418;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $modreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



	 //  @line: 253
// <javaUtilEx.LinkedList: void clear()>
procedure void$javaUtilEx.LinkedList$clear$2641(__this : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r3594 : ref;
var $r4595 : ref;
var r1600 : ref;
var r0591 : ref;
var $i1599 : int;
var $r5596 : ref;
var r7602 : ref;
var $i0598 : int;
var $r2592 : ref;
var $r6597 : ref;
Block851:
	r0591 := __this;
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 254
	$r2592 := $HeapVar[r0591, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r2592), ($null))==1);
	 //  @line: 254
	r7602 := $HeapVar[$r2592, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block852;
	 //  @line: 255
Block852:
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 255
	$r3594 := $HeapVar[r0591, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block853;
	 //  @line: 255
Block853:
	 goto Block856, Block854;
	 //  @line: 255
Block856:
	 //  @line: 255
	 assume ($negInt(($eqref((r7602), ($r3594))))==1);
	 assert ($neref((r7602), ($null))==1);
	 //  @line: 256
	r1600 := $HeapVar[r7602, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r7602), ($null))==1);
	 //  @line: 257
	$HeapVar[r7602, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := $null;
	 assert ($neref((r7602), ($null))==1);
	 //  @line: 257
	$HeapVar[r7602, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := $null;
	 assert ($neref((r7602), ($null))==1);
	 //  @line: 258
	$HeapVar[r7602, java.lang.Object$javaUtilEx.LinkedList$Entry$element300] := $null;
	 //  @line: 259
	r7602 := r1600;
	 goto Block852;
	 //  @line: 255
Block854:
	 assume ($eqref((r7602), ($r3594))==1);
	 goto Block855;
	 //  @line: 261
Block855:
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 261
	$r6597 := $HeapVar[r0591, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block857;
	 //  @line: 261
Block857:
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 261
	$r5596 := $HeapVar[r0591, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 261
	$r4595 := $HeapVar[r0591, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r5596), ($null))==1);
	 //  @line: 261
	$HeapVar[$r5596, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := $r4595;
	 assert ($neref(($r6597), ($null))==1);
	 //  @line: 261
	$HeapVar[$r6597, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := $r4595;
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 262
	$HeapVar[r0591, int$javaUtilEx.LinkedList$size0] := 0;
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 263
	$i0598 := $HeapVar[r0591, int$javaUtilEx.AbstractList$modCount0];
	 //  @line: 263
	$i1599 := $addint(($i0598), (1));
	 assert ($neref((r0591), ($null))==1);
	 //  @line: 263
	$HeapVar[r0591, int$javaUtilEx.AbstractList$modCount0] := $i1599;
	 return;
}


	 //  @line: 232
// <javaUtilEx.LinkedList: boolean remove(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$remove$2640(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r11590 : ref;
var r1577 : ref;
var r10589 : ref;
var $r4582 : ref;
var $r2579 : ref;
var $r7586 : ref;
var $r3581 : ref;
var r0578 : ref;
var $r6585 : ref;
var $r8587 : ref;
var $z0583 : int;

 //temp local variables 
var $caughtEx1 : ref;
var $freshlocal2 : ref;
var $freshlocal3 : ref;

	 //  @line: 232
Block816:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block817;
Block817:
	r0578 := __this;
	r1577 := $param_0;
	 goto Block818;
	 //  @line: 233
Block818:
	 goto Block819, Block821;
	 //  @line: 233
Block819:
	 assume ($neref((r1577), ($null))==1);
	 goto Block820;
	 //  @line: 233
Block821:
	 //  @line: 233
	 assume ($negInt(($neref((r1577), ($null))))==1);
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 234
	$r6585 := $HeapVar[r0578, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r6585), ($null))==1);
	 //  @line: 234
	r10589 := $HeapVar[$r6585, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block822;
	 //  @line: 241
Block820:
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 241
	$r2579 := $HeapVar[r0578, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block837;
	 //  @line: 234
Block822:
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 234
	$r7586 := $HeapVar[r0578, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block823;
	 //  @line: 241
Block837:
	 assert ($neref(($r2579), ($null))==1);
	 //  @line: 241
	r11590 := $HeapVar[$r2579, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block838;
	 //  @line: 234
Block823:
	 goto Block824, Block826;
	 //  @line: 241
Block838:
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 241
	$r3581 := $HeapVar[r0578, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block839;
	 //  @line: 234
Block824:
	 assume ($eqref((r10589), ($r7586))==1);
	 goto Block825;
	 //  @line: 234
Block826:
	 //  @line: 234
	 assume ($negInt(($eqref((r10589), ($r7586))))==1);
	 assert ($neref((r10589), ($null))==1);
	 //  @line: 235
	$r8587 := $HeapVar[r10589, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 goto Block827;
	 //  @line: 241
Block839:
	 goto Block841, Block840;
	 //  @line: 234
Block825:
	 goto Block836;
	 //  @line: 235
Block827:
	 goto Block830, Block828;
	 //  @line: 241
Block841:
	 //  @line: 241
	 assume ($negInt(($eqref((r11590), ($r3581))))==1);
	 assert ($neref((r11590), ($null))==1);
	 //  @line: 242
	$r4582 := $HeapVar[r11590, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($neref((r1577), ($null))==1);
	 //  @line: 242
	 call $z0583 := boolean$java.lang.Object$equals$32((r1577), ($r4582));
	 goto Block842;
	 //  @line: 241
Block840:
	 assume ($eqref((r11590), ($r3581))==1);
	 goto Block836;
	 //  @line: 248
Block836:
	 //  @line: 248
	__ret := 0;
	 return;
	 //  @line: 235
Block830:
	 //  @line: 235
	 assume ($negInt(($neref(($r8587), ($null))))==1);
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 236
	 call $freshlocal2, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0578), (r10589));
	 goto Block833, Block831;
	 //  @line: 235
Block828:
	 assume ($neref(($r8587), ($null))==1);
	 goto Block829;
	 //  @line: 242
Block842:
	 goto Block843, Block845;
	 //  @line: 235
Block833:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block834;
	 //  @line: 235
Block831:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block832;
	 //  @line: 234
Block829:
	 assert ($neref((r10589), ($null))==1);
	 //  @line: 234
	r10589 := $HeapVar[r10589, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block835;
	 //  @line: 242
Block843:
	 assume ($eqint(($z0583), (0))==1);
	 goto Block844;
	 //  @line: 242
Block845:
	 //  @line: 242
	 assume ($negInt(($eqint(($z0583), (0))))==1);
	 assert ($neref((r0578), ($null))==1);
	 //  @line: 243
	 call $freshlocal3, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0578), (r11590));
	 goto Block846, Block848;
	 //  @line: 235
Block834:
	 //  @line: 237
	__ret := 1;
	 return;
	 //  @line: 235
Block832:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 234
Block835:
	 goto Block822;
	 //  @line: 241
Block844:
	 assert ($neref((r11590), ($null))==1);
	 //  @line: 241
	r11590 := $HeapVar[r11590, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block850;
	 //  @line: 242
Block846:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block847;
	 //  @line: 242
Block848:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block849;
	 //  @line: 241
Block850:
	 goto Block838;
	 //  @line: 242
Block847:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 242
Block849:
	 //  @line: 244
	__ret := 1;
	 return;
}


	 //  @line: 207
// <javaUtilEx.AbstractCollection: boolean addAll(javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractCollection$addAll$2236(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $z141 : int;
var r135 : ref;
var $r340 : ref;
var r237 : ref;
var $z038 : int;
var r039 : ref;
var z242 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 207
Block74:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block75;
Block75:
	r039 := __this;
	r135 := $param_0;
	 //  @line: 208
	z242 := 0;
	 assert ($neref((r135), ($null))==1);
	 //  @line: 209
	 call r237 := javaUtilEx.Iterator$javaUtilEx.Collection$iterator$2244((r135));
	 goto Block76;
	 //  @line: 210
Block76:
	 assert ($neref((r237), ($null))==1);
	 //  @line: 210
	 call $z038 := boolean$javaUtilEx.Iterator$hasNext$2254((r237));
	 goto Block77;
	 //  @line: 210
Block77:
	 goto Block80, Block78;
	 //  @line: 210
Block80:
	 //  @line: 210
	 assume ($negInt(($eqint(($z038), (0))))==1);
	 assert ($neref((r237), ($null))==1);
	 //  @line: 211
	 call $r340 := java.lang.Object$javaUtilEx.Iterator$next$2255((r237));
	 assert ($neref((r039), ($null))==1);
	 //  @line: 211
	 call $z141, $caughtEx1 := boolean$javaUtilEx.AbstractCollection$add$2233((r039), ($r340));
	 goto Block81, Block83;
	 //  @line: 210
Block78:
	 assume ($eqint(($z038), (0))==1);
	 goto Block79;
	 //  @line: 210
Block81:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block82;
	 //  @line: 210
Block83:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block84;
	 //  @line: 214
Block79:
	 //  @line: 214
	__ret := z242;
	 return;
	 //  @line: 210
Block82:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 210
Block84:
	 goto Block85;
	 //  @line: 211
Block85:
	 goto Block87, Block86;
	 //  @line: 211
Block87:
	 //  @line: 211
	 assume ($negInt(($eqint(($z141), (0))))==1);
	 //  @line: 212
	z242 := 1;
	 goto Block76;
	 //  @line: 211
Block86:
	 assume ($eqint(($z141), (0))==1);
	 goto Block76;
}


	 //  @line: 719
// <javaUtilEx.SubList$1: java.lang.Object previous()>
procedure java.lang.Object$javaUtilEx.SubList$1$previous$2697(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r3924 : ref;
var $r2923 : ref;
var $z0921 : int;
var r0920 : ref;
var $r1922 : ref;

 //temp local variables 

	 //  @line: 719
Block1319:
	$Exep0 := $null;
	 goto Block1320;
Block1320:
	r0920 := __this;
	 assert ($neref((r0920), ($null))==1);
	 //  @line: 720
	 call $z0921 := boolean$javaUtilEx.SubList$1$hasPrevious$2696((r0920));
	 goto Block1321;
	 //  @line: 720
Block1321:
	 goto Block1322, Block1324;
	 //  @line: 720
Block1322:
	 assume ($eqint(($z0921), (0))==1);
	 goto Block1323;
	 //  @line: 720
Block1324:
	 //  @line: 720
	 assume ($negInt(($eqint(($z0921), (0))))==1);
	 assert ($neref((r0920), ($null))==1);
	 //  @line: 721
	$r2923 := $HeapVar[r0920, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r2923), ($null))==1);
	 //  @line: 721
	 call $r3924 := java.lang.Object$javaUtilEx.ListIterator$previous$2528(($r2923));
	 //  @line: 721
	__ret := $r3924;
	 return;
	 //  @line: 723
Block1323:
	 //  @line: 723
	$r1922 := $newvariable((1325));
	 assume ($neref(($newvariable((1325))), ($null))==1);
	 goto Block1326;
	 //  @line: 723
Block1326:
	 assert ($neref(($r1922), ($null))==1);
	 //  @line: 723
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r1922));
	 goto Block1327;
	 //  @line: 723
Block1327:
	$Exep0 := $r1922;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $gtref($param00 : ref, $param11 : ref) returns (__ret : int);



	 //  @line: 428
// <javaUtilEx.LinkedList: java.lang.Object poll()>
procedure java.lang.Object$javaUtilEx.LinkedList$poll$2651(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0668 : ref;
var $i0669 : int;
var $r1670 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 428
Block986:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block987;
Block987:
	r0668 := __this;
	 assert ($neref((r0668), ($null))==1);
	 //  @line: 429
	$i0669 := $HeapVar[r0668, int$javaUtilEx.LinkedList$size0];
	 goto Block988;
	 //  @line: 429
Block988:
	 goto Block989, Block991;
	 //  @line: 429
Block989:
	 assume ($neint(($i0669), (0))==1);
	 goto Block990;
	 //  @line: 429
Block991:
	 //  @line: 429
	 assume ($negInt(($neint(($i0669), (0))))==1);
	 //  @line: 430
	__ret := $null;
	 return;
	 //  @line: 431
Block990:
	 assert ($neref((r0668), ($null))==1);
	 //  @line: 431
	 call $r1670, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$removeFirst$2633((r0668));
	 goto Block992, Block994;
	 //  @line: 431
Block992:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block993;
	 //  @line: 431
Block994:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block995;
	 //  @line: 431
Block993:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 431
Block995:
	 goto Block996;
	 //  @line: 431
Block996:
	 //  @line: 431
	__ret := $r1670;
	 return;
}


	 //  @line: 776
// <javaUtilEx.LinkedList$DescendingIterator: void remove()>
procedure void$javaUtilEx.LinkedList$DescendingIterator$remove$2691(__this : ref) returns ($Exep0 : ref, $Exep1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0890 : ref;
var $r1891 : ref;

 //temp local variables 
var $caughtEx3 : ref;
var $caughtEx2 : ref;

	 //  @line: 776
Block1278:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1279;
Block1279:
	r0890 := __this;
	 assert ($neref((r0890), ($null))==1);
	 //  @line: 777
	$r1891 := $HeapVar[r0890, javaUtilEx.LinkedList$ListItr$javaUtilEx.LinkedList$DescendingIterator$itr306];
	 assert ($neref(($r1891), ($null))==1);
	 //  @line: 777
	 call $caughtEx2, $caughtEx3 := void$javaUtilEx.LinkedList$ListItr$remove$2684(($r1891));
	 goto Block1282, Block1280;
Block1282:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1283;
Block1280:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1281;
Block1283:
	 goto Block1286, Block1284;
Block1281:
	$Exep0 := $caughtEx2;
	 return;
Block1286:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block1287;
Block1284:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block1285;
Block1287:
	 return;
Block1285:
	$Exep1 := $caughtEx3;
	 return;
}


	 //  @line: 74
// <javaUtilEx.IllegalStateException: void <init>(java.lang.String,java.lang.Throwable)>
procedure void$javaUtilEx.IllegalStateException$$la$init$ra$$2576(__this : ref, $param_0 : ref, $param_1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0438 : ref;
var r2440 : ref;
var r1439 : ref;
Block688:
	r0438 := __this;
	r1439 := $param_0;
	r2440 := $param_1;
	 assert ($neref((r0438), ($null))==1);
	 //  @line: 75
	 call void$java.lang.RuntimeException$$la$init$ra$$762((r0438), (r1439), (r2440));
	 return;
}


	 //  @line: 746
// <javaUtilEx.LinkedList: java.lang.Object remove(javaUtilEx.LinkedList$Entry)>
procedure java.lang.Object$javaUtilEx.LinkedList$remove$2666(__this : ref, $param_0 : ref) returns (__ret : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r8741 : ref;
var $r5733 : ref;
var $i0737 : int;
var $i1738 : int;
var $i2739 : int;
var $r6734 : ref;
var r2731 : ref;
var $i3740 : int;
var $r3730 : ref;
var r0729 : ref;
var $r7735 : ref;
var $r4732 : ref;
var r1728 : ref;

 //temp local variables 

	 //  @line: 746
Block793:
	$Exep0 := $null;
	 goto Block1108;
Block1108:
	r0729 := __this;
	r1728 := $param_0;
	 assert ($neref((r0729), ($null))==1);
	 //  @line: 747
	$r3730 := $HeapVar[r0729, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block1109;
	 //  @line: 747
Block1109:
	 goto Block1110, Block1112;
	 //  @line: 747
Block1110:
	 assume ($neref((r1728), ($r3730))==1);
	 goto Block1111;
	 //  @line: 747
Block1112:
	 //  @line: 747
	 assume ($negInt(($neref((r1728), ($r3730))))==1);
	 //  @line: 748
	$r8741 := $newvariable((1113));
	 assume ($neref(($newvariable((1113))), ($null))==1);
	 assert ($neref(($r8741), ($null))==1);
	 //  @line: 748
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r8741));
	 goto Block1114;
	 //  @line: 750
Block1111:
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 750
	r2731 := $HeapVar[r1728, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 goto Block1115;
	 //  @line: 747
Block1114:
	$Exep0 := $r8741;
	 return;
	 //  @line: 751
Block1115:
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 751
	$r5733 := $HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 751
	$r4732 := $HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref(($r5733), ($null))==1);
	 //  @line: 751
	$HeapVar[$r5733, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := $r4732;
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 752
	$r7735 := $HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 752
	$r6734 := $HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref(($r7735), ($null))==1);
	 //  @line: 752
	$HeapVar[$r7735, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := $r6734;
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 753
	$HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := $null;
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 753
	$HeapVar[r1728, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := $null;
	 assert ($neref((r1728), ($null))==1);
	 //  @line: 754
	$HeapVar[r1728, java.lang.Object$javaUtilEx.LinkedList$Entry$element300] := $null;
	 assert ($neref((r0729), ($null))==1);
	 //  @line: 755
	$i0737 := $HeapVar[r0729, int$javaUtilEx.LinkedList$size0];
	 //  @line: 755
	$i1738 := $subint(($i0737), (1));
	 assert ($neref((r0729), ($null))==1);
	 //  @line: 755
	$HeapVar[r0729, int$javaUtilEx.LinkedList$size0] := $i1738;
	 assert ($neref((r0729), ($null))==1);
	 //  @line: 756
	$i2739 := $HeapVar[r0729, int$javaUtilEx.AbstractList$modCount0];
	 //  @line: 756
	$i3740 := $addint(($i2739), (1));
	 assert ($neref((r0729), ($null))==1);
	 //  @line: 756
	$HeapVar[r0729, int$javaUtilEx.AbstractList$modCount0] := $i3740;
	 //  @line: 757
	__ret := r2731;
	 return;
}


	 //  @line: 704
// <javaUtilEx.SubList$1: boolean hasNext()>
procedure boolean$javaUtilEx.SubList$1$hasNext$2694(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0905 : ref;
var $r1907 : ref;
var $z0910 : int;
var $i1908 : int;
var $i0906 : int;
Block1298:
	r0905 := __this;
	 assert ($neref((r0905), ($null))==1);
	 //  @line: 705
	 call $i0906 := int$javaUtilEx.SubList$1$nextIndex$2698((r0905));
	 assert ($neref((r0905), ($null))==1);
	 //  @line: 705
	$r1907 := $HeapVar[r0905, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 705
	 call $i1908 := int$javaUtilEx.SubList$access$200$2567(($r1907));
	 goto Block1299;
	 //  @line: 705
Block1299:
	 goto Block1300, Block1302;
	 //  @line: 705
Block1300:
	 assume ($geint(($i0906), ($i1908))==1);
	 goto Block1301;
	 //  @line: 705
Block1302:
	 //  @line: 705
	 assume ($negInt(($geint(($i0906), ($i1908))))==1);
	 //  @line: 705
	$z0910 := 1;
	 goto Block1303;
	 //  @line: 705
Block1301:
	 //  @line: 705
	$z0910 := 0;
	 goto Block1303;
	 //  @line: 705
Block1303:
	 //  @line: 705
	__ret := $z0910;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $negReal($param00 : realVar) returns (__ret : int);



	 //  @line: 92
// <javaUtilEx.IllegalStateException: void <init>(java.lang.Throwable)>
procedure void$javaUtilEx.IllegalStateException$$la$init$ra$$2577(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0441 : ref;
var r1442 : ref;
Block689:
	r0441 := __this;
	r1442 := $param_0;
	 assert ($neref((r0441), ($null))==1);
	 //  @line: 93
	 call void$java.lang.RuntimeException$$la$init$ra$$763((r0441), (r1442));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $refarrtoref($param00 : [int]ref) returns (__ret : ref);



	 //  @line: 770
// <javaUtilEx.SubList: void checkForComodification()>
procedure void$javaUtilEx.SubList$checkForComodification$2564(__this : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i1415 : int;
var $r2416 : ref;
var r0412 : ref;
var $i0414 : int;
var $r1413 : ref;

 //temp local variables 

	 //  @line: 770
Block508:
	$Exep0 := $null;
	 goto Block670;
Block670:
	r0412 := __this;
	 assert ($neref((r0412), ($null))==1);
	 //  @line: 771
	$i1415 := $HeapVar[r0412, int$javaUtilEx.AbstractList$modCount0];
	 assert ($neref((r0412), ($null))==1);
	 //  @line: 771
	$r1413 := $HeapVar[r0412, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref(($r1413), ($null))==1);
	 //  @line: 771
	$i0414 := $HeapVar[$r1413, int$javaUtilEx.AbstractList$modCount0];
	 goto Block671;
	 //  @line: 771
Block671:
	 goto Block674, Block672;
	 //  @line: 771
Block674:
	 //  @line: 771
	 assume ($negInt(($eqint(($i1415), ($i0414))))==1);
	 //  @line: 772
	$r2416 := $newvariable((675));
	 assume ($neref(($newvariable((675))), ($null))==1);
	 assert ($neref(($r2416), ($null))==1);
	 //  @line: 772
	 call void$javaUtilEx.ConcurrentModificationException$$la$init$ra$$2570(($r2416));
	 goto Block676;
	 //  @line: 771
Block672:
	 assume ($eqint(($i1415), ($i0414))==1);
	 goto Block673;
	 //  @line: 771
Block676:
	$Exep0 := $r2416;
	 return;
	 //  @line: 773
Block673:
	 return;
}


// procedure is generated by joogie.
function {:inline true} $ltreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 635
// <javaUtilEx.SubList: java.lang.Object set(int,java.lang.Object)>
procedure java.lang.Object$javaUtilEx.SubList$set$2550(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : ref, $Exep2 : ref, $Exep1 : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0325 : ref;
var $r3331 : ref;
var $i1327 : int;
var $i2329 : int;
var $r2330 : ref;
var i0326 : int;
var r1328 : ref;

 //temp local variables 
var $caughtEx5 : ref;
var $caughtEx4 : ref;
var $caughtEx3 : ref;

	 //  @line: 635
Block507:
	$caughtEx5 := $null;
	$caughtEx4 := $null;
	$caughtEx3 := $null;
	$Exep2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block509;
Block509:
	r0325 := __this;
	i0326 := $param_0;
	r1328 := $param_1;
	 assert ($neref((r0325), ($null))==1);
	 //  @line: 636
	 call $caughtEx3 := void$javaUtilEx.SubList$rangeCheck$2561((r0325), (i0326));
	 goto Block512, Block510;
Block512:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block513;
Block510:
	 assume ($neref(($caughtEx3), ($null))==1);
	 goto Block511;
Block513:
	 assert ($neref((r0325), ($null))==1);
	 //  @line: 637
	 call $caughtEx4 := void$javaUtilEx.SubList$checkForComodification$2564((r0325));
	 goto Block516, Block514;
Block511:
	$Exep0 := $caughtEx3;
	 return;
Block516:
	 assume ($eqref(($caughtEx4), ($null))==1);
	 goto Block517;
Block514:
	 assume ($neref(($caughtEx4), ($null))==1);
	 goto Block515;
Block517:
	 assert ($neref((r0325), ($null))==1);
	 //  @line: 638
	$r2330 := $HeapVar[r0325, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 assert ($neref((r0325), ($null))==1);
	 //  @line: 638
	$i1327 := $HeapVar[r0325, int$javaUtilEx.SubList$offset0];
	 //  @line: 638
	$i2329 := $addint((i0326), ($i1327));
	 assert ($neref(($r2330), ($null))==1);
	 //  @line: 638
	 call $r3331, $caughtEx5 := java.lang.Object$javaUtilEx.AbstractList$set$2486(($r2330), ($i2329), (r1328));
	 goto Block520, Block518;
Block515:
	$Exep1 := $caughtEx4;
	 return;
Block520:
	 assume ($eqref(($caughtEx5), ($null))==1);
	 goto Block521;
Block518:
	 assume ($neref(($caughtEx5), ($null))==1);
	 goto Block519;
Block521:
	 //  @line: 638
	__ret := $r3331;
	 return;
Block519:
	$Exep2 := $caughtEx5;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $addref($param00 : ref, $param11 : ref) returns (__ret : ref);



	 //  @line: 131
// <javaUtilEx.AbstractList: java.lang.Object set(int,java.lang.Object)>
procedure java.lang.Object$javaUtilEx.AbstractList$set$2486(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0109 : ref;
var $r2108 : ref;
var i0110 : int;
var r1111 : ref;

 //temp local variables 

	 //  @line: 131
Block146:
	$Exep0 := $null;
	 goto Block147;
Block147:
	r0109 := __this;
	i0110 := $param_0;
	r1111 := $param_1;
	 //  @line: 132
	$r2108 := $newvariable((148));
	 assume ($neref(($newvariable((148))), ($null))==1);
	 assert ($neref(($r2108), ($null))==1);
	 //  @line: 132
	 call void$javaUtilEx.UnsupportedOperationException$$la$init$ra$$2257(($r2108));
	 goto Block149;
Block149:
	$Exep0 := $r2108;
	 return;
}


	 //  @line: 452
// <javaUtilEx.LinkedList: boolean offer(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$offer$2653(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0675 : int;
var r0673 : ref;
var r1674 : ref;
Block1003:
	r0673 := __this;
	r1674 := $param_0;
	 assert ($neref((r0673), ($null))==1);
	 //  @line: 453
	 call $z0675 := boolean$javaUtilEx.LinkedList$add$2639((r0673), (r1674));
	 //  @line: 453
	__ret := $z0675;
	 return;
}


	 //  @line: 730
// <javaUtilEx.SubList$1: int previousIndex()>
procedure int$javaUtilEx.SubList$1$previousIndex$2699(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $i2936 : int;
var $r1932 : ref;
var $i0933 : int;
var $r2934 : ref;
var $i1935 : int;
var r0931 : ref;
Block1329:
	r0931 := __this;
	 assert ($neref((r0931), ($null))==1);
	 //  @line: 731
	$r1932 := $HeapVar[r0931, javaUtilEx.ListIterator$javaUtilEx.SubList$1$i308];
	 assert ($neref(($r1932), ($null))==1);
	 //  @line: 731
	 call $i0933 := int$javaUtilEx.ListIterator$previousIndex$2530(($r1932));
	 assert ($neref((r0931), ($null))==1);
	 //  @line: 731
	$r2934 := $HeapVar[r0931, javaUtilEx.SubList$javaUtilEx.SubList$1$this$0309];
	 //  @line: 731
	 call $i1935 := int$javaUtilEx.SubList$access$000$2565(($r2934));
	 //  @line: 731
	$i2936 := $subint(($i0933), ($i1935));
	 //  @line: 731
	__ret := $i2936;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $addreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



// procedure is generated by joogie.
function {:inline true} $gtreal($param00 : realVar, $param11 : realVar) returns (__ret : int);



	 //  @line: 325
// <javaUtilEx.AbstractList: javaUtilEx.ListIterator listIterator(int)>
procedure javaUtilEx.ListIterator$javaUtilEx.AbstractList$listIterator$2495(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r1162 : ref;
var i0161 : int;
var r0160 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 325
Block158:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block237;
Block237:
	r0160 := __this;
	i0161 := $param_0;
	 assert ($neref((r0160), ($null))==1);
	 //  @line: 326
	 call $caughtEx1 := void$javaUtilEx.AbstractList$rangeCheckForAdd$2500((r0160), (i0161));
	 goto Block240, Block238;
Block240:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block241;
Block238:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block239;
Block241:
	 //  @line: 328
	$r1162 := $newvariable((242));
	 assume ($neref(($newvariable((242))), ($null))==1);
	 assert ($neref(($r1162), ($null))==1);
	 //  @line: 328
	 call void$javaUtilEx.AbstractList$ListItr$$la$init$ra$$2542(($r1162), (r0160), (i0161));
	 //  @line: 328
	__ret := $r1162;
	 return;
Block239:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 655
// <javaUtilEx.LinkedList$ListItr: java.lang.Object next()>
procedure java.lang.Object$javaUtilEx.LinkedList$ListItr$next$2679(__this : ref) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0808 : ref;
var $r4814 : ref;
var $r2812 : ref;
var $r5817 : ref;
var $i0810 : int;
var $i1811 : int;
var $i3816 : int;
var $r3813 : ref;
var $r7819 : ref;
var $i2815 : int;
var $r6818 : ref;
var $r1809 : ref;

 //temp local variables 
var $caughtEx2 : ref;

	 //  @line: 655
Block1178:
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1179;
Block1179:
	r0808 := __this;
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 656
	 call $caughtEx2 := void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687((r0808));
	 goto Block1182, Block1180;
Block1182:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1183;
Block1180:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1181;
Block1183:
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 657
	$i0810 := $HeapVar[r0808, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 657
	$r1809 := $HeapVar[r0808, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 657
	 call $i1811 := int$javaUtilEx.LinkedList$access$100$2670(($r1809));
	 goto Block1184;
Block1181:
	$Exep0 := $caughtEx2;
	 return;
	 //  @line: 657
Block1184:
	 goto Block1185, Block1187;
	 //  @line: 657
Block1185:
	 assume ($neint(($i0810), ($i1811))==1);
	 goto Block1186;
	 //  @line: 657
Block1187:
	 //  @line: 657
	 assume ($negInt(($neint(($i0810), ($i1811))))==1);
	 //  @line: 658
	$r7819 := $newvariable((1188));
	 assume ($neref(($newvariable((1188))), ($null))==1);
	 assert ($neref(($r7819), ($null))==1);
	 //  @line: 658
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r7819));
	 goto Block1189;
	 //  @line: 660
Block1186:
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 660
	$r2812 := $HeapVar[r0808, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 goto Block1190;
	 //  @line: 657
Block1189:
	$Exep1 := $r7819;
	 return;
	 //  @line: 660
Block1190:
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 660
	$HeapVar[r0808, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303] := $r2812;
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 661
	$r3813 := $HeapVar[r0808, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 assert ($neref(($r3813), ($null))==1);
	 //  @line: 661
	$r4814 := $HeapVar[$r3813, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 661
	$HeapVar[r0808, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := $r4814;
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 662
	$i2815 := $HeapVar[r0808, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 //  @line: 662
	$i3816 := $addint(($i2815), (1));
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 662
	$HeapVar[r0808, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i3816;
	 assert ($neref((r0808), ($null))==1);
	 //  @line: 663
	$r5817 := $HeapVar[r0808, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 assert ($neref(($r5817), ($null))==1);
	 //  @line: 663
	$r6818 := $HeapVar[$r5817, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 //  @line: 663
	__ret := $r6818;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $newvariable($param00 : int) returns (__ret : ref);



	 //  @line: 90
// <javaUtilEx.LinkedList: javaUtilEx.LinkedList$Entry access$000(javaUtilEx.LinkedList)>
procedure javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669($param_0 : ref) returns (__ret : ref) {
var r0755 : ref;
var $r1756 : ref;
Block1132:
	r0755 := $param_0;
	 assert ($neref((r0755), ($null))==1);
	 //  @line: 91
	$r1756 := $HeapVar[r0755, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 //  @line: 91
	__ret := $r1756;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $geint(x : int, y : int) returns (__ret : int) {
if (x >= y) then 1 else 0
}


// procedure is generated by joogie.
function {:inline true} $shlref($param00 : ref, $param11 : ref) returns (__ret : int);



// procedure is generated by joogie.
function {:inline true} $reftointarr($param00 : ref) returns (__ret : [int]int);



	 //  @line: 688
// <javaUtilEx.LinkedList$ListItr: void remove()>
procedure void$javaUtilEx.LinkedList$ListItr$remove$2684(__this : ref) returns ($Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1840 : ref;
var $i2850 : int;
var $r3839 : ref;
var $r10849 : ref;
var $i3851 : int;
var $r11852 : ref;
var $r7844 : ref;
var $r4841 : ref;
var $r9848 : ref;
var $r8845 : ref;
var r0838 : ref;
var $i0846 : int;
var $i1847 : int;
var $r5842 : ref;
var $r12854 : ref;

 //temp local variables 
var $freshlocal4 : ref;
var $caughtEx3 : ref;
var $caughtEx5 : ref;
var $caughtEx2 : ref;

	 //  @line: 688
Block1212:
	$caughtEx5 := $null;
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block1213;
Block1213:
	r0838 := __this;
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 689
	 call $caughtEx2 := void$javaUtilEx.LinkedList$ListItr$checkForComodification$2687((r0838));
	 goto Block1216, Block1214;
Block1216:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block1217;
Block1214:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block1215;
Block1217:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 690
	$r3839 := $HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 assert ($neref(($r3839), ($null))==1);
	 //  @line: 690
	r1840 := $HeapVar[$r3839, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block1218;
Block1215:
	$Exep0 := $caughtEx2;
	 return;
	 //  @line: 692
Block1218:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 692
	$r5842 := $HeapVar[r0838, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 692
	$r4841 := $HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 //  @line: 692
	 call $freshlocal4, $caughtEx3 := java.lang.Object$javaUtilEx.LinkedList$access$200$2671(($r5842), ($r4841));
	 goto Block1219, Block1221;
	 //  @line: 692
Block1219:
	 assume ($neref(($caughtEx3), ($null))==1);
	$caughtEx5 := $caughtEx3;
	 goto Block1220;
	 //  @line: 692
Block1221:
	 assume ($eqref(($caughtEx3), ($null))==1);
	 goto Block1222;
	 //  @line: 702
Block1220:
	 //  @line: 702
	$r11852 := $caughtEx5;
	 goto Block1225;
	 //  @line: 692
Block1222:
	 goto Block1223;
	 //  @line: 694
Block1225:
	 //  @line: 694
	$r12854 := $newvariable((1226));
	 assume ($neref(($newvariable((1226))), ($null))==1);
	 assert ($neref(($r12854), ($null))==1);
	 //  @line: 694
	 call void$javaUtilEx.IllegalStateException$$la$init$ra$$2574(($r12854));
	 goto Block1227;
	 //  @line: 695
Block1223:
	 goto Block1224;
	 //  @line: 694
Block1227:
	$Exep1 := $r12854;
	 return;
	 //  @line: 696
Block1224:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 696
	$r8845 := $HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304];
	 goto Block1228;
	 //  @line: 696
Block1228:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 696
	$r7844 := $HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303];
	 goto Block1229;
	 //  @line: 696
Block1229:
	 goto Block1232, Block1230;
	 //  @line: 696
Block1232:
	 //  @line: 696
	 assume ($negInt(($neref(($r8845), ($r7844))))==1);
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 697
	$HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$next304] := r1840;
	 goto Block1233;
	 //  @line: 696
Block1230:
	 assume ($neref(($r8845), ($r7844))==1);
	 goto Block1231;
	 //  @line: 700
Block1233:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 700
	$r9848 := $HeapVar[r0838, javaUtilEx.LinkedList$javaUtilEx.LinkedList$ListItr$this$0305];
	 //  @line: 700
	 call $r10849 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$access$000$2669(($r9848));
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 700
	$HeapVar[r0838, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$ListItr$lastReturned303] := $r10849;
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 701
	$i2850 := $HeapVar[r0838, int$javaUtilEx.LinkedList$ListItr$expectedModCount0];
	 //  @line: 701
	$i3851 := $addint(($i2850), (1));
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 701
	$HeapVar[r0838, int$javaUtilEx.LinkedList$ListItr$expectedModCount0] := $i3851;
	 return;
	 //  @line: 699
Block1231:
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 699
	$i0846 := $HeapVar[r0838, int$javaUtilEx.LinkedList$ListItr$nextIndex0];
	 goto Block1234;
	 //  @line: 699
Block1234:
	 //  @line: 699
	$i1847 := $subint(($i0846), (1));
	 assert ($neref((r0838), ($null))==1);
	 //  @line: 699
	$HeapVar[r0838, int$javaUtilEx.LinkedList$ListItr$nextIndex0] := $i1847;
	 goto Block1233;
}


// <java.lang.IndexOutOfBoundsException: void <init>()>
procedure void$java.lang.IndexOutOfBoundsException$$la$init$ra$$2075(__this : ref);



// <javaUtilEx.AbstractSequentialList: javaUtilEx.ListIterator listIterator(int)>
procedure javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585(__this : ref, $param_0 : int) returns (__ret : ref);



	 //  @line: 305
// <javaUtilEx.LinkedList: void add(int,java.lang.Object)>
procedure void$javaUtilEx.LinkedList$add$2644(__this : ref, $param_0 : int, $param_1 : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var i0615 : int;
var r1614 : ref;
var $i1616 : int;
var r0613 : ref;
var $r3619 : ref;

 //temp local variables 
var $freshlocal2 : ref;
var $caughtEx1 : ref;

	 //  @line: 305
Block871:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block872;
Block872:
	r0613 := __this;
	i0615 := $param_0;
	r1614 := $param_1;
	 assert ($neref((r0613), ($null))==1);
	 //  @line: 306
	$i1616 := $HeapVar[r0613, int$javaUtilEx.LinkedList$size0];
	 goto Block873;
	 //  @line: 306
Block873:
	 goto Block874, Block876;
	 //  @line: 306
Block874:
	 assume ($neint((i0615), ($i1616))==1);
	 goto Block875;
	 //  @line: 306
Block876:
	 //  @line: 306
	 assume ($negInt(($neint((i0615), ($i1616))))==1);
	 assert ($neref((r0613), ($null))==1);
	 //  @line: 307
	$r3619 := $HeapVar[r0613, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block877;
	 //  @line: 306
Block875:
	 assert ($neref((r0613), ($null))==1);
	 //  @line: 306
	 call $r3619, $caughtEx1 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$entry$2646((r0613), (i0615));
	 goto Block880, Block878;
	 //  @line: 306
Block877:
	 assert ($neref((r0613), ($null))==1);
	 //  @line: 306
	 call $freshlocal2 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665((r0613), (r1614), ($r3619));
	 goto Block882;
	 //  @line: 306
Block880:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block881;
	 //  @line: 306
Block878:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block879;
	 //  @line: 307
Block882:
	 return;
	 //  @line: 306
Block881:
	 goto Block877;
	 //  @line: 306
Block879:
	$Exep0 := $caughtEx1;
	 return;
}


// <javaUtilEx.List: javaUtilEx.ListIterator listIterator()>
procedure javaUtilEx.ListIterator$javaUtilEx.List$listIterator$2522(__this : ref) returns (__ret : ref);



	 //  @line: 169
// <javaUtilEx.LinkedList: void addFirst(java.lang.Object)>
procedure void$javaUtilEx.LinkedList$addFirst$2635(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0557 : ref;
var $r3560 : ref;
var r1558 : ref;
var $r2559 : ref;

 //temp local variables 
var $freshlocal0 : ref;

Block806:
	r0557 := __this;
	r1558 := $param_0;
	 assert ($neref((r0557), ($null))==1);
	 //  @line: 170
	$r2559 := $HeapVar[r0557, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r2559), ($null))==1);
	 //  @line: 170
	$r3560 := $HeapVar[$r2559, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref((r0557), ($null))==1);
	 //  @line: 170
	 call $freshlocal0 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665((r0557), (r1558), ($r3560));
	 return;
}


	 //  @line: 44
// <javaUtilEx.NoSuchElementException: void <init>()>
procedure void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(__this : ref)  requires ($neref((__this), ($null))==1);
 {
var r0432 : ref;
Block684:
	r0432 := __this;
	 assert ($neref((r0432), ($null))==1);
	 //  @line: 45
	 call void$java.lang.RuntimeException$$la$init$ra$$760((r0432));
	 return;
}


	 //  @line: 113
// <javaUtilEx.LinkedList: void <init>(javaUtilEx.Collection)>
procedure void$javaUtilEx.LinkedList$$la$init$ra$$2630(__this : ref, $param_0 : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0534 : ref;
var r1535 : ref;

 //temp local variables 
var $freshlocal2 : int;
var $caughtEx1 : ref;

	 //  @line: 113
Block769:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block770;
Block770:
	r0534 := __this;
	r1535 := $param_0;
	 assert ($neref((r0534), ($null))==1);
	 //  @line: 114
	 call void$javaUtilEx.LinkedList$$la$init$ra$$2629((r0534));
	 assert ($neref((r0534), ($null))==1);
	 //  @line: 115
	 call $freshlocal2, $caughtEx1 := boolean$javaUtilEx.AbstractCollection$addAll$2236((r0534), (r1535));
	 goto Block773, Block771;
Block773:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block774;
Block771:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block772;
Block774:
	 return;
Block772:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 330
// <javaUtilEx.AbstractList$Itr: void <init>(javaUtilEx.AbstractList,javaUtilEx.AbstractList$1)>
procedure void$javaUtilEx.AbstractList$Itr$$la$init$ra$$2539(__this : ref, $param_0 : ref, $param_1 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1259 : ref;
var r0258 : ref;
var r2260 : ref;
Block403:
	r0258 := __this;
	r1259 := $param_0;
	r2260 := $param_1;
	 assert ($neref((r0258), ($null))==1);
	 //  @line: 331
	 call void$javaUtilEx.AbstractList$Itr$$la$init$ra$$2534((r0258), (r1259));
	 return;
}


	 //  @line: 353
// <javaUtilEx.LinkedList: int indexOf(java.lang.Object)>
procedure int$javaUtilEx.LinkedList$indexOf$2647(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r9648 : ref;
var $r5643 : ref;
var r8647 : ref;
var $r6644 : ref;
var r0637 : ref;
var $r7645 : ref;
var $r3640 : ref;
var $r4641 : ref;
var r1636 : ref;
var $r2638 : ref;
var $z0642 : int;
var i0646 : int;
Block917:
	r0637 := __this;
	r1636 := $param_0;
	 //  @line: 354
	i0646 := 0;
	 goto Block918;
	 //  @line: 355
Block918:
	 goto Block919, Block921;
	 //  @line: 355
Block919:
	 assume ($neref((r1636), ($null))==1);
	 goto Block920;
	 //  @line: 355
Block921:
	 //  @line: 355
	 assume ($negInt(($neref((r1636), ($null))))==1);
	 assert ($neref((r0637), ($null))==1);
	 //  @line: 356
	$r5643 := $HeapVar[r0637, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r5643), ($null))==1);
	 //  @line: 356
	r8647 := $HeapVar[$r5643, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block922;
	 //  @line: 362
Block920:
	 assert ($neref((r0637), ($null))==1);
	 //  @line: 362
	$r2638 := $HeapVar[r0637, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block933;
	 //  @line: 356
Block922:
	 assert ($neref((r0637), ($null))==1);
	 //  @line: 356
	$r6644 := $HeapVar[r0637, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block923;
	 //  @line: 362
Block933:
	 assert ($neref(($r2638), ($null))==1);
	 //  @line: 362
	r9648 := $HeapVar[$r2638, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block934;
	 //  @line: 356
Block923:
	 goto Block924, Block926;
	 //  @line: 362
Block934:
	 assert ($neref((r0637), ($null))==1);
	 //  @line: 362
	$r3640 := $HeapVar[r0637, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block935;
	 //  @line: 356
Block924:
	 assume ($eqref((r8647), ($r6644))==1);
	 goto Block925;
	 //  @line: 356
Block926:
	 //  @line: 356
	 assume ($negInt(($eqref((r8647), ($r6644))))==1);
	 assert ($neref((r8647), ($null))==1);
	 //  @line: 357
	$r7645 := $HeapVar[r8647, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 goto Block927;
	 //  @line: 362
Block935:
	 goto Block937, Block936;
	 //  @line: 356
Block925:
	 goto Block932;
	 //  @line: 357
Block927:
	 goto Block930, Block928;
	 //  @line: 362
Block937:
	 //  @line: 362
	 assume ($negInt(($eqref((r9648), ($r3640))))==1);
	 assert ($neref((r9648), ($null))==1);
	 //  @line: 363
	$r4641 := $HeapVar[r9648, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($neref((r1636), ($null))==1);
	 //  @line: 363
	 call $z0642 := boolean$java.lang.Object$equals$32((r1636), ($r4641));
	 goto Block938;
	 //  @line: 362
Block936:
	 assume ($eqref((r9648), ($r3640))==1);
	 goto Block932;
	 //  @line: 368
Block932:
	 //  @line: 368
	__ret := -1;
	 return;
	 //  @line: 357
Block930:
	 //  @line: 357
	 assume ($negInt(($neref(($r7645), ($null))))==1);
	 //  @line: 358
	__ret := i0646;
	 return;
	 //  @line: 357
Block928:
	 assume ($neref(($r7645), ($null))==1);
	 goto Block929;
	 //  @line: 363
Block938:
	 goto Block941, Block939;
	 //  @line: 359
Block929:
	 //  @line: 359
	i0646 := $addint((i0646), (1));
	 goto Block931;
	 //  @line: 363
Block941:
	 //  @line: 363
	 assume ($negInt(($eqint(($z0642), (0))))==1);
	 //  @line: 364
	__ret := i0646;
	 return;
	 //  @line: 363
Block939:
	 assume ($eqint(($z0642), (0))==1);
	 goto Block940;
	 //  @line: 356
Block931:
	 assert ($neref((r8647), ($null))==1);
	 //  @line: 356
	r8647 := $HeapVar[r8647, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block922;
	 //  @line: 365
Block940:
	 //  @line: 365
	i0646 := $addint((i0646), (1));
	 goto Block942;
	 //  @line: 362
Block942:
	 assert ($neref((r9648), ($null))==1);
	 //  @line: 362
	r9648 := $HeapVar[r9648, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 goto Block934;
}


	 //  @line: 770
// <javaUtilEx.LinkedList$DescendingIterator: boolean hasNext()>
procedure boolean$javaUtilEx.LinkedList$DescendingIterator$hasNext$2689(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $z0886 : int;
var r0884 : ref;
var $r1885 : ref;
Block1267:
	r0884 := __this;
	 assert ($neref((r0884), ($null))==1);
	 //  @line: 771
	$r1885 := $HeapVar[r0884, javaUtilEx.LinkedList$ListItr$javaUtilEx.LinkedList$DescendingIterator$itr306];
	 assert ($neref(($r1885), ($null))==1);
	 //  @line: 771
	 call $z0886 := boolean$javaUtilEx.LinkedList$ListItr$hasPrevious$2680(($r1885));
	 //  @line: 771
	__ret := $z0886;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $divreal($param00 : realVar, $param11 : realVar) returns (__ret : realVar);



	 //  @line: 233
// <javaUtilEx.AbstractList: void clear()>
procedure void$javaUtilEx.AbstractList$clear$2491(__this : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $i0144 : int;
var r0142 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 233
Block209:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block210;
Block210:
	r0142 := __this;
	 assert ($neref((r0142), ($null))==1);
	 //  @line: 234
	 call $i0144 := int$javaUtilEx.AbstractCollection$size$2230((r0142));
	 assert ($neref((r0142), ($null))==1);
	 //  @line: 234
	 call $caughtEx1 := void$javaUtilEx.AbstractList$removeRange$2499((r0142), (0), ($i0144));
	 goto Block213, Block211;
Block213:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block214;
Block211:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block212;
Block214:
	 return;
Block212:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 83
// <javaUtilEx.ConcurrentModificationException: void <init>(java.lang.String)>
procedure void$javaUtilEx.ConcurrentModificationException$$la$init$ra$$2571(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0430 : ref;
var r1431 : ref;
Block683:
	r0430 := __this;
	r1431 := $param_0;
	 assert ($neref((r0430), ($null))==1);
	 //  @line: 84
	 call void$java.lang.RuntimeException$$la$init$ra$$761((r0430), (r1431));
	 return;
}


// procedure is generated by joogie.
function {:inline true} $realtoint($param00 : realVar) returns (__ret : int);



	 //  @line: 587
// <javaUtilEx.LinkedList: boolean removeLastOccurrence(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$removeLastOccurrence$2663(__this : ref, $param_0 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r11712 : ref;
var $r7708 : ref;
var $r2701 : ref;
var $r6707 : ref;
var $r3703 : ref;
var $z0705 : int;
var r0700 : ref;
var r1699 : ref;
var $r8709 : ref;
var r10711 : ref;
var $r4704 : ref;

 //temp local variables 
var $caughtEx1 : ref;
var $freshlocal2 : ref;
var $freshlocal3 : ref;

	 //  @line: 587
Block1063:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1064;
Block1064:
	r0700 := __this;
	r1699 := $param_0;
	 goto Block1065;
	 //  @line: 588
Block1065:
	 goto Block1066, Block1068;
	 //  @line: 588
Block1066:
	 assume ($neref((r1699), ($null))==1);
	 goto Block1067;
	 //  @line: 588
Block1068:
	 //  @line: 588
	 assume ($negInt(($neref((r1699), ($null))))==1);
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 589
	$r6707 := $HeapVar[r0700, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref(($r6707), ($null))==1);
	 //  @line: 589
	r10711 := $HeapVar[$r6707, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block1069;
	 //  @line: 596
Block1067:
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 596
	$r2701 := $HeapVar[r0700, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block1084;
	 //  @line: 589
Block1069:
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 589
	$r7708 := $HeapVar[r0700, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block1070;
	 //  @line: 596
Block1084:
	 assert ($neref(($r2701), ($null))==1);
	 //  @line: 596
	r11712 := $HeapVar[$r2701, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block1085;
	 //  @line: 589
Block1070:
	 goto Block1073, Block1071;
	 //  @line: 596
Block1085:
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 596
	$r3703 := $HeapVar[r0700, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block1086;
	 //  @line: 589
Block1073:
	 //  @line: 589
	 assume ($negInt(($eqref((r10711), ($r7708))))==1);
	 assert ($neref((r10711), ($null))==1);
	 //  @line: 590
	$r8709 := $HeapVar[r10711, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 goto Block1074;
	 //  @line: 589
Block1071:
	 assume ($eqref((r10711), ($r7708))==1);
	 goto Block1072;
	 //  @line: 596
Block1086:
	 goto Block1087, Block1088;
	 //  @line: 590
Block1074:
	 goto Block1075, Block1077;
	 //  @line: 589
Block1072:
	 goto Block1083;
	 //  @line: 596
Block1087:
	 assume ($eqref((r11712), ($r3703))==1);
	 goto Block1083;
	 //  @line: 596
Block1088:
	 //  @line: 596
	 assume ($negInt(($eqref((r11712), ($r3703))))==1);
	 assert ($neref((r11712), ($null))==1);
	 //  @line: 597
	$r4704 := $HeapVar[r11712, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($neref((r1699), ($null))==1);
	 //  @line: 597
	 call $z0705 := boolean$java.lang.Object$equals$32((r1699), ($r4704));
	 goto Block1089;
	 //  @line: 590
Block1075:
	 assume ($neref(($r8709), ($null))==1);
	 goto Block1076;
	 //  @line: 590
Block1077:
	 //  @line: 590
	 assume ($negInt(($neref(($r8709), ($null))))==1);
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 591
	 call $freshlocal2, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0700), (r10711));
	 goto Block1080, Block1078;
	 //  @line: 603
Block1083:
	 //  @line: 603
	__ret := 0;
	 return;
	 //  @line: 597
Block1089:
	 goto Block1092, Block1090;
	 //  @line: 589
Block1076:
	 assert ($neref((r10711), ($null))==1);
	 //  @line: 589
	r10711 := $HeapVar[r10711, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block1082;
	 //  @line: 590
Block1080:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1081;
	 //  @line: 590
Block1078:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1079;
	 //  @line: 597
Block1092:
	 //  @line: 597
	 assume ($negInt(($eqint(($z0705), (0))))==1);
	 assert ($neref((r0700), ($null))==1);
	 //  @line: 598
	 call $freshlocal3, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$remove$2666((r0700), (r11712));
	 goto Block1095, Block1093;
	 //  @line: 597
Block1090:
	 assume ($eqint(($z0705), (0))==1);
	 goto Block1091;
	 //  @line: 589
Block1082:
	 goto Block1069;
	 //  @line: 590
Block1081:
	 //  @line: 592
	__ret := 1;
	 return;
	 //  @line: 590
Block1079:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 597
Block1095:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1096;
	 //  @line: 597
Block1093:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1094;
	 //  @line: 596
Block1091:
	 assert ($neref((r11712), ($null))==1);
	 //  @line: 596
	r11712 := $HeapVar[r11712, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 goto Block1097;
	 //  @line: 597
Block1096:
	 //  @line: 599
	__ret := 1;
	 return;
	 //  @line: 597
Block1094:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 596
Block1097:
	 goto Block1085;
}


	 //  @line: 276
// <javaUtilEx.LinkedList: java.lang.Object get(int)>
procedure java.lang.Object$javaUtilEx.LinkedList$get$2642(__this : ref, $param_0 : int) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var i0604 : int;
var $r1605 : ref;
var $r2606 : ref;
var r0603 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 276
Block859:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block860;
Block860:
	r0603 := __this;
	i0604 := $param_0;
	 assert ($neref((r0603), ($null))==1);
	 //  @line: 277
	 call $r1605, $caughtEx1 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$entry$2646((r0603), (i0604));
	 goto Block861, Block863;
Block861:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block862;
Block863:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block864;
Block862:
	$Exep0 := $caughtEx1;
	 return;
Block864:
	 assert ($neref(($r1605), ($null))==1);
	 //  @line: 277
	$r2606 := $HeapVar[$r1605, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 //  @line: 277
	__ret := $r2606;
	 return;
}


	 //  @line: 419
// <javaUtilEx.LinkedList: java.lang.Object element()>
procedure java.lang.Object$javaUtilEx.LinkedList$element$2650(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0666 : ref;
var $r1667 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 419
Block980:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block981;
Block981:
	r0666 := __this;
	 assert ($neref((r0666), ($null))==1);
	 //  @line: 420
	 call $r1667, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$getFirst$2631((r0666));
	 goto Block984, Block982;
Block984:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block985;
Block982:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block983;
Block985:
	 //  @line: 420
	__ret := $r1667;
	 return;
Block983:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 531
// <javaUtilEx.LinkedList: java.lang.Object pollLast()>
procedure java.lang.Object$javaUtilEx.LinkedList$pollLast$2659(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0689 : ref;
var $i0690 : int;
var $r1691 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 531
Block1039:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1040;
Block1040:
	r0689 := __this;
	 assert ($neref((r0689), ($null))==1);
	 //  @line: 532
	$i0690 := $HeapVar[r0689, int$javaUtilEx.LinkedList$size0];
	 goto Block1041;
	 //  @line: 532
Block1041:
	 goto Block1042, Block1044;
	 //  @line: 532
Block1042:
	 assume ($neint(($i0690), (0))==1);
	 goto Block1043;
	 //  @line: 532
Block1044:
	 //  @line: 532
	 assume ($negInt(($neint(($i0690), (0))))==1);
	 //  @line: 533
	__ret := $null;
	 return;
	 //  @line: 534
Block1043:
	 assert ($neref((r0689), ($null))==1);
	 //  @line: 534
	 call $r1691, $caughtEx1 := java.lang.Object$javaUtilEx.LinkedList$removeLast$2634((r0689));
	 goto Block1047, Block1045;
	 //  @line: 534
Block1047:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1048;
	 //  @line: 534
Block1045:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1046;
	 //  @line: 534
Block1048:
	 goto Block1049;
	 //  @line: 534
Block1046:
	$Exep0 := $caughtEx1;
	 return;
	 //  @line: 534
Block1049:
	 //  @line: 534
	__ret := $r1691;
	 return;
}


	 //  @line: 124
// <javaUtilEx.LinkedList: java.lang.Object getFirst()>
procedure java.lang.Object$javaUtilEx.LinkedList$getFirst$2631(__this : ref) returns (__ret : ref, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r0537 : ref;
var $i0538 : int;
var $r1539 : ref;
var $r4542 : ref;
var $r3541 : ref;
var $r2540 : ref;

 //temp local variables 

	 //  @line: 124
Block775:
	$Exep0 := $null;
	 goto Block776;
Block776:
	r0537 := __this;
	 assert ($neref((r0537), ($null))==1);
	 //  @line: 125
	$i0538 := $HeapVar[r0537, int$javaUtilEx.LinkedList$size0];
	 goto Block777;
	 //  @line: 125
Block777:
	 goto Block778, Block780;
	 //  @line: 125
Block778:
	 assume ($neint(($i0538), (0))==1);
	 goto Block779;
	 //  @line: 125
Block780:
	 //  @line: 125
	 assume ($negInt(($neint(($i0538), (0))))==1);
	 //  @line: 126
	$r4542 := $newvariable((781));
	 assume ($neref(($newvariable((781))), ($null))==1);
	 assert ($neref(($r4542), ($null))==1);
	 //  @line: 126
	 call void$javaUtilEx.NoSuchElementException$$la$init$ra$$2572(($r4542));
	 goto Block782;
	 //  @line: 128
Block779:
	 assert ($neref((r0537), ($null))==1);
	 //  @line: 128
	$r1539 := $HeapVar[r0537, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 goto Block783;
	 //  @line: 125
Block782:
	$Exep0 := $r4542;
	 return;
	 //  @line: 128
Block783:
	 assert ($neref(($r1539), ($null))==1);
	 //  @line: 128
	$r2540 := $HeapVar[$r1539, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref(($r2540), ($null))==1);
	 //  @line: 128
	$r3541 := $HeapVar[$r2540, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 //  @line: 128
	__ret := $r3541;
	 return;
}


	 //  @line: 351
// <javaUtilEx.AbstractList$Itr: boolean hasNext()>
procedure boolean$javaUtilEx.AbstractList$Itr$hasNext$2535(__this : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var $i0224 : int;
var r0222 : ref;
var $z0227 : int;
var $r1223 : ref;
var $i1225 : int;
Block348:
	r0222 := __this;
	 assert ($neref((r0222), ($null))==1);
	 //  @line: 352
	$i0224 := $HeapVar[r0222, int$javaUtilEx.AbstractList$Itr$cursor0];
	 assert ($neref((r0222), ($null))==1);
	 //  @line: 352
	$r1223 := $HeapVar[r0222, javaUtilEx.AbstractList$javaUtilEx.AbstractList$Itr$this$0295];
	 assert ($neref(($r1223), ($null))==1);
	 //  @line: 352
	 call $i1225 := int$javaUtilEx.AbstractCollection$size$2230(($r1223));
	 goto Block349;
	 //  @line: 352
Block349:
	 goto Block352, Block350;
	 //  @line: 352
Block352:
	 //  @line: 352
	 assume ($negInt(($eqint(($i0224), ($i1225))))==1);
	 //  @line: 352
	$z0227 := 1;
	 goto Block353;
	 //  @line: 352
Block350:
	 assume ($eqint(($i0224), ($i1225))==1);
	 goto Block351;
	 //  @line: 352
Block353:
	 //  @line: 352
	__ret := $z0227;
	 return;
	 //  @line: 352
Block351:
	 //  @line: 352
	$z0227 := 0;
	 goto Block353;
}


	 //  @line: 214
// <javaUtilEx.LinkedList: boolean add(java.lang.Object)>
procedure boolean$javaUtilEx.LinkedList$add$2639(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r0573 : ref;
var $r2575 : ref;
var r1574 : ref;

 //temp local variables 
var $freshlocal0 : ref;

Block815:
	r0573 := __this;
	r1574 := $param_0;
	 assert ($neref((r0573), ($null))==1);
	 //  @line: 215
	$r2575 := $HeapVar[r0573, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$header298];
	 assert ($neref((r0573), ($null))==1);
	 //  @line: 215
	 call $freshlocal0 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665((r0573), (r1574), ($r2575));
	 //  @line: 216
	__ret := 1;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $negRef($param00 : ref) returns (__ret : int);



	 //  @line: 616
// <javaUtilEx.SubList: javaUtilEx.AbstractList access$100(javaUtilEx.SubList)>
procedure javaUtilEx.AbstractList$javaUtilEx.SubList$access$100$2566($param_0 : ref) returns (__ret : ref) {
var r0419 : ref;
var $r1420 : ref;
Block678:
	r0419 := $param_0;
	 assert ($neref((r0419), ($null))==1);
	 //  @line: 617
	$r1420 := $HeapVar[r0419, javaUtilEx.AbstractList$javaUtilEx.SubList$l297];
	 //  @line: 617
	__ret := $r1420;
	 return;
}


	 //  @line: 90
// <javaUtilEx.LinkedList: int access$100(javaUtilEx.LinkedList)>
procedure int$javaUtilEx.LinkedList$access$100$2670($param_0 : ref) returns (__ret : int) {
var r0757 : ref;
var $i0758 : int;
Block1133:
	r0757 := $param_0;
	 assert ($neref((r0757), ($null))==1);
	 //  @line: 91
	$i0758 := $HeapVar[r0757, int$javaUtilEx.LinkedList$size0];
	 //  @line: 91
	__ret := $i0758;
	 return;
}


	 //  @line: 52
// <javaUtilEx.IllegalArgumentException: void <init>(java.lang.String)>
procedure void$javaUtilEx.IllegalArgumentException$$la$init$ra$$2623(__this : ref, $param_0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r1510 : ref;
var r0509 : ref;
Block750:
	r0509 := __this;
	r1510 := $param_0;
	 assert ($neref((r0509), ($null))==1);
	 //  @line: 53
	 call void$java.lang.RuntimeException$$la$init$ra$$761((r0509), (r1510));
	 return;
}


	 //  @line: 271
// <javaUtilEx.AbstractCollection: boolean retainAll(javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractCollection$retainAll$2238(__this : ref, $param_0 : ref) returns (__ret : int)  requires ($neref((__this), ($null))==1);
 {
var r255 : ref;
var $z159 : int;
var z260 : int;
var $z056 : int;
var r053 : ref;
var r157 : ref;
var $r358 : ref;
Block97:
	r053 := __this;
	r157 := $param_0;
	 //  @line: 272
	z260 := 0;
	 assert ($neref((r053), ($null))==1);
	 //  @line: 273
	 call r255 := javaUtilEx.Iterator$javaUtilEx.AbstractCollection$iterator$2229((r053));
	 goto Block98;
	 //  @line: 274
Block98:
	 assert ($neref((r255), ($null))==1);
	 //  @line: 274
	 call $z056 := boolean$javaUtilEx.Iterator$hasNext$2254((r255));
	 goto Block99;
	 //  @line: 274
Block99:
	 goto Block100, Block102;
	 //  @line: 274
Block100:
	 assume ($eqint(($z056), (0))==1);
	 goto Block101;
	 //  @line: 274
Block102:
	 //  @line: 274
	 assume ($negInt(($eqint(($z056), (0))))==1);
	 assert ($neref((r255), ($null))==1);
	 //  @line: 275
	 call $r358 := java.lang.Object$javaUtilEx.Iterator$next$2255((r255));
	 assert ($neref((r157), ($null))==1);
	 //  @line: 275
	 call $z159 := boolean$javaUtilEx.Collection$contains$2243((r157), ($r358));
	 goto Block103;
	 //  @line: 280
Block101:
	 //  @line: 280
	__ret := z260;
	 return;
	 //  @line: 275
Block103:
	 goto Block104, Block105;
	 //  @line: 275
Block104:
	 assume ($neint(($z159), (0))==1);
	 goto Block98;
	 //  @line: 275
Block105:
	 //  @line: 275
	 assume ($negInt(($neint(($z159), (0))))==1);
	 assert ($neref((r255), ($null))==1);
	 //  @line: 276
	 call void$javaUtilEx.Iterator$remove$2256((r255));
	 //  @line: 277
	z260 := 1;
	 goto Block98;
}


// <javaUtilEx.ListIterator: void remove()>
procedure void$javaUtilEx.ListIterator$remove$2531(__this : ref);



// procedure is generated by joogie.
function {:inline true} $negInt(x : int) returns (__ret : int) {
if (x == 0) then 1 else 0
}


	 //  @line: 400
// <javaUtilEx.AbstractList$ListItr: java.lang.Object previous()>
procedure java.lang.Object$javaUtilEx.AbstractList$ListItr$previous$2544(__this : ref) returns (__ret : ref, $Exep0 : ref, $Exep1 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var $r4283 : ref;
var r1281 : ref;
var r0276 : ref;
var $i0277 : int;
var i1284 : int;
var $r3282 : ref;
var $r2279 : ref;

 //temp local variables 
var $caughtEx2 : ref;
var $caughtEx3 : ref;

	 //  @line: 400
Block431:
	$caughtEx3 := $null;
	$caughtEx2 := $null;
	$Exep1 := $null;
	$Exep0 := $null;
	 goto Block432;
Block432:
	r0276 := __this;
	 assert ($neref((r0276), ($null))==1);
	 //  @line: 401
	 call $caughtEx2 := void$javaUtilEx.AbstractList$Itr$checkForComodification$2538((r0276));
	 goto Block433, Block435;
Block433:
	 assume ($neref(($caughtEx2), ($null))==1);
	 goto Block434;
Block435:
	 assume ($eqref(($caughtEx2), ($null))==1);
	 goto Block436;
Block434:
	$Exep0 := $caughtEx2;
	 return;
Block436:
	 goto Block437;
	 //  @line: 403
Block437:
	 assert ($neref((r0276), ($null))==1);
	 //  @line: 403
	$i0277 := $HeapVar[r0276, int$javaUtilEx.AbstractList$Itr$cursor0];
	 //  @line: 403
	i1284 := $subint(($i0277), (1));
	 assert ($neref((r0276), ($null))==1);
	 //  @line: 404
	$r2279 := $HeapVar[r0276, javaUtilEx.AbstractList$javaUtilEx.AbstractList$ListItr$this$0296];
	 assert ($neref(($r2279), ($null))==1);
	 //  @line: 404
	 call r1281 := java.lang.Object$javaUtilEx.AbstractList$get$2485(($r2279), (i1284));
	 assert ($neref((r0276), ($null))==1);
	 //  @line: 405
	$HeapVar[r0276, int$javaUtilEx.AbstractList$Itr$cursor0] := i1284;
	 assert ($neref((r0276), ($null))==1);
	 //  @line: 405
	$HeapVar[r0276, int$javaUtilEx.AbstractList$Itr$lastRet0] := i1284;
	 goto Block438;
	 //  @line: 406
Block438:
	 //  @line: 406
	__ret := r1281;
	 return;
}


// procedure is generated by joogie.
function {:inline true} $eqref(x : ref, y : ref) returns (__ret : int) {
if (x == y) then 1 else 0
}


// <java.lang.StringBuilder: java.lang.String toString()>
procedure java.lang.String$java.lang.StringBuilder$toString$2299(__this : ref) returns (__ret : ref);



	 //  @line: 737
// <javaUtilEx.LinkedList: javaUtilEx.LinkedList$Entry addBefore(java.lang.Object,javaUtilEx.LinkedList$Entry)>
procedure javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$addBefore$2665(__this : ref, $param_0 : ref, $param_1 : ref) returns (__ret : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r0723 : ref;
var $i2726 : int;
var $r5719 : ref;
var r3720 : ref;
var $i1725 : int;
var r1717 : ref;
var $r6721 : ref;
var $i3727 : int;
var $i0724 : int;
var r2718 : ref;
var $r7722 : ref;
var $r4716 : ref;
Block1106:
	r0723 := __this;
	r1717 := $param_0;
	r2718 := $param_1;
	 //  @line: 738
	$r4716 := $newvariable((1107));
	 assume ($neref(($newvariable((1107))), ($null))==1);
	 assert ($neref((r2718), ($null))==1);
	 //  @line: 738
	$r5719 := $HeapVar[r2718, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref(($r4716), ($null))==1);
	 //  @line: 738
	 call void$javaUtilEx.LinkedList$Entry$$la$init$ra$$2676(($r4716), (r1717), (r2718), ($r5719));
	 //  @line: 738
	r3720 := $r4716;
	 assert ($neref((r3720), ($null))==1);
	 //  @line: 739
	$r6721 := $HeapVar[r3720, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302];
	 assert ($neref(($r6721), ($null))==1);
	 //  @line: 739
	$HeapVar[$r6721, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301] := r3720;
	 assert ($neref((r3720), ($null))==1);
	 //  @line: 740
	$r7722 := $HeapVar[r3720, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$next301];
	 assert ($neref(($r7722), ($null))==1);
	 //  @line: 740
	$HeapVar[$r7722, javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$Entry$previous302] := r3720;
	 assert ($neref((r0723), ($null))==1);
	 //  @line: 741
	$i0724 := $HeapVar[r0723, int$javaUtilEx.LinkedList$size0];
	 //  @line: 741
	$i1725 := $addint(($i0724), (1));
	 assert ($neref((r0723), ($null))==1);
	 //  @line: 741
	$HeapVar[r0723, int$javaUtilEx.LinkedList$size0] := $i1725;
	 assert ($neref((r0723), ($null))==1);
	 //  @line: 742
	$i2726 := $HeapVar[r0723, int$javaUtilEx.AbstractList$modCount0];
	 //  @line: 742
	$i3727 := $addint(($i2726), (1));
	 assert ($neref((r0723), ($null))==1);
	 //  @line: 742
	$HeapVar[r0723, int$javaUtilEx.AbstractList$modCount0] := $i3727;
	 //  @line: 743
	__ret := r3720;
	 return;
}


	 //  @line: 145
// <javaUtilEx.AbstractSequentialList: void add(int,java.lang.Object)>
procedure void$javaUtilEx.AbstractSequentialList$add$2581(__this : ref, $param_0 : int, $param_1 : ref) returns ($Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var $r3464 : ref;
var $r4466 : ref;
var r0462 : ref;
var i0463 : int;
var r1465 : ref;
var $r5468 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 145
Block705:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block706;
Block706:
	r0462 := __this;
	i0463 := $param_0;
	r1465 := $param_1;
	 goto Block707;
	 //  @line: 146
Block707:
	 assert ($neref((r0462), ($null))==1);
	 //  @line: 146
	 call $r3464 := javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585((r0462), (i0463));
	 assert ($neref(($r3464), ($null))==1);
	 //  @line: 146
	 call void$javaUtilEx.ListIterator$add$2533(($r3464), (r1465));
	 goto Block708;
	 //  @line: 149
Block708:
	 goto Block709;
	 //  @line: 150
Block709:
	 return;
}


	 //  @line: 767
// <javaUtilEx.LinkedList$DescendingIterator: void <init>(javaUtilEx.LinkedList)>
procedure void$javaUtilEx.LinkedList$DescendingIterator$$la$init$ra$$2688(__this : ref, $param_0 : ref) returns ($Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var r1879 : ref;
var $r2880 : ref;
var $r3881 : ref;
var $i0883 : int;
var r0878 : ref;
var $r4882 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 767
Block1116:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block1261;
Block1261:
	r0878 := __this;
	r1879 := $param_0;
	 assert ($neref((r0878), ($null))==1);
	 //  @line: 768
	$HeapVar[r0878, javaUtilEx.LinkedList$javaUtilEx.LinkedList$DescendingIterator$this$0307] := r1879;
	 assert ($neref((r0878), ($null))==1);
	 //  @line: 768
	 call void$java.lang.Object$$la$init$ra$$28((r0878));
	 //  @line: 769
	$r2880 := $newvariable((1262));
	 assume ($neref(($newvariable((1262))), ($null))==1);
	 assert ($neref((r0878), ($null))==1);
	 //  @line: 769
	$r4882 := $HeapVar[r0878, javaUtilEx.LinkedList$javaUtilEx.LinkedList$DescendingIterator$this$0307];
	 assert ($neref((r0878), ($null))==1);
	 //  @line: 769
	$r3881 := $HeapVar[r0878, javaUtilEx.LinkedList$javaUtilEx.LinkedList$DescendingIterator$this$0307];
	 assert ($neref(($r3881), ($null))==1);
	 //  @line: 769
	 call $i0883 := int$javaUtilEx.LinkedList$size$2638(($r3881));
	 assert ($neref(($r2880), ($null))==1);
	 //  @line: 769
	 call $caughtEx1 := void$javaUtilEx.LinkedList$ListItr$$la$init$ra$$2677(($r2880), ($r4882), ($i0883));
	 goto Block1265, Block1263;
Block1265:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block1266;
Block1263:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block1264;
Block1266:
	 assert ($neref((r0878), ($null))==1);
	 //  @line: 769
	$HeapVar[r0878, javaUtilEx.LinkedList$ListItr$javaUtilEx.LinkedList$DescendingIterator$itr306] := $r2880;
	 return;
Block1264:
	$Exep0 := $caughtEx1;
	 return;
}


	 //  @line: 213
// <javaUtilEx.AbstractSequentialList: boolean addAll(int,javaUtilEx.Collection)>
procedure boolean$javaUtilEx.AbstractSequentialList$addAll$2583(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : int, $Exep0 : ref)  requires ($neref((__this), ($null))==1);
 {
var r2483 : ref;
var r1484 : ref;
var $r5489 : ref;
var r0480 : ref;
var z1491 : int;
var r3486 : ref;
var $r6490 : ref;
var $r4488 : ref;
var i0481 : int;
var $z0487 : int;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 213
Block720:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block721;
Block721:
	r0480 := __this;
	i0481 := $param_0;
	r1484 := $param_1;
	 goto Block722;
	 //  @line: 214
Block722:
	 //  @line: 214
	z1491 := 0;
	 assert ($neref((r0480), ($null))==1);
	 //  @line: 215
	 call r2483 := javaUtilEx.ListIterator$javaUtilEx.AbstractSequentialList$listIterator$2585((r0480), (i0481));
	 assert ($neref((r1484), ($null))==1);
	 //  @line: 216
	 call r3486 := javaUtilEx.Iterator$javaUtilEx.Collection$iterator$2244((r1484));
	 goto Block723;
	 //  @line: 217
Block723:
	 assert ($neref((r3486), ($null))==1);
	 //  @line: 217
	 call $z0487 := boolean$javaUtilEx.Iterator$hasNext$2254((r3486));
	 goto Block724;
	 //  @line: 217
Block724:
	 goto Block725, Block727;
	 //  @line: 217
Block725:
	 assume ($eqint(($z0487), (0))==1);
	 goto Block726;
	 //  @line: 217
Block727:
	 //  @line: 217
	 assume ($negInt(($eqint(($z0487), (0))))==1);
	 assert ($neref((r3486), ($null))==1);
	 //  @line: 218
	 call $r4488 := java.lang.Object$javaUtilEx.Iterator$next$2255((r3486));
	 assert ($neref((r2483), ($null))==1);
	 //  @line: 218
	 call void$javaUtilEx.ListIterator$add$2533((r2483), ($r4488));
	 //  @line: 219
	z1491 := 1;
	 goto Block723;
	 //  @line: 221
Block726:
	 //  @line: 221
	__ret := z1491;
	 return;
}


	 //  @line: 289
// <javaUtilEx.LinkedList: java.lang.Object set(int,java.lang.Object)>
procedure java.lang.Object$javaUtilEx.LinkedList$set$2643(__this : ref, $param_0 : int, $param_1 : ref) returns (__ret : ref, $Exep0 : ref)
  modifies $HeapVar;
  requires ($neref((__this), ($null))==1);
 {
var i0608 : int;
var r3611 : ref;
var r0607 : ref;
var r1612 : ref;
var r2610 : ref;

 //temp local variables 
var $caughtEx1 : ref;

	 //  @line: 289
Block865:
	$caughtEx1 := $null;
	$Exep0 := $null;
	 goto Block866;
Block866:
	r0607 := __this;
	i0608 := $param_0;
	r1612 := $param_1;
	 assert ($neref((r0607), ($null))==1);
	 //  @line: 290
	 call r2610, $caughtEx1 := javaUtilEx.LinkedList$Entry$javaUtilEx.LinkedList$entry$2646((r0607), (i0608));
	 goto Block869, Block867;
Block869:
	 assume ($eqref(($caughtEx1), ($null))==1);
	 goto Block870;
Block867:
	 assume ($neref(($caughtEx1), ($null))==1);
	 goto Block868;
Block870:
	 assert ($neref((r2610), ($null))==1);
	 //  @line: 291
	r3611 := $HeapVar[r2610, java.lang.Object$javaUtilEx.LinkedList$Entry$element300];
	 assert ($neref((r2610), ($null))==1);
	 //  @line: 292
	$HeapVar[r2610, java.lang.Object$javaUtilEx.LinkedList$Entry$element300] := r1612;
	 //  @line: 293
	__ret := r3611;
	 return;
Block868:
	$Exep0 := $caughtEx1;
	 return;
}


