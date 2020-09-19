@echo off
cargo build --release
set prg=.\target\release\addini.exe
echo [section1]> ori.ini
echo key1=val1>> ori.ini
echo key2=val2>> ori.ini
echo key3=val3>> ori.ini
echo [section2]>> ori.ini
echo key1=val1>> ori.ini
echo Key2=val2>> ori.ini
echo key3=val3>> ori.ini
echo original:
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
echo Expected: add key4 in section2
%prg%  /fic:ori.ini /section:"section2" /key:"key4" /value:val4 
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: maj key1 in section1
%prg%  /fic:ori.ini /section:"section1" /key:"key1" /value:val5 
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: maj key1 in section2
%prg%  /fic:ori.ini /section:"section2" /key:"key1" /value:val6 
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: add key1 in section5
%prg%  /fic:ori.ini /section:"section5" /key:"key1" /value:val7
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: no change
%prg%  /fic:ori.ini /section:"section2" /key:"key2" /value:val8 /case_sensitive
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: Section2 Key2 added
%prg%  /fic:ori.ini /section:"Section2" /key:"Key2" /value:val8 /case_sensitive
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: Key2 of section2 change of value (and key case change also)
%prg%  /fic:ori.ini /section:"section2" /key:"key2" /value:val9
echo -------------------------------------------
type ori.ini
echo -------------------------------------------
pause