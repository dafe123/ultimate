/*
 * Copyright (C) 2009-2012 University of Freiburg
 *
 * This file is part of SMTInterpol.
 *
 * SMTInterpol is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * SMTInterpol is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with SMTInterpol.  If not, see <http://www.gnu.org/licenses/>.
 */
/* SMT-Lib lexer */
package de.uni_freiburg.informatik.ultimate.smtinterpol.smtlib2;
import java.math.BigDecimal;
import java.math.BigInteger;
import com.github.jhoenicke.javacup.runtime.Symbol;
import de.uni_freiburg.informatik.ultimate.util.datastructures.UnifyHash;
import de.uni_freiburg.informatik.ultimate.smtinterpol.util.MySymbolFactory;

/**
 * This is a autogenerated lexer for the smtlib 2 script files.
 * It is generated from smtlib.flex by JFlex.
 */
%%

%class Lexer
%public
%unicode
%implements com.github.jhoenicke.javacup.runtime.Scanner
%type com.github.jhoenicke.javacup.runtime.Symbol
%function next_token
%line
%column

%{
  private StringBuilder string; // NOPMD
  private MySymbolFactory symFactory;
  private final UnifyHash<BigInteger> bignumbers = new UnifyHash<BigInteger>();
  
  public void setSymbolFactory(MySymbolFactory factory) {
    symFactory = factory;
  }

  private Symbol symbol(int type) {
    return symFactory.newSymbol(yytext(), type, yyline+1, yycolumn, yyline+1, yycolumn+yylength());
  }
  private Symbol symbol(int type, Object value) {
    return symFactory.newSymbol(yytext(), type, yyline+1, yycolumn, yyline+1, yycolumn+yylength(), value);
  }
  
  private BigInteger convertNumeral(String numeral) {
	BigInteger result = new BigInteger(numeral);
	int hash = result.hashCode();
	for (BigInteger integer : bignumbers.iterateHashCode(hash)) {
		if (integer.equals(result))
			return integer;
	}
	bignumbers.put(hash, result);
	return result;
  }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments */
Comment = {EndOfLineComment}

EndOfLineComment     = ";" {InputCharacter}* {LineTerminator}?
SMTLetter = [:letter:] | [~!@$%\^&*_+\-=<>.?/] 
SMTLetterDigit = {SMTLetter} | [:digit:]

Numeral = 0 | [1-9][0-9]*
Decimal = {Numeral} "."  0* {Numeral}
HexaDecimal = "#x" [0-9a-fA-F]+
QuotedSymbol = "|" [^|]* "|"
Symbol = {SMTLetter} {SMTLetterDigit}* 
Binary = "#b" [01]+
Keyword = ":" {SMTLetterDigit}+

%state STRING

%%

<YYINITIAL>  {
  "("                    { return symbol(LexerSymbols.LPAR); }
  ")"                    { return symbol(LexerSymbols.RPAR); }

  /* Predefined Symbols */
  "_"                    { return symbol(LexerSymbols.UNDERSCORE, yytext()); }
  "!"                    { return symbol(LexerSymbols.BANG, yytext()); }
  "as"                   { return symbol(LexerSymbols.AS, yytext()); }
  "assert"               { return symbol(LexerSymbols.ASSERT, yytext()); }
  "check-sat"            { return symbol(LexerSymbols.CHECKSAT, yytext()); }
  "continued-execution"  { return symbol(LexerSymbols.CONTINUEDEXECUTION, yytext()); }
  "DECIMAL"              { return symbol(LexerSymbols.DECIMALSYM, yytext()); }
  "declare-sort"         { return symbol(LexerSymbols.DECLARESORT, yytext()); }
  "declare-fun"          { return symbol(LexerSymbols.DECLAREFUN, yytext()); }
  "define-sort"          { return symbol(LexerSymbols.DEFINESORT, yytext()); }
  "define-fun"           { return symbol(LexerSymbols.DEFINEFUN, yytext()); }
  "error"                { return symbol(LexerSymbols.ERRORSYM, yytext()); }
  "exists"               { return symbol(LexerSymbols.EXISTS, yytext()); }
  "exit"                 { return symbol(LexerSymbols.EXIT, yytext()); }
  "false"                { return symbol(LexerSymbols.FALSE, yytext()); }
  "forall"               { return symbol(LexerSymbols.FORALL, yytext()); }
  "get-assertions"       { return symbol(LexerSymbols.GETASSERTIONS, yytext()); }
  "get-assignment"       { return symbol(LexerSymbols.GETASSIGNMENT, yytext()); }
  "get-info"             { return symbol(LexerSymbols.GETINFO, yytext()); }
  "get-interpolants"     { return symbol(LexerSymbols.GETINTERPOLANTS, yytext()); }
  "get-model"            { return symbol(LexerSymbols.GETMODEL, yytext()); }
  "get-option"           { return symbol(LexerSymbols.GETOPTION, yytext()); }
  "get-proof"            { return symbol(LexerSymbols.GETPROOF, yytext()); }
  "get-unsat-core"       { return symbol(LexerSymbols.GETUNSATCORE, yytext()); }
  "get-value"            { return symbol(LexerSymbols.GETVALUE, yytext()); }
  "immediate-exit"       { return symbol(LexerSymbols.IMMEDIATEEXIT, yytext()); }
  "include"              { return symbol(LexerSymbols.INCLUDE, yytext()); }
  "incomplete"           { return symbol(LexerSymbols.INCOMPLETE, yytext()); }
  "let"                  { return symbol(LexerSymbols.LET, yytext()); }
  "logic"                { return symbol(LexerSymbols.LOGIC, yytext()); }
  "none"                 { return symbol(LexerSymbols.NONE, yytext()); }
  "NUMERAL"              { return symbol(LexerSymbols.NUMERALSYM, yytext()); }
  "memout"               { return symbol(LexerSymbols.MEMOUT, yytext()); }
  "par"                  { return symbol(LexerSymbols.PAR, yytext()); }
  "pop"                  { return symbol(LexerSymbols.POP, yytext()); }
  "push"                 { return symbol(LexerSymbols.PUSH, yytext()); }
  "sat"                  { return symbol(LexerSymbols.SAT, yytext()); }
  "success"              { return symbol(LexerSymbols.SUCCESS, yytext()); }
  "set-logic"            { return symbol(LexerSymbols.SETLOGIC, yytext()); }
  "set-info"             { return symbol(LexerSymbols.SETINFO, yytext()); }
  "set-option"           { return symbol(LexerSymbols.SETOPTION, yytext()); }
  "STRING"               { return symbol(LexerSymbols.STRINGSYM, yytext()); }
  "theory"               { return symbol(LexerSymbols.THEORY, yytext()); }
  "true"                 { return symbol(LexerSymbols.TRUE, yytext()); }
  "unknown"              { return symbol(LexerSymbols.UNKNOWN, yytext()); }
  "unsupported"          { return symbol(LexerSymbols.UNSUPPORTED, yytext()); }
  "unsat"                { return symbol(LexerSymbols.UNSAT, yytext()); }
  "simplify"             { return symbol(LexerSymbols.SIMPLIFY, yytext()); }
  "reset"                { return symbol(LexerSymbols.RESET, yytext()); }
  "timed"                { return symbol(LexerSymbols.TIMED, yytext()); }
  "check-allsat"         { return symbol(LexerSymbols.ALLSAT, yytext()); }
  "echo"                 { return symbol(LexerSymbols.ECHO, yytext()); }
  "find-implied-equality" { return symbol(LexerSymbols.FINDIMPLIEDEQUALITY, yytext()); }

  /* Predefined Keywords */
  ":named"               { return symbol(LexerSymbols.CNAMED, yytext()); }
  ":pattern"             { return symbol(LexerSymbols.CPATTERN, yytext()); }
  ":sorts-description"   { return symbol(LexerSymbols.CSORTSDESCRIPTION, yytext()); }
  ":sorts"               { return symbol(LexerSymbols.CSORTS, yytext()); }
  ":funs"                { return symbol(LexerSymbols.CFUNS, yytext()); }
  ":funs-description"    { return symbol(LexerSymbols.CFUNSDESCRIPTION, yytext()); }
  ":definition"          { return symbol(LexerSymbols.CDEFINITION, yytext()); }
  ":extensions"          { return symbol(LexerSymbols.CEXTENSIONS, yytext()); }
  ":language"            { return symbol(LexerSymbols.CLANGUAGE, yytext()); }
  ":theories"            { return symbol(LexerSymbols.CTHEORIES, yytext()); }
  ":notes"               { return symbol(LexerSymbols.CNOTES, yytext()); }
  ":values"              { return symbol(LexerSymbols.CVALUES, yytext()); }
  ":diagnostic-output-channel" { return symbol(LexerSymbols.CDIAGNOSTICOUTPUTCHANNEL, yytext()); }
  ":regular-output-channel"    { return symbol(LexerSymbols.CREGULAROUTPUTCHANNEL, yytext()); }
  ":expand-definitions"  { return symbol(LexerSymbols.CEXPANDDEFINITIONS, yytext()); }
  ":interactive-mode"    { return symbol(LexerSymbols.CINTERACTIVEMODE, yytext()); }
  ":print-success"       { return symbol(LexerSymbols.CPRINTSUCCESS, yytext()); }
  ":verbosity"           { return symbol(LexerSymbols.CVERBOSITY, yytext()); }
  ":produce-assignments" { return symbol(LexerSymbols.CPRODUCEASSIGNMENTS, yytext()); }
  ":produce-models"      { return symbol(LexerSymbols.CPRODUCEMODELS, yytext()); }
  ":produce-proofs"      { return symbol(LexerSymbols.CPRODUCEPROOFS, yytext()); }
  ":produce-unsat-cores" { return symbol(LexerSymbols.CPRODUCEUNSATCORES, yytext()); }
  ":random-seed"         { return symbol(LexerSymbols.CRANDOMSEED, yytext()); }
  ":timeout"             { return symbol(LexerSymbols.CTIMEOUT, yytext()); }
  /* Own keywords */
  ":interpolant-check-mode" { return symbol(LexerSymbols.CINTERPOLANTCHECKMODE, yytext()); }
  ":strong-simplifier"   { return symbol(LexerSymbols.CSTRONGSIMPLIFIER, yytext()); }

  /* Other Symbols and Keywords */
  {QuotedSymbol}         { return symbol(LexerSymbols.SYMBOL, yytext().substring(1, yylength()-1)); }
  {Symbol}               { return symbol(LexerSymbols.SYMBOL, yytext()); }
  {Keyword}              { return symbol(LexerSymbols.KEYWORD, yytext()); }
  
  /* Numbers and Strings */
  {Numeral}              { return symbol(LexerSymbols.NUMERAL, convertNumeral(yytext())); }
  {Decimal}              { return symbol(LexerSymbols.DECIMAL, new BigDecimal(yytext())); }
  {HexaDecimal}          { return symbol(LexerSymbols.HEXADECIMAL, yytext()); }
  {Binary}               { return symbol(LexerSymbols.BINARY, yytext()); }
  \"                     { string = new StringBuilder(); yybegin(STRING); }

 
  /* comments */
  {Comment}              { /* ignore */ }
 
  /* whitespace */
  {WhiteSpace}           { /* ignore */ }
}

<STRING> {
  \"                             { String value = string.toString();
                                   string = null;
                                   yybegin(YYINITIAL);
                                   return symbol(LexerSymbols.STRING, value); }
  [^\"\\]+                       { string.append( yytext() ); }
  \\\"                           { string.append('\"'); }
  \\\\                           { string.append('\\'); }
  \\                             { string.append('\\'); }
}


/* error fallback */
.|\n                             { return symbol(LexerSymbols.error, yytext()); }

<<EOF>>                          { return symbol(LexerSymbols.EOF); }