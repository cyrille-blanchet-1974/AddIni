#/bin/sh
function pause {
    read -n 120 -p "Press 'Enter' to continue..." ; echo " "
}

cargo build --release
export prg=./target/release/addini
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
cat ori.ini
echo -------------------------------------------
echo Expected: add key4 in section2
$prg  /fic:ori.ini /section:"section2" /key:"key4" /value:val4 
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: maj key1 in section1
$prg  /fic:ori.ini /section:"section1" /key:"key1" /value:val5 
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: maj key1 in section2
$prg  /fic:ori.ini /section:"section2" /key:"key1" /value:val6 
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: add key1 in section5
$prg  /fic:ori.ini /section:"section5" /key:"key1" /value:val7
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: key2 maj  and key2 stay key2
$prg  /fic:ori.ini /section:"section2" /key:"KEY2" /value:val8
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: key2 updated
$prg  /fic:ori.ini /section:"Section2" /key:"key2" /value:val9 
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
echo .
echo .
echo Expected: key2 of section2 updated
$prg  /fic:ori.ini /section:"SeCtIoN2" /key:"KeY2" /value:val10
echo -------------------------------------------
cat ori.ini
echo -------------------------------------------
pause
