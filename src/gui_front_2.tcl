package require Tk

#package require ::quartus::flow 1.1
#package require ::quartus::device 1.0
#package require ::quartus::incremental_compilation 1.1
#package require ::quartus::insystem_memory_edit 1.0
#package require ::quartus::insystem_source_probe 1.0
#package require ::quartus::jtag 1.0
#package require ::quartus::logic_analyzer_interface 1.0
#package require ::quartus::misc 1.0
#package require ::quartus::project 6.0
#package require ::quartus::rapid_recompile 1.0
#package require ::quartus::report 2.1
#package require ::quartus::sdc 1.5
#package require ::quartus::sdc_ext 1.0
#package require ::quartus::sta 1.0


variable usbblaster_name
variable device_name

set stb_issp 0
set cprb_issp 1

foreach hardware_name [get_hardware_names] {
   
    if { [string match "USB-Blaster*" $hardware_name]} {
          set usbblaster_name $hardware_name
       }
}

set device_name [lindex [get_device_names -hardware_name $usbblaster_name] 0]

set sch_image [image create photo -file ./mips_ss_v2_sch.gif]
start_insystem_source_probe -device_name $device_name -hardware_name $usbblaster_name

label .sch -image $sch_image

text .stb_num -relief sunken -height 1 -width 3
text .regdst -relief sunken -height 1 -width 1
text .memread  -relief sunken -height 1 -width 1
text .memtoreg -relief sunken -height 1 -width 1
text .memwrite -relief sunken -height 1 -width 1
text .branch  -relief sunken -height 1 -width 1
text .alusrc  -relief sunken -height 1 -width 1
text .regwrite -relief sunken -height 1 -width 1
text .aluop  -relief sunken -height 1 -width 2
text .zerot -relief sunken -height 1 -width 1
text .opcode  -relief sunken -height 1 -width 6

button .update_val -text "JTAG Refresh" -command update_issp
#button .run_stpw -text "STap-II" -command run_stpw_cmd
#button .run_mem -text "Mem Ed" -command run_memed
pack .sch


place .stb_num -x 70 -y 385
place .update_val -x 34 -y 497
#place .run_stpw -x 7 -y 11
#place .run_mem -x 7 -y 57

place .regdst -x 723 -y 253
place .memread -x 990 -y 73
place .memtoreg -x 1782 -y 365
place .memwrite -x 1699 -y 319
place .branch  -x 1371 -y 141
place .alusrc  -x 1141 -y 309
place .regwrite -x 989 -y 250
place .aluop  -x 1040 -y 166
place .zerot -x 1390 -y 185
place .opcode  -x 667 -y 81



set ::rst "0"
 pack [radiobutton .rstone   -value "1" -text "1(Reset)" -variable rst]
 pack [radiobutton .rstzero   -value "0" -text "0" -variable rst]

place .rstone -x 21 -y 465
place .rstzero -x 100 -y 465


proc hex2dec {largeHex} {
    set res 0
    foreach hexDigit [split $largeHex {}] {
        set new 0x$hexDigit
        set res [expr {16*$res + $new}]
    }
    return $res
}

 proc int2bits {i} {
    
     set res ""
     while {$i>0} {
         set res [expr {$i%2}]$res
         set i [expr {$i/2}]
     }
     if {$res==""} {set res 0}
     return $res
 }

puts $device_name

#proc run_stpw_cmd {} {
#        quartus_stpw mips_ss_v2.stp &
#        }
#
#proc run_memed {} {
#        puts "memed"
#        }


proc update_issp {} {
        global device_name usbblaster_name stb_issp cprb_issp rst 

        set conone 1
        set conzero 0

        set stb_num_int [.stb_num get 1.0 1.end]

        set stb_num_bin [format %08u [int2bits $stb_num_int]]
       
        #puts $rf_sa_add_bin$rf_sb_add_bin$rf_wd_data_int$rf_wa_bin$rf_wen 
        #puts [$rst$conone$stb_num_bin] 
        #puts $dm_data_bin$dm_wen 
        #puts $alu_opt_bin$alu_a_int$alu_b_int 
       
       #puts $rst$conone$stb_num_bin 
       
       write_source_data -instance_index $stb_issp -value $rst$conone$stb_num_bin 
       after 50
       write_source_data -instance_index $stb_issp -value $conzero$conzero$stb_num_bin
       after 50

       set cprb_out [read_probe_data -instance_index $cprb_issp]
       #puts $cprb_out

       .regdst delete 1.0 end
       .regdst insert end [string index $cprb_out 9]

       .memread delete 1.0 end 
       .memread insert end [string index $cprb_out 8] 

       .memtoreg delete 1.0 end 
       .memtoreg insert end [string index $cprb_out 7] 

       .memwrite delete 1.0 end 
       .memwrite insert end [string index $cprb_out 6] 

       .branch delete 1.0 end 
       .branch insert end [string index $cprb_out 5] 

       .alusrc delete 1.0 end 
       .alusrc insert end [string index $cprb_out 4] 

       .regwrite delete 1.0 end 
       .regwrite insert end [string index $cprb_out 3] 

       .aluop delete 1.0 end 
       .aluop insert end [string range $cprb_out 1 2] 

       .zerot delete 1.0 end 
       .zerot insert end [string index $cprb_out 0] 

       .opcode delete 1.0 end 
       .opcode insert end [string range $cprb_out 10 15] 

       # write_source_data -instance_index $in_1_issp -value [int2bits $in_1_int]
       # write_source_data -instance_index $in_2_issp -value [int2bits $in_2_int]
       # write_source_data -instance_index $ctrl_issp -value [int2bits $addsub]
       #
       # set out1_hex [read_probe_data -instance_index $out1_issp -value_in_hex] 
       # set out1_int [hex2dec $out1_hex]

       # .out1 delete 1.0 end
       # .out1 insert end $out1_int

}

tkwait window .
end_insystem_source_probe

puts "GUI Closed"
