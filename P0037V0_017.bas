//************************************************************************
// Smart 2 module setup ISQP1
  
mem &DATA_SOURCE_CH8=addr(&SMART2_RESULT1)
mem &DATA_SOURCE_CH9=addr(&SMART2_RESULT2)
mem &DATA_SOURCE_CH10=addr(&SMART2_RESULT3)
mem &DATA_SOURCE_CH11=addr(&SMART2_RESULT4)

mem &SMART2_SETUP1=0322

// 1st digit = frequency select
// 0 =
// 1 = 60hz
// 2 =
// 3 = 50hz
//
// 2nd digit=signal 1 gain
// always = 2
//
// 3rd digit= output rate
// 0 = 0.5hz averaged
// 1 = 1hz averaged
// 2 = 5hz averaged
// 3 = 10hz averaged
// 4 = 20hz averaged
// 5 = 40hz averaged

mem &SMART2_SETUP2=0222

// 1st digit =signal 4 gain
// always = 2
//
// 2nd digit =signal 3 gain
// always = 2
//
// 3rd digit =signal 2 gain
// always = 2
//

mem &SMART2_SETUP3=000

//*******************************************************************************
//Setup Port COM1 for ethernet ASCII 
mem &SERIAL_MODE1=4
mem &SERIAL_ADDRESS1=1
mem &BAUDRATE1=7   

//*******************************************************************************



REG &FT01 = &AUX1
MEM &AUX1_TEXT = "FT01 l/h"
MEM &DISPLAY_FORMAT_AUX1 = 6 //x=0 x.x=6 x.xx=5 x.xxx=4

REG &FT02 = &AUX2
MEM &AUX2_TEXT = "FT02 l/h"
MEM &DISPLAY_FORMAT_AUX2 = 0 //x=0 x.x=6 x.xx=5 x.xxx=4

REG &FT03 = &AUX3
MEM &AUX3_TEXT = "FT03 l/h"
MEM &DISPLAY_FORMAT_AUX3 = 0 //x=0 x.x=6 x.xx=5 x.xxx=4

REG &LT01_percent = &AUX4
MEM &AUX4_TEXT = "LT01 %"
MEM &DISPLAY_FORMAT_AUX4 = 5 //x.xx

REG &LT02_percent = &AUX5
MEM &AUX5_TEXT = "LT02 %"
MEM &DISPLAY_FORMAT_AUX5 = 5 //x.xx

REG &PT01 = &AUX6
MEM &AUX6_TEXT = "PT01 bar"
MEM &DISPLAY_FORMAT_AUX6 = 5 //x.xx

REG &PT02 = &AUX7
MEM &AUX7_TEXT = "PT02 bar"
MEM &DISPLAY_FORMAT_AUX7 = 5 //x.xx

// Ratio of FT01/FT03 range=0 to 10000 = 0.0 to 1.0
REG &R13 = &AUX8
MEM &AUX8_TEXT = "R13 0-1" //. 
MEM &DISPLAY_FORMAT_AUX8 = 0 //x=0 hh.mm.ss=1 x.x=6 x.xx=5 x.xxx=4 x.xxxx=3

REG &TT01 = &AUX9
MEM &AUX9_TEXT = "TT01 C"
MEM &DISPLAY_FORMAT_AUX9 = 5 //x.xx

REG &CV01 = &AUX10
MEM &AUX10_TEXT = "CV01 %"
MEM &DISPLAY_FORMAT_AUX10 = 5 //x.xx
MEM &D2A_AOP4_ZERO = 0
MEM &D2A_AOP4_FULL_SCALE = 10000 
MEM &DATA_SOURCE_ANALOG4 = ADDR(&CV01)

REG &CV02 = &AUX11
MEM &AUX11_TEXT = "CV02 %"
MEM &DISPLAY_FORMAT_AUX11 = 5 //x.xx
MEM &D2A_AOP3_ZERO = 0
MEM &D2A_AOP3_FULL_SCALE = 10000 
MEM &DATA_SOURCE_ANALOG3 = ADDR(&CV02)

REG &PP01_SPD = &AUX12
MEM &AUX12_TEXT = "P01SPD %"
MEM &DISPLAY_FORMAT_AUX12 = 5 //x.xx
MEM &D2A_AOP1_ZERO = 0
MEM &D2A_AOP1_FULL_SCALE = 10000 
MEM &DATA_SOURCE_ANALOG1 = ADDR(&PP01_SPD)

REG &PP02_SPD = &AUX13
MEM &AUX13_TEXT = "P02SPD %"
MEM &DISPLAY_FORMAT_AUX13 = 5 //x.xx
MEM &D2A_AOP2_ZERO = 0
MEM &D2A_AOP2_FULL_SCALE = 10000 
MEM &DATA_SOURCE_ANALOG2 = ADDR(&PP02_SPD)

REG &Time0 = &AUX14
MEM &Time0 = 0 
MEM &AUX14_TEXT = "time"
MEM &DISPLAY_FORMAT_AUX14 = 1 //x=0 hh.mm.ss=1 x.x=6 x.xx=5 x.xxx=4 x.xxxx=3

// Ratio of FT02/FT01 range=0 to 10000 = 0.0 to 10.0
REG &R21 = &AUX15
MEM &R21 = 0
MEM &AUX15_TEXT = "R21 0-10"
MEM &DISPLAY_FORMAT_AUX15 = 0 //x=0 hh.mm.ss=1 x.x=6 x.xx=5 x.xxx=4 x.xxxx=3

REG &DP12 = &AUX16
MEM &DP12 = 0 
MEM &AUX16_TEXT = "DP12 bar"
MEM &DISPLAY_FORMAT_AUX16 = 5 //x.xx

//BitFlags
BIT |AFI = |GPF1
BIT |levelOk = |GPF2
BIT |fd100sc = |GPF3
BIT |t0en = |GPF4
 
//Integer_Variables
REG &lastScanTimeFast = &INTEGER_VARIABLE1
REG &lastScanTimeShort = &INTEGER_VARIABLE2
REG &Temp1 = &INTEGER_VARIABLE3
REG &Temp2 = &INTEGER_VARIABLE4
REG &Temp3 = &INTEGER_VARIABLE5
REG &displayState = &INTEGER_VARIABLE6

REG &plantStatus = &INTEGER_VARIABLE7
MEM &plantStatus = 0
DIM plantStatusMsgArray[] = ["      Plant Contents Unknown",\
                       "      Plant Contents Product Full    ",\
                       "      Plant Contents Product Empty   ",\
                       "      Plant Contents Water Full      ",\
                       "      Plant Contents Water Empty     ",\
                       "      Plant Contents CIP Full        ",\
                       "      Plant Contents CIP Empty       ",\
                       ""]

REG &fd100StepNumber = &INTEGER_VARIABLE8
MEM &fd100StepNumber = 0 
DIM fd100StepMsgArray[] = ["      Step00 Stopped      ",\
                          "      Step01 Record Starting Level      ",\
                          "      Step02 Fill Plant      ",\
                          "      Step03 Fill Plant - Plant Full Product      ",\
                          "      Step04 Pressurise Plant      ",\
                          "      Step05 Production      ",\
                          "      Step06 - Not Used",\
                          "      Step07 - Not Used",\
                          "      Step08 - Not Used",\
                          "      Step09 Deselect      ",\
                          "      Step10 - Not Used",\
                          "      Step11 - Not Used",\
                          "      Step12 - Not Used",\
                          "      Step13 - Not Used",\
                          "      Step14 - Not Used",\
                          "      Step15 - Not Used",\
                          "      Step16 - Not Used",\
                          "      Step17 - Not Used",\
                          "      Step18 - Not Used",\
                          "      Step19 - Not Used",\
                          "      Step20 Fill CIP Tank With Water      ",\
                          "      Step21 Fill Plant With Water - Air Bleed     ",\
                          "      Step22 Fill Plant With Water      ",\
                          "      Step23 Pressurise Plant      ",\
                          "      Step24 Flush To Drain      "      ,\
                          "      Step25 Recirc         ",\
                          "      Step26 - Not Used",\
                          "      Step27 - Not Used",\
                          "      Step28 - Not Used",\
                          "      Step29 Deselect      ",\
                          "      Step30 Fill CIP Tank With Water      ",\
                          "      Step31 Fill Plant With CIP - Air Bleed      ",\
                          "      Step32 Fill Plant With CIP      ",\
                          "      Step33 Pressurise Plant      ",\
                          "      Step34 Recirc       ",\
                          "      Step35 - Not Used",\
                          "      Step36 - Not Used",\
                          "      Step37 - Not Used",\
                          "      Step38 - Not Used",\
                          "      Step39 Deselect      ",\
                          "      Step40 Drain Plant      ",\
                          "      Step41 Drain Plant - Plant Empty      ",\
                          "      Step42 - Not Used",\
                          "      Step43 - Not Used",\
                          "      Step44 - Not Used",\
                          "      Step45 - Not Used",\
                          "      Step46 - Not Used",\
                          "      Step47 - Not Used",\
                          "      Step48 - Not Used",\
                          "      Step49 Deselect      "]


REG &fault = &INTEGER_VARIABLE9
MEM &fault = 0
DIM faultMsgArray[] = ["No Faults       ",\
                       "      Fault01 IV01 Fdbk Fault      ",\
                       "      Fault02 IV01 In Manual      ",\
                       "      Fault03 IV02 Fdbk Fault      ",\
                       "      Fault04 IV02 In Manual      ",\
                       "      Fault05 IV03 Fdbk Fault      ",\
                       "      Fault06 IV03 In Manual      ",\
                       "      Fault07 IV04 Fdbk Fault      ",\
                       "      Fault08 IV04 In Manual      ",\
                       "      Fault09 IV05 Fdbk Fault      ",\
                       "      Fault10 IV05 In Manual      ",\
                       "      Fault11 IV06 Fdbk Fault      ",\
                       "      Fault12 IV06 In Manual      ",\
                       "      Fault13 IV07 Fdbk Fault      ",\
                       "      Fault14 IV07 In Manual      ",\
                       "      Fault15 IV11 Fdbk Fault      ",\
                       "      Fault16 IV11 In Manual      ",\
                       "      Fault17 PP01 Run Fault      ",\
                       "      Fault18 PP01 In Manual      ",\
                       "      Fault19 PP02 Run Fault      ",\
                       "      Fault20 PP02 In Manual      ",\
                       "      Fault21 PRODUCT selected      ",\
                       "      Fault22 DRAIN selected      ",\
                       "      Fault23 RINSE selected      ",\
                       "      Fault24 CIP selected      ",\
                       "      Fault25 Permeate Swing Bend Not In Product Position      ",\
                       "      Fault26 Permeate Swing Bend Not In CIP Position      ",\
                       "      Fault27 Retentate Swing Bend Not In Product Position      ",\
                       "      Fault28 Retentate Swing Bend Not In CIP Position      ",\
                       "      Fault29 Feed Swing Bend Not In Product Position      ",\
                       "      Fault30 Feed Swing Bend Not In CIP Position      ",\
                       "      Fault31 Low Air Pressure      ",\
                       "      Fault32 High Pressure      ",\
                       "      Fault33 Low Water Pressure      ",\
                       "      Fault34 High Temperature      ",\
                       "      Fault35 Low CIP Tank Level      ",\
                       "      Fault36 Low Product Tank Level      ",\
                       "      Fault37 Low Seal Water Pressure      ",\
                       "      Fault38 Product Tank Level Low      ",\
                       "      Fault39 Low Pressure      ",\
                      ""]
                       
REG &Logtime = &INTEGER_VARIABLE10
REG &faultLastLog = &INTEGER_VARIABLE11
REG &fd100StepNumberLastLog = &INTEGER_VARIABLE12
REG &msgCount = &INTEGER_VARIABLE13
REG &T0Hours = &INTEGER_VARIABLE14
REG &T0Minutes = &INTEGER_VARIABLE15
REG &T0Seconds = &INTEGER_VARIABLE16
REG &T0acc = &INTEGER_VARIABLE17
REG &PT01T0acc = &INTEGER_VARIABLE18
REG &PT05 = &INTEGER_VARIABLE19
REG &PT03 = &INTEGER_VARIABLE20
REG &PS01ftacc = &INTEGER_VARIABLE21  
                       
//Float_Variables
REG &Calc01 = &FLOAT_VARIABLE1
REG &Calc02 = &FLOAT_VARIABLE2
REG &Calc03 = &FLOAT_VARIABLE3
REG &Calc04 = &FLOAT_VARIABLE4
REG &Calc05 = &FLOAT_VARIABLE5

//IO Mapping
BIT |V01_IE = |CI_1
BIT |V02_IE = |CI_2
BIT |V01_ID = |CI_3
BIT |V02_ID = |CI_4

BIT |PS04_I = |CI_7 //Seal water Pressure Switch
BIT |PS03_I = |CI_8 //Cooling  water Pressure Switch

BIT |PB01_I = |DI_1 //Dump and Reset
BIT |PB02_I = |DI_2 //Concentrate Product
BIT |PB03_I = |DI_3 //Flush with Water
BIT |PB04_I = |DI_4 //CIP
BIT |ES01_I = |DI_5

BIT |PP02_I = |DI_7
BIT |PP01_I = |DI_8 

BIT |V03_ID = |DI_11
BIT |V04_ID = |DI_12
BIT |V05_ID = |DI_13
BIT |V06_ID = |DI_14
BIT |V07_ID = |DI_15


BIT |PX02_I = |DI_17 //Permeate Swing Bend CIP Position
//BIT |PX01_I = |DI_17 //Permeate Swing Bend Product Position
BIT |PX01_I = |DI_18 //Permeate Swing Bend Product Position
BIT |PX03_I = |DI_19 //Retentate Swing Bend Product Position
//BIT |PX03_I = |DI_20 //Retentate Swing Bend Product Position
BIT |PX04_I = |DI_20 //Retentate Swing Bend CIP Position
BIT |PX05_I = |DI_21 //Feed Swing Bend Product Position
//BIT |PX05_I = |DI_22 //Feed Swing Bend Product Position
BIT |PX06_I = |DI_22 //Feed Swing Bend CIP Position
BIT |PS01_I = |DI_23 //Air Pressure Switch

BIT |V03_IE = |DI_27
BIT |V04_IE = |DI_28
BIT |V05_IE = |DI_29
BIT |V06_IE = |DI_30
BIT |V07_IE = |DI_31

BIT |PB01_O = |DO_1
BIT |PB02_O = |DO_2
BIT |PB03_O = |DO_3
BIT |PB04_O = |DO_4

BIT |PP02_O = |DO_7
BIT |PP01_O = |DO_8 
BIT |V01_OE = |DO_9
BIT |V02_OE = |DO_10
BIT |V03_OE = |DO_11
BIT |V04_OE = |DO_12
BIT |V05_OE = |DO_13
BIT |V06_OE = |DO_14
BIT |V07_OE = |DO_15

BIT |V11_OE = |DO_17
BIT |V10_OE = |DO_18

BIT |V03_OD = |DO_27
BIT |V04_OD = |DO_28
BIT |V05_OD = |DO_29
BIT |V06_OD = |DO_30
BIT |V07_OD = |DO_31


//User_Memory_1 to 99 Display Format x.x
MEM &USER_MEMORY16_BAND1 = 5219
MEM &DISPLAY_FORMAT_USER16_BAND1 = 6

REG &FT01_eumax = &USER_MEMORY_1
MEM &FT01_eumax = 4800 //480.0 l/hr
REG &FT01_eumin = &USER_MEMORY_2
MEM &FT01_eumin = 0 //0.0 l/hr

REG &fd100T02 = &USER_MEMORY_30
MEM &fd100T02 = 100 //10.0s Product Fill Plant

REG &fd100T03 = &USER_MEMORY_31
//MEM &fd100T03 = 2500 //250.0s Product Fill Plant - Change Status ...8 membranes
MEM &fd100T03 = 500 //50.0s Product Fill Plant - Change Status ...1 membrane

REG &fd100T05 = &USER_MEMORY_32
MEM &fd100T05 = 3000 //300.0s Min Production Time

REG &fd100T21 = &USER_MEMORY_33
MEM &fd100T21 = 100 //10.0s Water Flush Fill Plant

REG &fd100T22 = &USER_MEMORY_34
//MEM &fd100T22 = 2500 //250.0s Water Flush Fill Plant - Change Status ...8 membranes
MEM &fd100T22 = 500 //50.0s Water Flush Fill Plant - Change Status ...1 membrane

REG &fd100T24 = &USER_MEMORY_35
MEM &fd100T24 = 3000 //300.0s Water Flush Recirc

REG &fd100T25 = &USER_MEMORY_36
//MEM &fd100T25 = 100 //10.0s Water Flush To Drain ...8 membranes
MEM &fd100T25 = 300 //30.0s Water Flush To Drain ...1 membrane

REG &fd100T31 = &USER_MEMORY_37
MEM &fd100T31 = 100 //10.0s CIP Fill Plant

REG &fd100T32 = &USER_MEMORY_38
//MEM &fd100T32 = 2500 //250.0s CIP Fill Plant - Change Status  ...8 membranes
MEM &fd100T32 = 500 //50.0s CIP Fill Plant - Change Status  ...1 membrane

REG &fd100T34 = &USER_MEMORY_39
MEM &fd100T34 = 12000//1200.0s Recric Fill Plant

REG &fd100T40 = &USER_MEMORY_40
MEM &fd100T40 = 100 //10.0s Drain

REG &fd100T41 = &USER_MEMORY_41
MEM &fd100T41 = 600 //60.0s Drain - Change Status

REG &PT01FT01 = &USER_MEMORY_42
MEM &PT01FT01 = 4200 //420.0s Low Pressure Fault Timer

//User_Memory_100 to 199 Display Format x.xx
MEM &USER_MEMORY16_BAND2 = 5319
MEM &DISPLAY_FORMAT_USER16_BAND2 = 5

//******************************************************
REG &LT01_eumax = &USER_MEMORY_100
MEM &LT01_eumax = 11500 //115%

REG &LT01_eumin = &USER_MEMORY_101
MEM &LT01_eumin = 0 //0%

//******************************************************
REG &LT02_eumax = &USER_MEMORY_102
MEM &LT02_eumax = 10000 //???% 

REG &LT02_eumin = &USER_MEMORY_103
MEM &LT02_eumin = 0 //0% 

//******************************************************
REG &PT01_eumax = &USER_MEMORY_104
MEM &PT01_eumax = 4000 //40 bar

REG &PT01_eumin = &USER_MEMORY_105
MEM &PT01_eumin = 0 //0 bar

//******************************************************
REG &PT02_eumax = &USER_MEMORY_106
MEM &PT02_eumax = 4000 //40 bar

REG &PT02_eumin = &USER_MEMORY_107
MEM &PT02_eumin = 0 //0 bar

//******************************************************
REG &PT03_eumax = &USER_MEMORY_108
MEM &PT03_eumax = 1000 //10.00 bar

REG &PT03_eumin = &USER_MEMORY_109
MEM &PT03_eumin = 0 //0 bar 

//******************************************************
REG &TT01_eumax = &USER_MEMORY_110
MEM &TT01_eumax = 10000 //100 C

REG &TT01_eumin = &USER_MEMORY_111
MEM &TT01_eumin = 0 //0 C

//******************************************************
REG &PP01SP01 = &USER_MEMORY_112
MEM &PP01SP01 = 0 //0% Reset

REG &PP01SP02 = &USER_MEMORY_113
MEM &PP01SP02 = 5000 //50% Fill Plant

REG &PP01SP03 = &USER_MEMORY_114
MEM &PP01SP03 = 5000 //50% Pressurise Plant

REG &PP01SP04 = &USER_MEMORY_115
MEM &PP01SP04 = 5000 //50% Production

REG &PP01SP05 = &USER_MEMORY_116
MEM &PP01SP05 = 5000 //50% Water Recirc

REG &PP01SP06 = &USER_MEMORY_117
MEM &PP01SP06 = 5000 //50% Water Flush

REG &PP01SP07 = &USER_MEMORY_118
MEM &PP01SP07 = 5000 //50% CIP Recirc

//******************************************************
REG &PP02SP01 = &USER_MEMORY_121
MEM &PP02SP01 = 0 //0% Reset

REG &PP02SP04 = &USER_MEMORY_122
MEM &PP02SP04 = 2000 //20% Production

REG &PP02SP05 = &USER_MEMORY_123
MEM &PP02SP05 = 3000 //30% Water Recirc

REG &PP02SP06 = &USER_MEMORY_124
MEM &PP02SP06 = 3000 //30% Water Flush

REG &PP02SP07 = &USER_MEMORY_125
MEM &PP02SP07 = 3000 //50% CIP Recirc

//******************************************************
REG &PT01SP01 = &USER_MEMORY_129
MEM &PT01SP01 = 300 //3.00 bar Pressurise Plant

REG &PT01SP02 = &USER_MEMORY_130
MEM &PT01SP02 = 3950 //39.50 bar Max Pressure Alarm

//******************************************************
REG &DPC12SP01 = &USER_MEMORY_131
//MEM &DPC12SP01 = 250 //2.50 bar Pressurise Plant ...8 membranes
MEM &DPC12SP01 = 65 //0.65 bar Pressurise Plant ...1 membrane

REG &DPC12SP02 = &USER_MEMORY_132
//MEM &DPC12SP02 = 280 //2.80 bar Pressurise Plant ...8 membranes
MEM &DPC12SP02 = 70 //0.70 bar Pressurise Plant ...1 membrane

REG &DPC12SP03 = &USER_MEMORY_133
//MEM &DPC12SP03 = 280 //2.80 bar Pressurise Plant ...8 membranes
MEM &DPC12SP03 = 70 //0.70 bar Pressurise Plant ...1 membrane

//******************************************************
REG &LT01SP01 = &USER_MEMORY_145
MEM &LT01SP01 = 2500 //25.00% Water Rinse Initial Fill

REG &LT01SP02 = &USER_MEMORY_146
MEM &LT01SP02 = 2500 //25.00% Water Rinse Stop Fill

REG &LT01SP03 = &USER_MEMORY_147
MEM &LT01SP03 = 1500 //15.00% Water Rinse Start Fill

REG &LT01SP04 = &USER_MEMORY_148
MEM &LT01SP04 = 2000 //20.00% CIP Initial Fill

REG &LT01SP05 = &USER_MEMORY_149
MEM &LT01SP05 = 2000 //20.00% CIP Stop Fill

REG &LT01SP06 = &USER_MEMORY_150
MEM &LT01SP06 = 1500 //15.00% CIP Start Fill

REG &LT01SP07 = &USER_MEMORY_151
MEM &LT01SP07 = 400 //4.00% Empty Tank Level

REG &LT01SP08 = &USER_MEMORY_152
MEM &LT01SP08 = 1000 //10.00% Level Not OK to Run Pumps

REG &LT01SP09 = &USER_MEMORY_153
MEM &LT01SP09 = 1500 //15.00% Level OK to Run Pumps

//******************************************************
REG &TT01SP01 = &USER_MEMORY_154
MEM &TT01SP01 = 2500 //25.00degC Product Start Cooling Water

REG &TT01SP02 = &USER_MEMORY_155
MEM &TT01SP02 = 2250 //22.50degC Product Stop Cooling Water

REG &TT01SP03 = &USER_MEMORY_156
MEM &TT01SP03 = 5000 //50.00degC Max Temp

REG &TT01SP04 = &USER_MEMORY_157
MEM &TT01SP04 = 4500 //45.00degC CIP Start Cooling Water

REG &TT01SP05 = &USER_MEMORY_158
MEM &TT01SP05 = 4250 //42.50degC CIP Stop Cooling Water

//******************************************************
REG &LT02SP01 = &USER_MEMORY_159
MEM &LT02SP01 = 500 //5.00% Min Start Level

REG &LT02SP02 = &USER_MEMORY_160
MEM &LT02SP02 = 0 //0.00% Captured Level

REG &LT02SP03 = &USER_MEMORY_161
MEM &LT02SP03 = 5000 //50.00% Desired Conc 

REG &PT03SP01 = &USER_MEMORY_165
MEM &PT03SP01 = 100 //1.00Bar Desired Conc 

//******************************************************

REG &CV01SP01 = &USER_MEMORY_170
MEM &CV01SP01 = 0 //0.00% Starting Postion 

REG &CV01SP02 = &USER_MEMORY_171
MEM &CV01SP02 = 1000 //10.00% Initial Recirc Postion   

//******************************************************
REG &PT05_eumax = &USER_MEMORY_190
MEM &PT05_eumax = 1000 //10.00 bar 

REG &PT05_eumin = &USER_MEMORY_191
MEM &PT05_eumin = 0 //0.00 bar 

//******************************************************
REG &DP12_eumax = &USER_MEMORY_192
MEM &DP12_eumax = 4000 //40 bar

REG &DP12_eumin = &USER_MEMORY_193
MEM &DP12_eumin = -4000 //-40 bar

//******************************************************
//User_Memory_200 to 299 Display Format x.xxx
MEM &USER_MEMORY16_BAND3 = 5419
MEM &DISPLAY_FORMAT_USER16_BAND3 = 4
 
//******************************************************
//User_Memory_300 and above Display Format x
//******************************************************


//******************************************************
REG &FT02_eumax = &USER_MEMORY_301
MEM &FT02_eumax = 3600 //3600 l/hr

REG &FT02_eumin = &USER_MEMORY_302
MEM &FT02_eumin = 0 //0 l/hr

//******************************************************
REG &FT03_eumax = &USER_MEMORY_303
MEM &FT03_eumax = 4500 //4500 l/hr

REG &FT03_eumin = &USER_MEMORY_304
MEM &FT03_eumin = 0 //0 l/hr 

//******************************************************
REG &LT02inUse = &USER_MEMORY_305
MEM &LT02inUse = 0 //Not fitted or not in use
//MEM &LT02inuse = 1 //Fitted and in use

//******************************************************
REG &fd100H05 = &USER_MEMORY_306
MEM &fd100H05 = 12 //12 hrs Max Production Time

REG &RC21SP01 = &USER_MEMORY_307
MEM &RC21SP01 = 2000 //

REG &RC13SP01 = &USER_MEMORY_308
MEM &RC13SP01 = 700 //

REG &XXstatus = &USER_MEMORY_400
BITREG &XXstatus = [|XXout, |XXeng, |XXdeeng, |XXfault, |XXmanualOn, |XXmanualOff, |XXautoOut, |XXengEnable, |XXdeengEnable, |XXfaultEnable]
REG &XXcmd = &USER_MEMORY_401
REG &XXtimerState = &USER_MEMORY_402
REG &XXtimerAcc = &USER_MEMORY_403
REG &XXtimerPre1 = &USER_MEMORY_404
REG &XXtimerPre2 = &USER_MEMORY_405
REG &XXtimerPre4 = &USER_MEMORY_406
REG &XXtimerPre5 = &USER_MEMORY_407

//PP01 Data
REG &PP01status = &USER_MEMORY_408
BITREG &PP01status = [|PP01out, |PP01eng, |PP01deeng, |PP01fault, |PP01manualOn, |PP01manualOff, |PP01autoOut, |PP01engEnable, |PP01deengEnable, |PP01faultEnable] 
MEM &PP01status = 640
REG &PP01cmd = &USER_MEMORY_409
REG &PP01timerState = &USER_MEMORY_410
REG &PP01timerAcc = &USER_MEMORY_411
MEM &PP01timerAcc = 0
REG &PP01timerPre1 = &USER_MEMORY_412
MEM &PP01timerPre1 = 0 //Eng Delay
REG &PP01timerPre2 = &USER_MEMORY_413
MEM &PP01timerPre2 = 1000
REG &PP01timerPre4 = &USER_MEMORY_414
MEM &PP01timerPre4 = 0 //Deeng Delay
REG &PP01timerPre5 = &USER_MEMORY_415
MEM &PP01timerPre5 = 1000

//PP02 Data
REG &PP02status = &USER_MEMORY_416
BITREG &PP02status = [|PP02out, |PP02eng, |PP02deeng, |PP02fault, |PP02manualOn, |PP02manualOff, |PP02autoOut, |PP02engEnable, |PP02deengEnable, |PP02faultEnable] 
MEM &PP02status = 640
REG &PP02cmd = &USER_MEMORY_417
REG &PP02timerState = &USER_MEMORY_418
REG &PP02timerAcc = &USER_MEMORY_419
MEM &PP02timerAcc = 0
REG &PP02timerPre1 = &USER_MEMORY_420
MEM &PP02timerPre1 = 300 //Eng Delay
REG &PP02timerPre2 = &USER_MEMORY_421
MEM &PP02timerPre2 = 1000
REG &PP02timerPre4 = &USER_MEMORY_422
MEM &PP02timerPre4 = 0 //Deeng Delay
REG &PP02timerPre5 = &USER_MEMORY_423
MEM &PP02timerPre5 = 1000

//V01 Data
REG &V01status = &USER_MEMORY_424
BITREG &V01status = [|V01out, |V01eng, |V01deeng, |V01fault, |V01manualOn, |V01manualOff, |V01autoOut, |V01engEnable, |V01deengEnable, |V01faultEnable] 
MEM &V01status = 896
REG &V01cmd = &USER_MEMORY_425
REG &V01timerState = &USER_MEMORY_426
REG &V01timerAcc = &USER_MEMORY_427
MEM &V01timerAcc = 0
REG &V01timerPre1 = &USER_MEMORY_428
MEM &V01timerPre1 = 0 //Eng Delay
REG &V01timerPre2 = &USER_MEMORY_429
MEM &V01timerPre2 = 1500
REG &V01timerPre4 = &USER_MEMORY_430
MEM &V01timerPre4 = 0 //Deeng Delay
REG &V01timerPre5 = &USER_MEMORY_431
MEM &V01timerPre5 = 1500

//V02 Data
REG &V02status = &USER_MEMORY_432
BITREG &V02status = [|V02out, |V02eng, |V02deeng, |V02fault, |V02manualOn, |V02manualOff, |V02autoOut, |V02engEnable, |V02deengEnable, |V02faultEnable] 
MEM &V02status = 896 //Old settings to enable fault checking
//MEM &V02status = 0 //New settings to disable fault checking
REG &V02cmd = &USER_MEMORY_433
REG &V02timerState = &USER_MEMORY_434
REG &V02timerAcc = &USER_MEMORY_435
MEM &V02timerAcc = 0
REG &V02timerPre1 = &USER_MEMORY_436
MEM &V02timerPre1 = 0 //Eng Delay
REG &V02timerPre2 = &USER_MEMORY_437
MEM &V02timerPre2 = 1000
REG &V02timerPre4 = &USER_MEMORY_438
MEM &V02timerPre4 = 0 //Deeng Delay
REG &V02timerPre5 = &USER_MEMORY_439
MEM &V02timerPre5 = 1000

//V03 Data
REG &V03status = &USER_MEMORY_440
BITREG &V03status = [|V03out, |V03eng, |V03deeng, |V03fault, |V03manualOn, |V03manualOff, |V03autoOut, |V03engEnable, |V03deengEnable, |V03faultEnable] 
MEM &V03status = 896
REG &V03cmd = &USER_MEMORY_441
REG &V03timerState = &USER_MEMORY_442
REG &V03timerAcc = &USER_MEMORY_443
MEM &V03timerAcc = 0
REG &V03timerPre1 = &USER_MEMORY_444
MEM &V03timerPre1 = 0 //Eng Delay
REG &V03timerPre2 = &USER_MEMORY_445
MEM &V03timerPre2 = 1000
REG &V03timerPre4 = &USER_MEMORY_446
MEM &V03timerPre4 = 0 //Deeng Delay
REG &V03timerPre5 = &USER_MEMORY_447
MEM &V03timerPre5 = 1000

//V04 Data
REG &V04status = &USER_MEMORY_448
BITREG &V04status = [|V04out, |V04eng, |V04deeng, |V04fault, |V04manualOn, |V04manualOff, |V04autoOut, |V04engEnable, |V04deengEnable, |V04faultEnable] 
MEM &V04status = 896
REG &V04cmd = &USER_MEMORY_449
REG &V04timerState = &USER_MEMORY_450
REG &V04timerAcc = &USER_MEMORY_451
MEM &V04timerAcc = 0
REG &V04timerPre1 = &USER_MEMORY_452
MEM &V04timerPre1 = 0 //Eng Delay
REG &V04timerPre2 = &USER_MEMORY_453
MEM &V04timerPre2 = 1000
REG &V04timerPre4 = &USER_MEMORY_454
MEM &V04timerPre4 = 0 //Deeng Delay
REG &V04timerPre5 = &USER_MEMORY_455
MEM &V04timerPre5 = 1000

//V05 Data
REG &V05status = &USER_MEMORY_456
BITREG &V05status = [|V05out, |V05eng, |V05deeng, |V05fault, |V05manualOn, |V05manualOff, |V05autoOut, |V05engEnable, |V05deengEnable, |V05faultEnable] 
MEM &V05status = 896
REG &V05cmd = &USER_MEMORY_457
REG &V05timerState = &USER_MEMORY_458
REG &V05timerAcc = &USER_MEMORY_459
MEM &V05timerAcc = 0
REG &V05timerPre1 = &USER_MEMORY_460
MEM &V05timerPre1 = 0 //Eng Delay
REG &V05timerPre2 = &USER_MEMORY_461
MEM &V05timerPre2 = 1000
REG &V05timerPre4 = &USER_MEMORY_462
MEM &V05timerPre4 = 0 //Deeng Delay
REG &V05timerPre5 = &USER_MEMORY_463
MEM &V05timerPre5 = 1000

//V06 Data
REG &V06status = &USER_MEMORY_464
BITREG &V06status = [|V06out, |V06eng, |V06deeng, |V06fault, |V06manualOn, |V06manualOff, |V06autoOut, |V06engEnable, |V06deengEnable, |V06faultEnable] 
MEM &V06status = 896
REG &V06cmd = &USER_MEMORY_465
REG &V06timerState = &USER_MEMORY_466
REG &V06timerAcc = &USER_MEMORY_467
MEM &V06timerAcc = 0
REG &V06timerPre1 = &USER_MEMORY_468
MEM &V06timerPre1 = 0 //Eng Delay
REG &V06timerPre2 = &USER_MEMORY_469
MEM &V06timerPre2 = 1000
REG &V06timerPre4 = &USER_MEMORY_470
MEM &V06timerPre4 = 0 //Deeng Delay
REG &V06timerPre5 = &USER_MEMORY_471
MEM &V06timerPre5 = 1000

//V07 Data
REG &V07status = &USER_MEMORY_472
BITREG &V07status = [|V07out, |V07eng, |V07deeng, |V07fault, |V07manualOn, |V07manualOff, |V07autoOut, |V07engEnable, |V07deengEnable, |V07faultEnable] 
MEM &V07status = 896
REG &V07cmd = &USER_MEMORY_473
REG &V07timerState = &USER_MEMORY_474
REG &V07timerAcc = &USER_MEMORY_475
MEM &V07timerAcc = 0
REG &V07timerPre1 = &USER_MEMORY_476
MEM &V07timerPre1 = 0 //Eng Delay
REG &V07timerPre2 = &USER_MEMORY_477
MEM &V07timerPre2 = 1000
REG &V07timerPre4 = &USER_MEMORY_478
MEM &V07timerPre4 = 0 //Deeng Delay
REG &V07timerPre5 = &USER_MEMORY_479
MEM &V07timerPre5 = 1000

//V11 Data
REG &V11status = &USER_MEMORY_480
BITREG &V11status = [|V11out, |V11eng, |V11deeng, |V11fault, |V11manualOn, |V11manualOff, |V11autoOut, |V11engEnable, |V11deengEnable, |V11faultEnable] 
MEM &V11status = 896
REG &V11cmd = &USER_MEMORY_481
REG &V11timerState = &USER_MEMORY_482
REG &V11timerAcc = &USER_MEMORY_483
MEM &V11timerAcc = 0
REG &V11timerPre1 = &USER_MEMORY_484
MEM &V11timerPre1 = 0 //Eng Delay
REG &V11timerPre2 = &USER_MEMORY_485
MEM &V11timerPre2 = 1000
REG &V11timerPre4 = &USER_MEMORY_486
MEM &V11timerPre4 = 0 //Deeng Delay
REG &V11timerPre5 = &USER_MEMORY_487
MEM &V11timerPre5 = 1000

//V10 Data
REG &V10status = &USER_MEMORY_488
BITREG &V10status = [|V10out, |V10eng, |V10deeng, |V10fault, |V10manualOn, |V10manualOff, |V10autoOut, |V10engEnable, |V10deengEnable, |V10faultEnable] 
MEM &V10status = 896
REG &V10cmd = &USER_MEMORY_489
REG &V10timerState = &USER_MEMORY_490
REG &V10timerAcc = &USER_MEMORY_491
MEM &V10timerAcc = 0
REG &V10timerPre1 = &USER_MEMORY_492
MEM &V10timerPre1 = 0 //Eng Delay
REG &V10timerPre2 = &USER_MEMORY_493
MEM &V10timerPre2 = 1000
REG &V10timerPre4 = &USER_MEMORY_494
MEM &V10timerPre4 = 0 //Deeng Delay
REG &V10timerPre5 = &USER_MEMORY_495
MEM &V10timerPre5 = 1000

REG &fd100StepMsgTacc = &USER_MEMORY_549

//OP_X Data
REG &OP_Xstatus = &USER_MEMORY_550
BITREG &OP_Xstatus = [|OP_Xsel, |OP_Xdesel, |OP_XselPB, |OP_XdeselPB, |OP_XselIL, |OP_XdeselIL, |OP_XselOns, |OP_XdeselOns]
MEM &OP_Xstatus = 0
REG &OP_Xcmd = &USER_MEMORY_551
MEM &OP_Xcmd = 0
REG &OP_Xmsg = &USER_MEMORY_552
MEM &OP_Xmsg = 0
REG &OP_Xstate = &USER_MEMORY_553
MEM &OP_Xstate = 0
REG &OP_XtimerAcc = &USER_MEMORY_554
MEM &OP_XtimerAcc = 0

//OP_PROD Data
REG &OP_PRODstatus = &USER_MEMORY_555
BITREG &OP_PRODstatus = [|OP_PRODsel, |OP_PRODdesel, |OP_PRODselPB, |OP_PRODdeselPB, |OP_PRODselIL, |OP_PRODdeselIL, |OP_PRODselOns, |OP_PRODdeselOns]
MEM &OP_PRODstatus = 0
REG &OP_PRODcmd = &USER_MEMORY_556
MEM &OP_PRODcmd = 0
REG &OP_PRODmsg = &USER_MEMORY_557
MEM &OP_PRODmsg = 0
REG &OP_PRODstate = &USER_MEMORY_558
MEM &OP_PRODstate = 0
REG &OP_PRODtimerAcc = &USER_MEMORY_559
MEM &OP_PRODtimerAcc = 0

//OP_DRAIN Data
REG &OP_DRAINstatus = &USER_MEMORY_560
BITREG &OP_DRAINstatus = [|OP_DRAINsel, |OP_DRAINdesel, |OP_DRAINselPB, |OP_DRAINdeselPB, |OP_DRAINselIL, |OP_DRAINdeselIL, |OP_DRAINselOns, |OP_DRAINdeselOns]
MEM &OP_DRAINstatus = 0
REG &OP_DRAINcmd = &USER_MEMORY_561
MEM &OP_DRAINcmd = 0
REG &OP_DRAINmsg = &USER_MEMORY_562
MEM &OP_DRAINmsg = 0
REG &OP_DRAINstate = &USER_MEMORY_563
MEM &OP_DRAINstate = 0
REG &OP_DRAINtimerAcc = &USER_MEMORY_564
MEM &OP_DRAINtimerAcc = 0

//OP_WATER Data
REG &OP_WATERstatus = &USER_MEMORY_565
BITREG &OP_WATERstatus = [|OP_WATERsel, |OP_WATERdesel, |OP_WATERselPB, |OP_WATERdeselPB, |OP_WATERselIL, |OP_WATERdeselIL, |OP_WATERselOns, |OP_WATERdeselOns]
MEM &OP_WATERstatus = 0
REG &OP_WATERcmd = &USER_MEMORY_566
MEM &OP_WATERcmd = 0
REG &OP_WATERmsg = &USER_MEMORY_567
MEM &OP_WATERmsg = 0
REG &OP_WATERstate = &USER_MEMORY_568
MEM &OP_WATERstate = 0
REG &OP_WATERtimerAcc = &USER_MEMORY_569
MEM &OP_WATERtimerAcc = 0

//OP_CIP Data
REG &OP_CIPstatus = &USER_MEMORY_570
BITREG &OP_CIPstatus = [|OP_CIPsel, |OP_CIPdesel, |OP_CIPselPB, |OP_CIPdeselPB, |OP_CIPselIL, |OP_CIPdeselIL, |OP_CIPselOns, |OP_CIPdeselOns]
MEM &OP_CIPstatus = 0
REG &OP_CIPcmd = &USER_MEMORY_571
MEM &OP_CIPcmd = 0
REG &OP_CIPmsg = &USER_MEMORY_572
MEM &OP_CIPmsg = 0
REG &OP_CIPstate = &USER_MEMORY_573
MEM &OP_CIPstate = 0
REG &OP_CIPtimerAcc = &USER_MEMORY_574
MEM &OP_CIPtimerAcc = 0


//DPC12 PID loop data
REG &DPC12status = &USER_MEMORY_590
BITREG &DPC12status = [|DPC12revMode, |DPC12manualSO, |DPC12manualPID, |DPC12autoPID]
MEM &DPC12status = 1
REG &DPC12cmd = &USER_MEMORY_591
MEM &DPC12cmd = 0
REG &DPC12state = &USER_MEMORY_592
MEM &DPC12state = 0
REG &DPC12pv = &USER_MEMORY_593
MEM &DPC12pv = 0
REG &DPC12cv = &USER_MEMORY_594
MEM &DPC12cv = 0
REG &DPC12sp = &USER_MEMORY_595
MEM &DPC12sp = 0
REG &DPC12err = &USER_MEMORY_596
MEM &DPC12err = 0
REG &DPC12errLast = &USER_MEMORY_597
MEM &DPC12errLast = 0
REG &DPC12errLastLast = &USER_MEMORY_598
MEM &DPC12errLastLast = 0
REG &DPC12p = &USER_MEMORY_599
MEM &DPC12p = 1
REG &DPC12i = &USER_MEMORY_600
MEM &DPC12i = 100
REG &DPC12d = &USER_MEMORY_601
MEM &DPC12d = 0
REG &DPC12tacc = &USER_MEMORY_602
MEM &DPC12tacc = 0

//RC21 PID loop data - Ratio FT02/FT01 range 0.000 - 10.000
REG &RC21status = &USER_MEMORY_603
BITREG &RC21status = [|RC21revMode, |RC21manualSO, |RC21manualPID, |RC21autoPID]
MEM &RC21status = 0
REG &RC21cmd = &USER_MEMORY_604
MEM &RC21cmd = 0
REG &RC21state = &USER_MEMORY_605
MEM &RC21state = 0
REG &RC21pv = &USER_MEMORY_606
MEM &RC21pv = 0
REG &RC21cv = &USER_MEMORY_607
MEM &RC21cv = 0
REG &RC21sp = &USER_MEMORY_608
MEM &RC21sp = 0
REG &RC21err = &USER_MEMORY_609
MEM &RC21err = 0
REG &RC21errLast = &USER_MEMORY_610
MEM &RC21errLast = 0
REG &RC21errLastLast = &USER_MEMORY_611
MEM &RC21errLastLast = 0
REG &RC21p = &USER_MEMORY_612
MEM &RC21p = 1
REG &RC21i = &USER_MEMORY_613
MEM &RC21i = 5
REG &RC21d = &USER_MEMORY_614
MEM &RC21d = 0
REG &RC21tacc = &USER_MEMORY_615
MEM &RC21tacc = 0

//RC13 PID loop data - Ratio FT01/FT03 range 0.000 - 100.00
REG &RC13status = &USER_MEMORY_616
BITREG &RC13status = [|RC13revMode, |RC13manualSO, |RC13manualPID, |RC13autoPID]
MEM &RC13status = 1
REG &RC13cmd = &USER_MEMORY_617
MEM &RC13cmd = 0
REG &RC13state = &USER_MEMORY_618
MEM &RC13state = 0
REG &RC13pv = &USER_MEMORY_619
MEM &RC13pv = 0
REG &RC13cv = &USER_MEMORY_620
MEM &RC13cv = 0
REG &RC13sp = &USER_MEMORY_621
MEM &RC13sp = 0
REG &RC13err = &USER_MEMORY_622
MEM &RC13err = 0
REG &RC13errLast = &USER_MEMORY_623
MEM &RC13errLast = 0
REG &RC13errLastLast = &USER_MEMORY_624
MEM &RC13errLastLast = 0
REG &RC13p = &USER_MEMORY_625
MEM &RC13p = 1
REG &RC13i = &USER_MEMORY_626
MEM &RC13i = 5
REG &RC13d = &USER_MEMORY_627
MEM &RC13d = 0
REG &RC13tacc = &USER_MEMORY_628
MEM &RC13tacc = 0

MEM &CODE_BLANKING=0
MEM &VIEW_MODE_BLANKING=0
MEM &SETPOINT_BLANKING=0

//Setup Datalogging
MEM &CODE8 = 112 //Octal 160
MEM &LOG_REG1 = ADDR(&LT01_percent)
MEM &LOG_REG2 = ADDR(&LT02_percent)
MEM &LOG_REG3 = ADDR(&PT01)
MEM &LOG_REG4 = ADDR(&PT02)
MEM &LOG_REG5 = ADDR(&PT03)
MEM &LOG_REG6 = ADDR(&TT01)
MEM &LOG_REG7 = ADDR(&PP01_SPD)
MEM &LOG_REG8 = ADDR(&PP02_SPD)
MEM &LOG_REG9 = ADDR(&Time0)
MEM &LOG_REG10 = ADDR(&DP12)
MEM &LOG_REG11 = ADDR(&plantStatus)
MEM &LOG_REG12 = ADDR(&fd100StepNumber)
MEM &LOG_REG13 = ADDR(&fault)
MEM &LOG_REG14 = ADDR(&FT01)
MEM &LOG_REG15 = ADDR(&FT02)
MEM &LOG_REG16 = ADDR(&FT03)
MEM &LOG_REG17 = ADDR(&CV01)
MEM &LOG_REG18 = ADDR(&CV02)
MEM &LOG_REG19 = ADDR(&R21)
MEM &LOG_REG20 = ADDR(&PT05)
MEM &LOG_REG21 = 0
MEM &LOG_REG22 = 0
MEM &LOG_REG23 = 0
MEM &LOG_REG24 = 0
MEM &LOG_REG25 = 0
MEM &LOG_REG26 = 0
MEM &LOG_REG27 = 0
MEM &LOG_REG28 = 0
MEM &LOG_REG29 = 0
MEM &LOG_REG30 = 0
MEM &LOG_REG31 = 0
MEM &LOG_REG32 = 0

  
RESET_MACRO:
  // Set step number to reset step
  &fd100StepNumber = 0
  |AFI = OFF
  |t0en = OFF

  // Set main timer to zero
  &T0acc = 0
  &T0Hours = 0
  &T0Minutes = 0
  &T0Seconds = 0
  
  // PS01
  &PS01ftacc = 0
 
  // Switch all valves to auto
  &V01cmd = 1
  &V02cmd = 1
  &V03cmd = 1
  &V04cmd = 1
  &V05cmd = 1
  &V06cmd = 1
  &V07cmd = 1
  &V10cmd = 1
  &V11cmd = 1
  
  // Switch all pumps to auto
  &PP01cmd = 1
  &PP02cmd = 1

  // Switch all PID controllers to auto 
  &DPC12cmd = 1

END

MAIN_MACRO:

 //Get the time since the start of the last main macro scan
 &lastScanTimeFast = &FAST_TIMER1 
 &FAST_TIMER1 = &FAST_TIMER1 - &lastScanTimeFast
 
 &lastScanTimeShort = &SHORT_TIMER1
 &SHORT_TIMER1 = &SHORT_TIMER1 - &lastScanTimeShort 

  //FT01
  &Calc01 = (&FT01_eumax - &FT01_eumin) / 10.0 
  &Calc02 = &CH8 / 10000.00
  &Calc03 = (&Calc01 * &Calc02) + (&FT01_eumin / 10.0)
  &FT01 = &Calc03 * 10

  //FT02
  &Calc01 = (&FT02_eumax - &FT02_eumin)
  &Calc02 = &CH9 / 10000.00
  &Calc03 = (&Calc01 * &Calc02) + (&FT02_eumin) 
  &FT02 = &Calc03

  //FT03
  &Calc01 = (&FT03_eumax - &FT03_eumin)
  &Calc02 = &CH10 / 10000.00
  &Calc03 = (&Calc01 * &Calc02) + (&FT03_eumin) 
  &FT03 = &Calc03

  //R21
  &Calc01 = &FT01 / 10.0
  IF (&Calc01 > 0) THEN
   &Calc02 = &FT02 / &Calc01
   IF (&Calc02 > 10.0) THEN
    &Calc02 = 10.0
   ELSIF (&Calc02 < 0.0) THEN
    &Calc02 = 0.0
   ENDIF       
  ELSE
   &Calc02 = 10.0
  ENDIF
  &R21 = &Calc02 * 1000 
  &RC21pv = &R21
  
  //R13
  &Calc01 = &FT01 / 10.0
  IF (&FT03 > 0) THEN
   &Calc02 = &Calc01 / &FT03
   IF (&Calc02 > 1.0) THEN
    &Calc02 = 1.0
   ELSIF (&Calc02 < 0.0) THEN
    &Calc02 = 0.0
   ENDIF       
  ELSE
   &Calc02 = 1.0
  ENDIF
  &R13 = &Calc02 * 10000 
  &RC13pv = &R13  
  
 
 //LT01
 &Calc01 = (&LT01_eumax - &LT01_eumin) / 100.00 
 &Calc02 = &CH1 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&LT01_eumin / 100.00) 
 &LT01_percent = &Calc03 * 100
 
 //LT02
 &Calc01 = (&LT02_eumax - &LT02_eumin) / 100.00 
 &Calc02 = &CH5 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&LT02_eumin / 100.00) 
 &LT02_percent = &Calc03 * 100 
 
 //PT01
 &Calc01 = (&PT01_eumax - &PT01_eumin) / 100.00 
 &Calc02 = &CH2 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&PT01_eumin / 100.00) 
 &PT01 = &Calc03 * 100
 
 //PT02
 &Calc01 = (&PT02_eumax - &PT02_eumin) / 100.00 
 &Calc02 = &CH3 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&PT02_eumin / 100.00) 
 &PT02 = &Calc03 * 100 

 //PT03
 &Calc01 = (&PT03_eumax - &PT03_eumin) / 100.00 
 &Calc02 = &CH6 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&PT03_eumin / 100.00) 
 &PT03 = &Calc03 * 100
 
 //PT05 Rig 2
 &Calc01 = (&PT05_eumax - &PT05_eumin) / 100.00 
 &Calc02 = &CH7 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&PT05_eumin / 100.00) 
 &PT05 = &Calc03 * 100
 
 //DP12
 &DPC12pv = &CH2 - &CH3 
 &Calc01 = (&DP12_eumax - &DP12_eumin) / 100.00 
 &Calc02 = (&DPC12pv + 10000.00) / 20000.00
 &Calc03 = (&Calc01 * &Calc02) + (&DP12_eumin / 100.00) 
 &DP12 = &Calc03 * 100  
  
 //TT01
 &Calc01 = (&TT01_eumax - &TT01_eumin) / 100.00 
 &Calc02 = &CH4 / 10000.00
 &Calc03 = (&Calc01 * &Calc02) + (&TT01_eumin / 100.00) 
 &TT01 = &Calc03 * 100 

 |PP01eng = |PP01_I
 |PP02eng = |PP02_I
  
 |V01eng = |V01_IE
 |V01deeng = |V01_ID
 |V02eng = |V02_IE
 |V02deeng = |V02_ID 
 |V03eng = |V03_IE
 |V03deeng = |V03_ID
 |V04eng = |V04_IE
 |V04deeng = |V04_ID 
 |V05eng = |V05_IE
 |V05deeng = |V05_ID 
 |V06eng = |V06_IE
 |V06deeng = |V06_ID 
 |V07eng = |V07_IE
 |V07deeng = |V07_ID
 
 |OP_PRODselPB = |PB02_I
 |OP_PRODdeselPB = |PB02_I
 |OP_DRAINselPB = |PB01_I
 |OP_DRAINdeselPB = |PB01_I
 |OP_WATERselPB = |PB03_I
 |OP_WATERdeselPB = |PB03_I
 |OP_CIPselPB = |PB04_I
 |OP_CIPdeselPB = |PB04_I              

 IF (|PB01_I=ON) OR (|PB02_I=ON) OR (|PB03_I=ON) OR (|PB04_I=ON) THEN
  &fault=0
 ENDIF
 
 IF (((|PP01out=ON) OR (|PP02out=ON)) AND (&PT01 < &PT01SP01)) THEN
  &PT01T0acc = &PT01T0acc + &lastScanTimeShort
 ELSE
  &PT01T0acc = 0 
 ENDIF
 
 //Air pressure fault delay timer
 IF (|PS01_I = OFF) THEN
  &PS01ftacc = &PS01ftacc + &lastScanTimeShort
 ELSE
  &PS01ftacc = 0
 ENDIF
 
 IF (&PS01ftacc > 10000) THEN
  &PS01ftacc = 10000
 ENDIF   

//////////////////////////////////////////////////////////////////////////////
//Display
//////////////////////////////////////////////////////////////////////////////
  //Determine which values to show on local display
 SELECT &displayState 
  CASE  0: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&FT01)
    &DATA_SOURCE_DISPLAY2 = ADDR(&FT02)
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 1
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 23 
   ENDIF
  
  CASE  1: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 3
   ENDIF  
 
  CASE  2: //Check Up
   IF |UP_BUTTON = OFF THEN
    &displayState = 0
   ENDIF 
  
  CASE  3: //Display  
    &DATA_SOURCE_DISPLAY1 = ADDR(&FT03)
    &DATA_SOURCE_DISPLAY2 = ADDR(&Time0)
    //Display StepMsg on bottom line over step time 
    &fd100StepMsgTacc = &fd100StepMsgTacc + &lastScanTimeShort
    IF (&fd100StepMsgTacc > 100) AND (&fd100StepMsgTacc < 200)  THEN
     IF (&fault = 0) THEN
      WRITE 2 fd100StepMsgArray[&fd100StepNumber]
      &fd100StepMsgTacc = 200
     ELSE
      WRITE 2 faultMsgArray[&fault]
      &fd100StepMsgTacc = 0
     ENDIF 
    ELSIF (&fd100StepMsgTacc > 300) THEN
     WRITE 2 plantStatusMsgArray[&plantStatus]
     &fd100StepMsgTacc = 0 
    ENDIF      
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 4
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 2 
   ENDIF
  
  CASE  4: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 6
   ENDIF  
 
  CASE  5: //Check Up
   IF |UP_BUTTON = OFF THEN
    &displayState = 3
   ENDIF 
  
  CASE  6: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&LT01_percent)
    &DATA_SOURCE_DISPLAY2 = ADDR(&LT02_percent)
      
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 7
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 5 
   ENDIF
  
  CASE  7: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &fd100StepMsgTacc = 0 
    &displayState = 9
   ENDIF
 
  CASE  8: //Check Up
   IF |UP_BUTTON = OFF THEN
    &displayState = 6
   ENDIF 
  
  CASE  9: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&PT01)
    &DATA_SOURCE_DISPLAY2 = ADDR(&PT02)
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 10
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 8 
   ENDIF
  
  CASE  10: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &fd100StepMsgTacc = 0
    &displayState = 12
   ENDIF
 
  CASE  11: //Check Up
   IF |UP_BUTTON = OFF THEN
    &fd100StepMsgTacc = 0 
    &displayState = 9
   ENDIF 
  
  CASE  12: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&DP12)
    &DATA_SOURCE_DISPLAY2 = ADDR(&PP02_SPD)     
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 13
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 11 
   ENDIF
  
  CASE  13: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 15
   ENDIF    

  CASE  14: //Check Up
   IF |UP_BUTTON = OFF THEN
    &displayState = 12
    &fd100StepMsgTacc = 0
   ENDIF  

  CASE  15: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&R21)
    &DATA_SOURCE_DISPLAY2 = ADDR(&CV01)
          
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 16
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 14 
   ENDIF
  
  CASE  16: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 18
   ENDIF  
 
  CASE  17: //Check Up                
   IF |UP_BUTTON = OFF THEN
    &displayState = 15
   ENDIF
     
  CASE  18: //Display
    &DATA_SOURCE_DISPLAY1 = ADDR(&R13)
    &DATA_SOURCE_DISPLAY2 = ADDR(&PP01_SPD)
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 19
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 17 
   ENDIF
  
  CASE  19: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 21
   ENDIF  
 
  CASE  20: //Check Up                
   IF |UP_BUTTON = OFF THEN
    &displayState = 18
   ENDIF

  CASE  21: //Display

    &DATA_SOURCE_DISPLAY1 = ADDR(&TT01)
    &DATA_SOURCE_DISPLAY2 = ADDR(&CV02)     
    
   IF &EDIT_STATE = 0 and |DOWN_BUTTON = ON THEN
    &displayState = 22
   ELSIF &EDIT_STATE = 0 and |UP_BUTTON = ON THEN
    &displayState = 20 
   ENDIF
  
  CASE  22: //Check Down
   IF |DOWN_BUTTON = OFF THEN
    &displayState = 0
   ENDIF    

  CASE  23: //Check Up
   IF |UP_BUTTON = OFF THEN
    &displayState = 21
   ENDIF
   
  DEFAULT:
 ENDSEL

 //PRODuction selection msg
 IF (|OP_DRAINsel = ON) THEN
  &OP_PRODmsg = 22
 ELSIF (|OP_WATERsel = ON) THEN
  &OP_PRODmsg = 23  
 ELSIF (|OP_CIPsel = ON) THEN
  &OP_PRODmsg = 24
//  
// ELSIF (&RoRigNumber = 2) and (|PX01_I = ON) THEN
//  &OP_PRODmsg = 25  
// ELSIF (&RoRigNumber = 2) and (|PX02_I = OFF) THEN
//  &OP_PRODmsg = 25
//    
// ELSIF (&RoRigNumber = 2) and (|PX03_I = ON) THEN
//  &OP_PRODmsg = 27
// ELSIF (&RoRigNumber = 2) and (|PX04_I = OFF) THEN
//  &OP_PRODmsg = 27  
//    
// ELSIF (&RoRigNumber = 2) and (|PX05_I = ON) THEN
//  &OP_PRODmsg = 29
// ELSIF (&RoRigNumber = 2) and (|PX06_I = OFF) THEN
//  &OP_PRODmsg = 29  
    
 ELSIF (|PP01fault = ON) THEN
  &OP_PRODmsg = 17
 ELSIF (|PP02fault = ON) THEN
  &OP_PRODmsg = 19
 ELSIF (|V01fault = ON) THEN
  &OP_PRODmsg = 1
 ELSIF (|V02fault = ON) THEN
  &OP_PRODmsg = 3
 ELSIF (|V03fault = ON) THEN
  &OP_PRODmsg = 5
 ELSIF (|V05fault = ON) THEN
  &OP_PRODmsg = 9
 ELSIF (|V06fault = ON) THEN
  &OP_PRODmsg = 11
 ELSIF (|V07fault = ON) THEN
  &OP_PRODmsg = 13                
 ELSIF (&PS01ftacc > 100) THEN
  &OP_PRODmsg = 31
 ELSIF (&PT01 > &PT01SP02) THEN
  &OP_PRODmsg = 32
 ELSIF ((&fd100StepNumber = 0) AND (&PT03 < &PT03SP01)) THEN
  &OP_PRODmsg = 33      
 ELSIF (&TT01 > &TT01SP03) THEN
  &OP_PRODmsg = 34 
 ELSIF (|PS04_I = ON) THEN
  &OP_PRODmsg = 37
 ELSIF (&LT02inUse = 1) and (&LT02_percent < &LT02SP01) THEN
  &OP_PRODmsg = 38
 ELSIF (&PT01T0acc > &PT01FT01) THEN
  &OP_PRODmsg = 39  
 ELSE
  &OP_PRODmsg = 0
 ENDIF
 
 //DRAIN selection msg
 IF (|OP_PRODsel = ON) THEN
  &OP_DRAINmsg = 21
 ELSIF (|OP_WATERsel = ON) THEN
  &OP_DRAINmsg = 23  
 ELSIF (|OP_CIPsel = ON) THEN
  &OP_DRAINmsg = 24
 ELSIF (&PS01ftacc > 100) THEN
  &OP_DRAINmsg = 31  
 ELSE
  &OP_DRAINmsg = 0
 ENDIF
 
 //WATER rinse selection msg
 IF (|OP_PRODsel = ON) THEN
  &OP_WATERmsg = 21
 ELSIF (|OP_DRAINsel = ON) THEN
  &OP_WATERmsg = 22  
 ELSIF (|OP_CIPsel = ON) THEN
  &OP_WATERmsg = 24
 ELSIF (|PX02_I = OFF) THEN
  &OP_WATERmsg = 26
 ELSIF (|PX04_I = OFF) THEN
  &OP_WATERmsg = 28
 ELSIF (|PX06_I = OFF) THEN
  &OP_WATERmsg = 30
 ELSIF (|PP01fault = ON) THEN
  &OP_WATERmsg = 17
 ELSIF (|PP02fault = ON) THEN
  &OP_WATERmsg = 19  
 ELSIF (|V01fault = ON) THEN
  &OP_WATERmsg = 1
 ELSIF (|V02fault = ON) THEN
  &OP_WATERmsg = 3
 ELSIF (|V03fault = ON) THEN
  &OP_WATERmsg = 5
 ELSIF (|V05fault = ON) THEN
  &OP_WATERmsg = 9
 ELSIF (|V06fault = ON) THEN
  &OP_WATERmsg = 11
 ELSIF (|V07fault = ON) THEN
  &OP_WATERmsg = 13  
 ELSIF (&PS01ftacc > 100) THEN
  &OP_WATERmsg = 31
 ELSIF (&PT01 > &PT01SP02) THEN
  &OP_WATERmsg = 32
 ELSIF ((&fd100StepNumber = 0) AND (&PT03 < &PT03SP01)) THEN
  &OP_WATERmsg = 33    
 ELSIF (&TT01 > &TT01SP03) THEN
  &OP_WATERmsg = 34
 ELSIF (|PS04_I = ON) THEN
  &OP_WATERmsg = 37
 ELSIF (&PT01T0acc > &PT01FT01) THEN
  &OP_WATERmsg = 39             
 ELSE
  &OP_WATERmsg = 0
 ENDIF       

 //CIP recirc selection msg
 IF (|OP_PRODsel = ON) THEN
  &OP_CIPmsg = 21
 ELSIF (|OP_DRAINsel = ON) THEN
  &OP_CIPmsg = 22
 ELSIF (|OP_WATERsel = ON) THEN
  &OP_CIPmsg = 23
 ELSIF (|PX02_I = OFF) THEN
  &OP_CIPmsg = 26
 ELSIF (|PX04_I = OFF) THEN
  &OP_CIPmsg = 28
 ELSIF (|PX06_I = OFF) THEN
  &OP_CIPmsg = 30
 ELSIF (|PP01fault = ON) THEN
  &OP_CIPmsg = 17
 ELSIF (|PP02fault = ON) THEN
  &OP_CIPmsg = 19
 ELSIF (|V01fault = ON) THEN
  &OP_CIPmsg = 1
 ELSIF (|V02fault = ON) THEN
  &OP_CIPmsg = 3
 ELSIF (|V03fault = ON) THEN
  &OP_CIPmsg = 5
 ELSIF (|V05fault = ON) THEN
  &OP_CIPmsg = 9
 ELSIF (|V06fault = ON) THEN
  &OP_CIPmsg = 11
 ELSIF (|V07fault = ON) THEN
  &OP_CIPmsg = 13  
 ELSIF (&PS01ftacc > 100) THEN
  &OP_CIPmsg = 31
 ELSIF (&PT01 > &PT01SP02) THEN
  &OP_CIPmsg = 32
 ELSIF ((&fd100StepNumber = 0) AND (&PT03 < &PT03SP01)) THEN
  &OP_CIPmsg = 33    
 ELSIF (&TT01 > &TT01SP03) THEN
  &OP_CIPmsg = 34
 ELSIF (|PS04_I = ON) THEN
  &OP_CIPmsg = 37
 ELSIF (&PT01T0acc > &PT01FT01) THEN
  &OP_CIPmsg = 39              
 ELSE
  &OP_CIPmsg = 0
 ENDIF
  
 //FD100 Production  
 &Temp1 = &fd100StepNumber
 SELECT &fd100StepNumber
  CASE 0: //Reset
   |PP01autoOut = OFF
   |RC13autoPID = OFF
//   &RC13cv = &PP01SP01
   |RC21autoPID = OFF    
//   &RC21cv = 0  
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
//   &DPC12cv = &PP02SP01     
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = OFF   
   |V11autoOut = OFF
   
   |t0en = OFF                 
      
   //Transistion Conditions
   IF (|OP_PRODsel = ON) THEN 
    IF (&plantStatus = 1)  THEN //1=Full Product
     &Temp1 = 4
     &fault = 0     
    ELSE
     &Temp1 = 1
     &fault = 0     
    ENDIF
   ELSIF (|OP_WATERsel = ON) THEN
     &Temp1 = 20
     &fault = 0
   ELSIF (|OP_CIPsel = ON) THEN
     &Temp1 = 30
     &fault = 0
   ELSIF (|OP_DRAINsel = ON) THEN
     &Temp1 = 40
     &fault = 0             
   ENDIF
   
  CASE 1: //Record Starting Level in Product Tank
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0
   |RC21autoPID = OFF   
   &RC21cv = 0  
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
   
   |t0en = OFF                 

   IF (&fault = 0) THEN 
    &fault = &OP_PRODmsg //Record Fault Message
   ENDIF
   
   IF (&LT02inUse = 1) THEN
    &LT02SP02 = &LT02_percent //Capture Level @ Start
   ENDIF 
      
   //Transistion Conditions
   &Temp1 = 2
   
  CASE 2: //Fill Plant With Air Valve Open
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 

   |t0en = ON
   
   IF (&fault = 0) THEN
    &fault = &OP_PRODmsg //Record Fault Message
   ENDIF    
      
   //Transistion Conditions
   IF (&T0acc > &fd100T02) THEN 
    &Temp1 = 3
   ENDIF
   IF (|OP_PRODsel = OFF) THEN 
    &Temp1 = 0
   ENDIF  

  CASE 3: //Fill Plant With Air Valve Open - Record Plant Full
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01  
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0 //PP02_SPD    
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 
   
   |t0en = ON
   
   &plantStatus = 1 //1=Full Product

   IF (&fault = 0) THEN
    &fault = &OP_PRODmsg //Record Fault Message
   ENDIF
      
   //Transistion Conditions
   IF (&T0acc > &fd100T03) THEN 
    &Temp1 = 4
   ENDIF
   IF (|OP_PRODsel = OFF) THEN 
    &Temp1 = 0
   ENDIF    

  CASE 4: //Pressurise Plant
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP03 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01      
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0 //PP02_SPD  
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
   
   |t0en = ON                 

   IF (&fault = 0) THEN
    &fault = &OP_PRODmsg //Record Fault Message
   ENDIF
         
   //Transistion Conditions
   IF (&PT01 > &PT01SP01) THEN 
    &Temp1 = 5
   ELSIF (|OP_PRODsel = OFF) THEN 
    &Temp1 = 0
   ENDIF
   
  CASE 5: //Production
   |PP01autoOut = ON
   |RC13autoPID = ON
   &RC13sp = &RC13SP01  
   IF (|fd100sc = ON) THEN
    &RC13cv = &PP01SP04 //PP01_SPD initial start
   ENDIF  
   |RC21autoPID = ON
   &RC21sp = &RC21SP01   
   IF (|fd100sc = ON) THEN
    &RC21cv = &CV01SP02 //CV01 initial start
   ENDIF            
   |PP02autoOut = ON
   |DPC12autoPID = ON
   IF (|fd100sc = ON) THEN
    &DPC12sp = &DPC12SP01 * 2.5 
    &DPC12cv = &PP02SP04 //PP02_SPD starting speed
   ENDIF 
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON
   //Temperature Control 
   &CV02 = 10000  
   IF (&TT01 > &TT01SP01) THEN
    |V11autoOut = ON   
   ELSIF (&TT01 < &TT01SP02) THEN
    |V11autoOut = OFF   
   ENDIF
   
   |t0en = ON
   
   IF (&fault = 0) THEN
    &fault = &OP_PRODmsg //Record Fault Message
   ENDIF
      
   //Transistion Conditions
   &Calc01 =  &LT02SP03 / 10000   
   IF (&LT02inUse = 1) AND (&LT02_percent < (&LT02SP02 * &Calc01)) AND (&T0acc > &fd100T05) THEN
    &Temp1 = 9
   ELSIF (&T0Hours >= &fd100H05) THEN
    &Temp1 = 9 
   ELSIF (|OP_PRODsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 9: //Deselect OP_PROD 
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01     
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0 //PP02_SPD   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
   
   |t0en = OFF                

   &OP_PRODcmd = 2
      
   //Transistion Conditions
   IF (|OP_PRODsel = OFF) THEN 
    &Temp1 = 0
   ENDIF
   
/////////////////////////////////////////////////////////////////////////////
// Water Rinse
/////////////////////////////////////////////////////////////////////////////

  CASE 20: //Fill CIP Tank With Water
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = ON   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
   
   |t0en = OFF                

   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
         
   //Transistion Conditions
   IF (&LT01_percent > &LT01SP01) THEN
    IF (&plantStatus = 3) THEN //3=Full Water
     &Temp1 = 23
    ELSE
     &Temp1 = 21    
    ENDIF  
   ENDIF
   IF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 21: //Fill Plant With Air Valve Open
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0
   IF (&LT01_percent > &LT01SP02) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP03) THEN
    |V01autoOut = ON   
   ENDIF     
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
                    
   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
          
   |t0en = ON
      
   //Transistion Conditions
   IF (&T0acc > &fd100T21) THEN 
    &Temp1 = 22
   ENDIF
   IF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF  

  CASE 22: //Fill Plant With Air Valve Open - Record Plant Full
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   IF (&LT01_percent > &LT01SP02) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP03) THEN
    |V01autoOut = ON   
   ENDIF
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 
   
   &plantStatus = 3 //3=Full Water

   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
         
   |t0en = ON
      
   //Transistion Conditions
   IF (&T0acc > &fd100T22) THEN
    &Temp1 = 23
   ENDIF
   IF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF    

  CASE 23: //Pressurise Plant
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP03 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   IF (&LT01_percent > &LT01SP02) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP03) THEN
    |V01autoOut = ON   
   ENDIF   
   |V02autoOut = ON
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
                    
   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
   
   |t0en = OFF
         
   //Transistion Conditions
   IF (&PT01 > &PT01SP01) THEN 
    &Temp1 = 24
   ELSIF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF
   
  CASE 24: //Flush
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP05 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = ON  
   |DPC12autoPID = ON
   IF (|fd100sc = ON) THEN
    &DPC12sp = &DPC12SP02 * 2.5 
    &DPC12cv = &PP02SP05
   ENDIF    

   IF (&LT01_percent > &LT01SP02) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP03) THEN
    |V01autoOut = ON   
   ENDIF
   |V02autoOut = ON
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   //Temperature Control 
   &CV02 = 10000  
   IF (&TT01 > &TT01SP04) THEN
    |V11autoOut = ON   
   ELSIF (&TT01 < &TT01SP05) THEN
    |V11autoOut = OFF   
   ENDIF                            

   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
       
   |t0en = ON
      
   //Transistion Conditions
   IF (&T0acc > &fd100T24) THEN
    &Temp1 = 25
   ELSIF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 25: //Recirc
   |PP01autoOut = ON
   |RC13autoPID = OFF
   &RC13cv = &PP01SP06 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01
   |PP02autoOut = ON
   |DPC12autoPID = OFF
   &DPC12cv = &PP02SP06
   IF (&LT01_percent > &LT01SP02) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP03) THEN
    |V01autoOut = ON   
   ENDIF
   |V02autoOut = OFF 
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                            

   IF (&fault = 0) THEN
    &fault = &OP_WATERmsg //Record Fault Message
   ENDIF
    
   |t0en = ON
      
   //Transistion Conditions
   IF (&T0acc > &fd100T25) THEN
    &Temp1 = 29
   ELSIF (|OP_WATERsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 29: //Deselect OP_WATER 
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 

   &OP_WATERcmd = 2
   
   IF (|OP_WATERsel = OFF) THEN 
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF   
         
   //Transistion Conditions
   IF (&T0acc > 50) THEN 
    &Temp1 = 0
    &OP_DRAINcmd = 3
   ENDIF   
   
   
/////////////////////////////////////////////////////////////////////////////
// CIP
/////////////////////////////////////////////////////////////////////////////

  CASE 30: //Fill CIP Tank
   |levelOk = OFF
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = ON   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 

   IF (&fault = 0) THEN
    &fault = &OP_CIPmsg //Record Fault Message
   ENDIF
   
   |t0en = OFF    
      
   //Transistion Conditions
   IF (&LT01_percent > &LT01SP04) THEN 
    IF (&plantStatus = 5) THEN //5=Full CIP
     &Temp1 = 33
    ELSE
     &Temp1 = 31    
    ENDIF  
   ENDIF
   IF (|OP_CIPsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 31: //Fill Plant With Air Valve Open  
   //Check for level in CIP Tank
   IF (&LT01_percent > &LT01SP09) THEN
    |levelOk = ON   
   ELSIF (&LT01_percent < &LT01SP08) THEN
    |levelOk = OFF   
   ENDIF    
   |PP01autoOut = |levelOk
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   IF (&LT01_percent > &LT01SP05) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP06) THEN
    |V01autoOut = ON   
   ENDIF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 

   IF (&fault = 0) THEN
    &fault = &OP_CIPmsg //Record Fault Message
   ENDIF
   
   IF (|levelOk = ON) THEN 
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF
      
   //Transistion Conditions
   IF (&T0acc > &fd100T31) THEN 
    &Temp1 = 32
   ENDIF
   IF (|OP_CIPsel = OFF) THEN 
    &Temp1 = 0
   ENDIF  

  CASE 32: //Fill Plant With Air Valve Open - Record Plant Full
   //Check for level in CIP Tank
   IF (&LT01_percent > &LT01SP09) THEN
    |levelOk = ON   
   ELSIF (&LT01_percent < &LT01SP08) THEN
    |levelOk = OFF   
   ENDIF    
   |PP01autoOut = |levelOk
   |RC13autoPID = OFF
   &RC13cv = &PP01SP02 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   IF (&LT01_percent > &LT01SP05) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP06) THEN
    |V01autoOut = ON   
   ENDIF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = ON
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 
   
   &plantStatus = 5 //5=Full CIP

   IF (&fault = 0) THEN
    &fault = &OP_CIPmsg //Record Fault Message
   ENDIF
         
   IF (|levelOk = ON) THEN 
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF
      
   //Transistion Conditions
   IF (&T0acc > &fd100T32) THEN 
    &Temp1 = 33
   ENDIF
   IF (|OP_CIPsel = OFF) THEN 
    &Temp1 = 0
   ENDIF    

  CASE 33: //Pressurise Plant
   //Check for level in CIP Tank
   IF (&LT01_percent > &LT01SP09) THEN
    |levelOk = ON   
   ELSIF (&LT01_percent < &LT01SP08) THEN
    |levelOk = OFF   
   ENDIF    
   |PP01autoOut = |levelOk
   |RC13autoPID = OFF
   &RC13cv = &PP01SP03 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   IF (&LT01_percent > &LT01SP05) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP06) THEN
    |V01autoOut = ON   
   ENDIF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF
   
   |t0en = OFF                 

   IF (&fault = 0) THEN
    &fault = &OP_CIPmsg //Record Fault Message
   ENDIF
         
   //Transistion Conditions
   IF (&PT01 > &PT01SP01) THEN 
    &Temp1 = 34
   ELSIF (|OP_CIPsel = OFF) THEN 
    &Temp1 = 0
   ENDIF
   
  CASE 34: //Recirc
   //Check for level in CIP Tank
   IF (&LT01_percent > &LT01SP09) THEN
    |levelOk = ON   
   ELSIF (&LT01_percent < &LT01SP08) THEN
    |levelOk = OFF   
   ENDIF    
   |PP01autoOut = |levelOk
   |RC13autoPID = OFF
   &RC13cv = &PP01SP07 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = &CV01SP01 //CV01   
   |PP02autoOut = |levelOk   
   |DPC12autoPID = |levelOk
   IF (|fd100sc = ON) THEN
    &DPC12sp = &DPC12SP03 * 2.5 
    &DPC12cv = &PP02SP07
   ENDIF   
   IF (&LT01_percent > &LT01SP05) THEN
    |V01autoOut = OFF   
   ELSIF (&LT01_percent < &LT01SP06) THEN
    |V01autoOut = ON   
   ENDIF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   //Temperature Control 
   &CV02 = 10000  
   IF (&TT01 > &TT01SP04) THEN
    |V11autoOut = ON   
   ELSIF (&TT01 < &TT01SP05) THEN
    |V11autoOut = OFF   
   ENDIF

   IF (|levelOk = ON) THEN 
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF
   
   IF (&fault = 0) THEN
    &fault = &OP_CIPmsg //Record Fault Message
   ENDIF
         
   //Transistion Conditions
   IF (&T0acc > &fd100T34) THEN
    &Temp1 = 39
   ELSIF (|OP_CIPsel = OFF) THEN 
    &Temp1 = 0
   ENDIF

  CASE 39: //Deselect OP_CIP
   |levelOk = OFF 
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = ON   
   |V11autoOut = OFF                 

   &OP_CIPcmd = 2
   
   IF (|OP_CIPsel = OFF) THEN 
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF
          
   //Transistion Conditions
   IF (&T0acc > 50) THEN 
    &Temp1 = 0
    &OP_DRAINcmd = 3
   ENDIF

/////////////////////////////////////////////////////////////////////////
// Drain Plant
//////////////////////////////////////////////////////////////////////////

  CASE 40: //Empty Tank
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01     
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = ON      
   |V04autoOut = ON
   |V05autoOut = ON
   |V06autoOut = ON
   |V07autoOut = ON
   |V10autoOut = OFF   
   |V11autoOut = OFF                 

   IF (&fault = 0) THEN
    &fault = &OP_DRAINmsg //Record Fault Message
   ENDIF
       
   IF (&LT01_percent < &LT01SP07) THEN
    |t0en = ON
   ELSE
    |t0en = OFF
   ENDIF
       
   //Transistion Conditions
   IF (|OP_DRAINsel = OFF) THEN 
    &Temp1 = 0
   ELSIF (&T0acc > &fd100T40) THEN 
    &Temp1 = 41
   ENDIF

  CASE 41: //Drain Plant - Plant Empty
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01    
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = ON      
   |V04autoOut = ON
   |V05autoOut = ON
   |V06autoOut = ON
   |V07autoOut = ON
   |V10autoOut = OFF   
   |V11autoOut = OFF

   IF (&fault = 0) THEN                    
    &fault = &OP_DRAINmsg //Record Fault Message
   ENDIF
   
   |t0en = ON 
                                  
                                      //0=Unknown
   IF (&plantStatus = 1) THEN         //1=Full Product
    &plantStatus = 2                  //2=Empty Product
   ELSIF (&plantStatus = 3) THEN      //3=Full Water
    &plantStatus = 4                  //4=Empty Water
   ELSIF (&plantStatus = 5) THEN      //5=Full CIP
    &plantStatus = 6                  //6=Empty CIP
   ENDIF
   
   &LT02SP02 = 0 //Reset Capture Level
      
   //Transistion Conditions
   IF (|OP_DRAINsel = OFF) THEN 
    &Temp1 = 0
   ELSIF (&T0acc > &fd100T41) THEN 
    &Temp1 = 49
   ENDIF   

  CASE 49: //Deselect OP_DRAIN and select Water Rinse if CIP
   |PP01autoOut = OFF
   |RC13autoPID = OFF
   &RC13cv = 0 //PP01_SPD 
   |RC21autoPID = OFF   
   &RC21cv = 0 //CV01     
   |PP02autoOut = OFF
   |DPC12autoPID = OFF
   &DPC12cv = 0   
   |V01autoOut = OFF   
   |V02autoOut = OFF
   |V03autoOut = OFF      
   |V04autoOut = OFF
   |V05autoOut = OFF
   |V06autoOut = OFF
   |V07autoOut = OFF
   |V10autoOut = OFF   
   |V11autoOut = OFF                 

   &OP_DRAINcmd = 2
   
   |t0en = ON 
         
   //Transistion Conditions
   IF (|OP_DRAINsel = OFF) THEN
    IF (&plantStatus = 6) THEN
     IF (&T0acc > 50) THEN 
      &Temp1 = 0
      &OP_WATERcmd = 3
     ENDIF
    ELSE
     &Temp1 = 0
    ENDIF     
   ENDIF   
  
  DEFAULT:
   &Temp1 = 0
   
 ENDSEL
 
 IF &Temp1 <> &fd100StepNumber THEN
  &fd100StepNumber = &Temp1
  &T0acc = 0
  &T0Hours = 0
  &T0Minutes = 0
  &T0Seconds = 0
  |fd100sc = ON
 ELSE
  |fd100sc = OFF
  IF (|t0en = ON) THEN
   &T0Seconds = &T0Seconds + &lastScanTimeShort
   IF (&T0Seconds >= 600) THEN
    &T0Seconds = &T0Seconds - 600
    &T0Minutes = &T0Minutes + 1
    IF (&T0Minutes >= 60) THEN
     &T0Minutes = &T0Minutes - 60
     &T0Hours = &T0Hours + 1
     IF (&T0Hours >= 24) THEN
      &T0Hours = 0
     ENDIF 
    ENDIF
   ENDIF
   IF (&T0acc < 32000) THEN
    &T0acc = ((&T0Minutes * 600) + &T0Seconds)
   ENDIF
  ELSE
   &T0acc = 0
   &T0Hours = 0
   &T0Minutes = 0
   &T0Seconds = 0 
  ENDIF    
 ENDIF
 &Time0 = ((((&T0Hours * 100) + &T0Minutes) * 100) + (&T0Seconds/10))
 
 //Log data to SD Card
 &Logtime = &Logtime + &lastScanTimeShort
 IF (&fd100StepNumberLastLog <> &fd100StepNumber) OR (&faultLastLog <> &fault) OR (&Logtime >= 600) THEN
  &Logtime = 0
  &faultLastLog = &fault
  &fd100StepNumberLastLog = &fd100StepNumber
  FORCE_LOG 
 ELSIF (&fd100StepNumber = 0) THEN
  &Logtime = 0 
 ENDIF
 
 //Valve and Motor Logic
 FOR &Temp1 = 1 TO 11 STEP 1
  //Get Values  
  &XXstatus = &XXstatus[&Temp1*8]
  &XXcmd = &XXcmd[&Temp1*8]
  &XXcmd[&Temp1*8] = 0
  &XXtimerState = &XXtimerState[&Temp1*8]
  &XXtimerAcc = &XXtimerAcc[&Temp1*8]
  &XXtimerPre1 = &XXtimerPre1[&Temp1*8]
  &XXtimerPre2 = &XXtimerPre2[&Temp1*8]
  &XXtimerPre4 = &XXtimerPre4[&Temp1*8]
  &XXtimerPre5 = &XXtimerPre5[&Temp1*8]
  
  //cmd 0=none 1=auto 2=manualOff 3=manualOn
  SELECT &XXcmd
   CASE 0:
    //No action
   CASE 1:
    |XXmanualOn = OFF
    |XXmanualOff = OFF

   CASE 2:
    |XXmanualOn = OFF
    |XXmanualOff = ON

   CASE 3:
    |XXmanualOn = ON
    |XXmanualOff = OFF
        
   DEFAULT:

   ENDSEL
  
  //timerState
  SELECT &XXtimerState
   CASE 0: //Deenergised or Stopped
    |XXout = OFF
    IF (|XXfaultEnable = ON AND ((|XXeng = ON AND |XXengEnable = ON) OR (|XXdeeng = OFF AND |XXdeengEnable = ON))) THEN
     |XXfault = ON
    ELSIF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF    
    IF (|XXmanualOff = ON) THEN
     &XXtimerState = 0
    ELSIF (|XXmanualOn = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 2
    ELSIF (|XXautoOut = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 1
    ENDIF

   CASE 1: //Delay before Energising or Starting
    |XXout = OFF
    IF (|XXfaultEnable = ON AND ((|XXeng = ON AND |XXengEnable = ON) OR (|XXdeeng = OFF AND |XXdeengEnable = ON))) THEN
     |XXfault = ON
    ELSIF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF 
    &XXtimerAcc = &XXtimerAcc + &lastScanTimeFast
    IF (|XXmanualOff = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 0
    ELSIF ((|XXmanualOn = ON) OR (&XXtimerAcc >= &XXtimerPre1)) THEN
     &XXtimerAcc = 0
     &XXtimerState = 2
    ELSIF (|XXautoOut = OFF) THEN
     &XXtimerAcc = 0
     &XXtimerState = 0  
    ENDIF
    
   CASE 2: //Energising or Starting Time
    |XXout = ON
    IF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF
    &XXtimerAcc = &XXtimerAcc + &lastScanTimeFast
    IF (|XXmanualOff = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 5
    ELSIF ((|XXmanualOn = OFF) AND (|XXautoOut = OFF)) THEN 
     &XXtimerAcc = 0 
     &XXtimerState = 4 
    ELSIF (&XXtimerAcc >= &XXtimerPre2) THEN 
     &XXtimerAcc = 0 
     &XXtimerState = 3
    ENDIF

   CASE 3: //Energised or Started
    |XXout = ON
    IF (|XXfaultEnable = ON AND ((|XXeng = OFF AND |XXengEnable = ON) OR (|XXdeeng = ON AND |XXdeengEnable = ON))) THEN
     |XXfault = ON
    ELSIF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF
    IF (|XXmanualOn = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 3
    ELSIF (|XXmanualOff = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 5
    ELSIF (|XXautoOut = OFF) THEN
     &XXtimerAcc = 0
     &XXtimerState = 4
    ENDIF 
   
   CASE 4: //Delay before Deenergising or Stopping
    |XXout = ON
    IF (|XXfaultEnable = ON AND ((|XXeng = OFF AND |XXengEnable = ON) OR (|XXdeeng = ON AND |XXdeengEnable = ON))) THEN
     |XXfault = ON
    ELSIF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF
    &XXtimerAcc = &XXtimerAcc + &lastScanTimeFast
    IF (|XXmanualOn = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 3
    ELSIF ((|XXmanualOff = ON) OR (&XXtimerAcc >= &XXtimerPre4)) THEN
     &XXtimerAcc = 0
     &XXtimerState = 5
    ELSIF (|XXautoOut = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 3  
    ENDIF 
   
   CASE 5: //Deenergising or Stopping Time
    |XXout = OFF
    IF |XXfaultEnable = ON THEN
     |XXfault = OFF
    ENDIF
    &XXtimerAcc = &XXtimerAcc + &lastScanTimeFast
    IF (|XXmanualOn = ON) THEN
     &XXtimerAcc = 0
     &XXtimerState = 2
    ELSIF ((|XXmanualOff = OFF) AND (|XXautoOut = ON)) THEN 
     &XXtimerAcc = 0 
     &XXtimerState = 1 
    ELSIF (&XXtimerAcc >= &XXtimerPre5) THEN 
     &XXtimerAcc = 0 
     &XXtimerState = 0
    ENDIF
           
   DEFAULT:
    &XXtimerAcc = 0
    &XXtimerState = 0
   ENDSEL
   
  //Update Values
  &XXstatus[&Temp1*8] = &XXstatus
  &XXtimerState[&Temp1*8] = &XXtimerState
  &XXtimerAcc[&Temp1*8] = &XXtimerAcc  
 NEXT &Temp1


 //OPerator Selection Logic
 FOR &Temp1 = 1 TO 4 STEP 1
  //Get Values  
  &OP_Xstatus = &OP_Xstatus[&Temp1*5]
  &OP_Xcmd = &OP_Xcmd[&Temp1*5]  //cmd 0=none 2=stop 3=start
  &OP_Xcmd[&Temp1*5] = 0  
  &OP_Xmsg = &OP_Xmsg[&Temp1*5]  
  &OP_Xstate = &OP_Xstate[&Temp1*5]
  &OP_XtimerAcc = &OP_XtimerAcc[&Temp1*5]
  
  //state
  &Temp2 = &OP_Xstate
  SELECT &OP_Xstate
   CASE 0: //Reset power up state
    |OP_Xsel = OFF
    |OP_Xdesel = OFF
    |OP_XselIL = OFF
    |OP_XdeselIL = OFF
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    &Temp2 = 3

   CASE 1: //Deselected and Selection Available
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = OFF
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    &OP_XtimerAcc = &OP_XtimerAcc + &lastScanTimeFast
    
    IF (&OP_Xmsg = 0) THEN
     IF (&OP_Xcmd = 3) THEN
      &Temp2 = 5      
     ELSIF (|OP_XselPB = ON) THEN
      &Temp2 = 5     
     ENDIF 
    ELSE
     &Temp2 = 3  
    ENDIF
    IF (&OP_XtimerAcc > 200) THEN
     &Temp2 = 2  
    ENDIF    

   CASE 2: //Deselected and Selection Available, Flash ON
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = ON
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    &OP_XtimerAcc = &OP_XtimerAcc + &lastScanTimeFast
    
    IF (&OP_Xmsg = 0) THEN
     IF (&OP_Xcmd = 3) THEN
      &Temp2 = 5      
     ELSIF (|OP_XselPB = ON) THEN
      &Temp2 = 5     
     ENDIF 
    ELSE
     &Temp2 = 3  
    ENDIF
    IF (&OP_XtimerAcc > 200) THEN
     &Temp2 = 1  
    ENDIF

   CASE 3: //Deselected and Selection Not Available
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = OFF
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    IF (&OP_Xmsg = 0) THEN
     &Temp2 = 1 
    ELSE
     IF (|OP_XselPB = ON) THEN
      &Temp2 = 4
      WRITE 2 faultMsgArray[&OP_Xmsg]     
     ENDIF
    ENDIF

   CASE 4: //Deselected and Selection Not Available Message
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = OFF
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    IF (|OP_XselPB = OFF) THEN
     &Temp2 = 3     
    ENDIF   

   CASE 5: //Selected Oneshot
    |OP_Xsel = ON
    |OP_Xdesel = OFF
    |OP_XselIL = ON
    |OP_XdeselIL = OFF
    |OP_XselOns = ON
    |OP_XdeselOns = OFF
    
    &Temp2 = 6     

   CASE 6: //Selected Wait
    |OP_Xsel = ON
    |OP_Xdesel = OFF
    |OP_XselIL = ON
    |OP_XdeselIL = OFF
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    IF (|OP_XselPB = OFF) THEN 
     &OP_XtimerAcc = &OP_XtimerAcc + &lastScanTimeFast
    ELSE
     &OP_XtimerAcc = 0
    ENDIF  
        
    IF (&OP_Xcmd = 0) AND (&OP_XtimerAcc > 50)  THEN
     &Temp2 = 7           
    ENDIF 
  
   CASE 7: //Selected and Deselection Available
    |OP_Xsel = ON
    |OP_Xdesel = OFF
    |OP_XselIL = ON
    |OP_XdeselIL = OFF
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    IF (&OP_Xcmd = 2) THEN
     &Temp2 = 11      
    ELSIF (|OP_XdeselPB = ON) THEN
     &Temp2 = 11
    ELSIF (&OP_Xmsg > 0) THEN
     &Temp2 = 11           
    ENDIF    

   CASE 11: //Deselected Oneshot
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = OFF
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = ON
    
    &Temp2 = 12     

   CASE 12: //Deselected Wait
    |OP_Xsel = OFF
    |OP_Xdesel = ON
    |OP_XselIL = OFF
    |OP_XdeselIL = ON
    |OP_XselOns = OFF
    |OP_XdeselOns = OFF
    
    IF (&OP_Xmsg = 0) THEN
     IF (&OP_Xcmd = 0) AND (|OP_XdeselPB = OFF) THEN
      &Temp2 = 1           
     ENDIF 
    ELSE
     IF (&OP_Xcmd = 0) AND (|OP_XdeselPB = OFF) THEN
      &Temp2 = 3           
     ENDIF  
    ENDIF    
           
   DEFAULT:
    &Temp2 = 0
    &OP_XtimerAcc = 0
  ENDSEL

  IF &Temp2 <> &OP_Xstate THEN
   &OP_Xstate = &Temp2
   &OP_XtimerAcc = 0  
  ENDIF
   
  //Update Values
  &OP_Xstatus[&Temp1*5] = &OP_Xstatus
  &OP_Xstate[&Temp1*5] = &OP_Xstate
  &OP_XtimerAcc[&Temp1*5] = &OP_XtimerAcc  
 NEXT &Temp1 

 //*******************************************************************
 //PID
 //*******************************************************************
  
  //cmd 0=none 1=auto 2=manualSO 3=manualPID
  SELECT &DPC12cmd
   CASE 0:
    //No action
   CASE 1:
    |DPC12manualPID = OFF
    |DPC12manualSO = OFF  
   CASE 2:
    |DPC12manualPID = OFF
    |DPC12manualSO = ON
   CASE 3:
    |DPC12manualPID = ON
    |DPC12manualSO = OFF
        
   DEFAULT:
  ENDSEL
  &DPC12cmd = 0
  
  &Temp2 = &DPC12state  
  SELECT &DPC12state
   CASE 0:
    &DPC12tacc = 0   
   //Transistion Conditions   
    IF (|DPC12manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|DPC12manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|DPC12autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF      
             
   CASE 1: //PID mode
    &DPC12tacc =  &DPC12tacc + &lastScanTimeFast
    IF (&DPC12tacc > 100) THEN
     &DPC12tacc = 0
     IF (|DPC12revMode = ON) THEN   
      &DPC12err = &DPC12sp - &DPC12pv
     ELSE
      &DPC12err = &DPC12pv - &DPC12sp
     ENDIF       
     &Calc01 = &DPC12err * (&DPC12i / 100.0)
     &Calc02 = (&DPC12err - &DPC12errLast) * (&DPC12p / 100.0)
     &DPC12cv = &DPC12cv + &Calc01
     &DPC12cv = &DPC12cv + &Calc02
     &DPC12errLast = &DPC12err
     &DPC12errLastLast = &DPC12errLast
    ENDIF
   //Transistion Conditions    
    IF (|DPC12manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|DPC12manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|DPC12autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
      
   CASE 2: //SO mode
    &DPC12tacc = 0   
    IF (|DPC12revMode = ON) THEN   
     &DPC12err = &DPC12sp - &DPC12pv
    ELSE
     &DPC12err = &DPC12pv - &DPC12sp
    ENDIF
    &DPC12errLast = &DPC12err
    &DPC12errLastLast = &DPC12errLast
   //Transistion Conditions    
    IF (|DPC12manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|DPC12manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|DPC12autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
            
   DEFAULT:
   
  ENDSEL

  IF &Temp2 <> &DPC12state THEN
   &DPC12state = &Temp2  
  ENDIF

  IF (&DPC12cv > 10000) THEN
   &DPC12cv = 10000
  ELSIF (&DPC12cv < 0) THEN
   &DPC12cv = 0 
  ENDIF

  &PP02_SPD = &DPC12cv

  //**********************************************************************
  //RC21
  // pv=R21=FT02/FT01, range 0.000 - 10.000
  // cv=CV01, i/p convertor, pressure range 0.00%-100.00%
   
  //cmd 0=none 1=auto 2=manualSO 3=manualPID
  SELECT &RC21cmd
   CASE 0:
    //No action
   CASE 1:
    |RC21manualPID = OFF
    |RC21manualSO = OFF  
   CASE 2:
    |RC21manualPID = OFF
    |RC21manualSO = ON
   CASE 3:
    |RC21manualPID = ON
    |RC21manualSO = OFF
        
   DEFAULT:
  ENDSEL
  &RC21cmd = 0
  
  &Temp2 = &RC21state  
  SELECT &RC21state
   CASE 0:
    &RC21tacc = 0   
   //Transistion Conditions   
    IF (|RC21manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC21manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC21autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF      
             
   CASE 1: //PID mode
    &RC21tacc =  &RC21tacc + &lastScanTimeFast
    IF (&RC21tacc > 100) THEN
     &RC21tacc = 0
     IF (|RC21revMode = ON) THEN   
      &RC21err = &RC21sp - &RC21pv
     ELSE
      &RC21err = &RC21pv - &RC21sp
     ENDIF       
     &Calc01 = &RC21err * (&RC21i / 100.0)
     &Calc02 = (&RC21err - &RC21errLast) * (&RC21p / 100.0)
     &RC21cv = &RC21cv + &Calc01
     &RC21cv = &RC21cv + &Calc02
     &RC21errLast = &RC21err
     &RC21errLastLast = &RC21errLast
    ENDIF
   //Transistion Conditions    
    IF (|RC21manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC21manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC21autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
      
   CASE 2: //SO mode
    &RC21tacc = 0   
    IF (|RC21revMode = ON) THEN   
     &RC21err = &RC21sp - &RC21pv
    ELSE
     &RC21err = &RC21pv - &RC21sp
    ENDIF
    &RC21errLast = &RC21err
    &RC21errLastLast = &RC21errLast
   //Transistion Conditions    
    IF (|RC21manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC21manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC21autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
            
   DEFAULT:
   
  ENDSEL

  IF &Temp2 <> &RC21state THEN
   &RC21state = &Temp2  
  ENDIF

  IF (&RC21cv > 10000) THEN
   &RC21cv = 10000
  ELSIF (&RC21cv < 0) THEN
   &RC21cv = 0 
  ENDIF

  &CV01 = &RC21cv
  
  //**********************************************************************
  //RC13
  // pv=R13=FT01/FT03, range 0.00 - 100.00
  // cv=PP01_SPD, range 0.00%-100.00%
  //cmd 0=none 1=auto 2=manualSO 3=manualPID
  SELECT &RC13cmd
   CASE 0:
    //No action
   CASE 1:
    |RC13manualPID = OFF
    |RC13manualSO = OFF  
   CASE 2:
    |RC13manualPID = OFF
    |RC13manualSO = ON
   CASE 3:
    |RC13manualPID = ON
    |RC13manualSO = OFF
        
   DEFAULT:
  ENDSEL
  &RC13cmd = 0
  
  &Temp2 = &RC13state  
  SELECT &RC13state
   CASE 0:
    &RC13tacc = 0   
   //Transistion Conditions   
    IF (|RC13manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC13manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC13autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF      
             
   CASE 1: //PID mode
    &RC13tacc =  &RC13tacc + &lastScanTimeFast
    IF (&RC13tacc > 100) THEN
     &RC13tacc = 0
     IF (|RC13revMode = ON) THEN   
      &RC13err = &RC13sp - &RC13pv
     ELSE
      &RC13err = &RC13pv - &RC13sp
     ENDIF       
     &Calc01 = &RC13err * (&RC13i / 100.0)
     &Calc02 = (&RC13err - &RC13errLast) * (&RC13p / 100.0)
     &RC13cv = &RC13cv + &Calc01
     &RC13cv = &RC13cv + &Calc02
     &RC13errLast = &RC13err
     &RC13errLastLast = &RC13errLast
    ENDIF
   //Transistion Conditions    
    IF (|RC13manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC13manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC13autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
      
   CASE 2: //SO mode
    &RC13tacc = 0   
    IF (|RC13revMode = ON) THEN   
     &RC13err = &RC13sp - &RC13pv
    ELSE
     &RC13err = &RC13pv - &RC13sp
    ENDIF
    &RC13errLast = &RC13err
    &RC13errLastLast = &RC13errLast
   //Transistion Conditions    
    IF (|RC13manualSO = ON) THEN
     &Temp2 = 2
    ELSIF  (|RC13manualPID = ON) THEN  
     &Temp2 = 1
    ELSIF  (|RC13autoPID = ON) THEN  
     &Temp2 = 1
    ELSE
     &Temp2 = 2
    ENDIF     
            
   DEFAULT:
   
  ENDSEL

  IF &Temp2 <> &RC13state THEN
   &RC13state = &Temp2  
  ENDIF

  IF (&RC13cv > 10000) THEN
   &RC13cv = 10000
  ELSIF (&RC13cv < 0) THEN
   &RC13cv = 0 
  ENDIF

  &PP01_SPD = &RC13cv
 
//***************************************************************************

    
     
 //Outputs
 |SP1 = OFF
 |SP2 = OFF
 |SP3 = OFF
 |SP4 = OFF
 
 |PB02_O = |OP_PRODselIL
 |PB01_O = |OP_DRAINselIL
 |PB03_O = |OP_WATERselIL
 |PB04_O = |OP_CIPselIL  

 |PP01_O = |PP01out
 |PP02_O = |PP02out
 
 |V01_OE = |V01out
 |V02_OE = |V02out
 
 //V03
 IF (|V03out = ON) THEN
  |V03_OE = ON
  |V03_OD = OFF
 ELSE
  |V03_OE = OFF 
  |V03_OD = ON
 ENDIF
 
 //V04
 IF (|V04out = ON) THEN
  |V04_OE = ON
  |V04_OD = OFF  
 ELSE
  |V04_OE = OFF 
  |V04_OD = ON
 ENDIF
 
 //V05 
 IF (|V05out = ON) THEN
  |V05_OE = ON
  |V05_OD = OFF  
 ELSE
  |V05_OE = OFF 
  |V05_OD = ON
 ENDIF
 
 //V06
 IF (|V06out = ON) THEN
  |V06_OE = ON
  |V06_OD = OFF
 ELSE
  |V06_OE = OFF 
  |V06_OD = ON
 ENDIF
 
 //V07
 IF (|V07out = ON) THEN
  |V07_OE = ON
   |V07_OD = OFF
 ELSE 
  |V07_OE = OFF
  |V07_OD = ON
 ENDIF
 
 //V10
 |V10_OE = |V10out

 //V11
 |V11_OE = |V11out

 IF |F1_BUTTON = ON AND |F3_BUTTON =ON AND (&STATE = 0) THEN
  SELECT &displayState 
   CASE  15:
    EDIT &RC21SP01
    &EDIT_MAX=10000
    &EDIT_MIN=0
    &EDIT_DEF=&RC21SP01
    WRITE ""
    WRITE "RC21SP01"
    &STATE=ADDR(&RC21SP01)

   CASE  18:
    EDIT &RC13SP01
    &EDIT_MAX=1000
    &EDIT_MIN=0
    &EDIT_DEF=&RC13SP01
    WRITE ""
    WRITE "RC13SP01"
    &STATE=ADDR(&RC13SP01)
    
   DEFAULT:
  ENDSEL  
 ENDIF
   
END

//Called by the operating system when Prog button is pressed in edit mode
EDIT_MACRO:
 SELECT &STATE  
      
  CASE ADDR(&RC21SP01):
   EXIT_EDIT &RC21SP01   
      
  CASE ADDR(&RC13SP01):
   EXIT_EDIT &RC13SP01 
      
  //DEFAULT:
  // &STATE = 0
 ENDSEL
 
END

