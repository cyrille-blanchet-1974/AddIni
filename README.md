# AddIni
Add a key ina section of an ini file
parameters: 
   -ini file
   -section
   -key
   -value
   
if key exist change it
If key do not exist create it with value
if no value provided search and delete key
if section do not exist create it ele add key at the end of section
carreful with commented lines (# or ; ant start
if removing key and section contain only this key then remove section also
