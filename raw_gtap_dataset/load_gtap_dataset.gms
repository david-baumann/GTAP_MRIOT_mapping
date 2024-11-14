$Setglobal gtap_dir "C:\Users\d.baumann\OneDrive - Universitaet Bern\Data\GTAP Database\GTAP_Pwr_Data_FLEX\GTAP11\2017"
$Setglobal file_sets "%gtap_dir%\flex_bio_SETS.gdx"
$Setglobal file_data "%gtap_dir%\flex_bio_DAT.gdx"

$ontext
$Setglobal gtap_dir "C:\Users\d.baumann\OneDrive - Universitaet Bern\Data\GTAP Database\_raw\GDX\GTAP10\gtap10a_gdx_AY15707\2014"
$Setglobal file_sets "%gtap_dir%\gsdfset.gdx"
$Setglobal file_data "%gtap_dir%\gsdfdat.gdx"
$offtext

$call 'gdxdump "%file_sets%" format=csv output=ACTS.csv symb=ACTS noHeader '
$call 'gdxdump "%file_sets%" format=csv output=REG.csv  symb=REG  noHeader '

$call 'gdxdump "%file_data%" format=csv output=VDFB.csv symb="VDFB" header="COMM_SOU,COMM_TAR,REG,VALUE" '

$call 'gdxdump "%file_data%" format=csv output=VDPB.csv symb=VDPB header="COMM,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VDGB.csv symb=VDGB header="COMM,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VDIB.csv symb=VDIB header="COMM,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VST.csv  symb=VST  header="COMM,REG,VALUE" '

$call 'gdxdump "%file_data%" format=csv output=VXSB.csv  symb=VXSB  header="COMM,REG_SOU,REG_TAR,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VMFB.csv  symb=VMFB  header="COMM_SOU,COMM_TAR,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VMSB.csv  symb=VMSB  header="COMM,REG_SOU,REG_TAR,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VMPB.csv  symb=VMPB  header="COMM,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VMGB.csv  symb=VMGB  header="COMM,REG,VALUE" '
$call 'gdxdump "%file_data%" format=csv output=VMIB.csv  symb=VMIB  header="COMM,REG,VALUE" '

$call 'gdxdump "%file_data%" format=csv output=EVFB.csv  symb=EVFB  header="FAC,COMM,REG,VALUE" '