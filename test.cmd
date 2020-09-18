@echo off
cargo build --release
set prg=.\target\release\addini.exe
echo [section1]> ori.ini
echo key1=val1>> ori.ini
echo key2=val2>> ori.ini
echo key3=val3>> ori.ini
echo [section2]>> ori.ini
echo key1=val1>> ori.ini
echo key2=val2>> ori.ini
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
