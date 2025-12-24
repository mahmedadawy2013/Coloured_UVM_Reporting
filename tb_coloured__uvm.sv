// Include UVM macros
`include "uvm_macros.svh"

// Import UVM package
import uvm_pkg::*;
module trial_uvm_coloured_reporting();
string str_msg_color="0;33m";
string msg = "Hi Gusy";
int dsa = 10;
    typedef enum int {
        GREEN               = 1,
        YELLOW              = 2,
        BLUE                = 3,
        MAGENTA             = 4,
        CYAN                = 5,
        WHITE               = 6,
        BOLD_GREEN          = 7,
        BOLD_YELLOW         = 8,
        BOLD_BLUE           = 9,
        BOLD_MAGENTA        = 10,
        BOLD_CYAN           = 11,
        BOLD_WHITE          = 12,
        UNDERLINE_GREEN     = 13,
        UNDERLINE_YELLOW    = 14,
        UNDERLINE_BLUE      = 15,
        UNDERLINE_MAGENTA   = 16,
        UNDERLINE_CYAN      = 17,
        UNDERLINE_WHITE     = 18,
        BACKGROUND_GREEN    = 19,
        BACKGROUND_YELLOW   = 20,
        BACKGROUND_BLUE     = 21,
        BACKGROUND_MAGENTA  = 22,
        BACKGROUND_CYAN     = 23,
        BACKGROUND_WHITE    = 24
    } PrintColorEnum;

`define uvmc_info(root,msg,level,msg_color)\
    case (msg_color)\
        GREEN               : str_msg_color = "0;32m";\
        YELLOW              : str_msg_color = "0;33m";\
        BLUE                : str_msg_color = "0;34m";\
        MAGENTA             : str_msg_color = "0;35m";\
        CYAN                : str_msg_color = "0;36m";\
        WHITE               : str_msg_color = "0;37m";\
        BOLD_GREEN          : str_msg_color = "1;32m";\
        BOLD_YELLOW         : str_msg_color = "1;33m";\
        BOLD_BLUE           : str_msg_color = "1;34m";\
        BOLD_MAGENTA        : str_msg_color = "1;35m";\
        BOLD_CYAN           : str_msg_color = "1;36m";\
        BOLD_WHITE          : str_msg_color = "1;37m";\
        UNDERLINE_GREEN     : str_msg_color = "4;32m";\
        UNDERLINE_YELLOW    : str_msg_color = "4;33m";\
        UNDERLINE_BLUE      : str_msg_color = "4;34m";\
        UNDERLINE_MAGENTA   : str_msg_color = "4;35m";\
        UNDERLINE_CYAN      : str_msg_color = "4;36m";\
        UNDERLINE_WHITE     : str_msg_color = "4;37m";\
        BACKGROUND_GREEN    : str_msg_color = "42m";\
        BACKGROUND_YELLOW   : str_msg_color = "43m";\
        BACKGROUND_BLUE     : str_msg_color = "44m";\
        BACKGROUND_MAGENTA  : str_msg_color = "45m";\
        BACKGROUND_CYAN     : str_msg_color = "46m";\
        BACKGROUND_WHITE    : str_msg_color = "47m";\
        default             : str_msg_color = "1;34m";\
    endcase\
    `uvm_info(root, $sformatf("%c[%s: %s %c[0m", 27,str_msg_color, msg , 27), level);\

`define uvmc_error(root,msg)\
    str_msg_color = "1;31m";\
    `uvm_error(root, $sformatf("%c[%s: %s %c[0m", 27,str_msg_color, msg , 27));\

initial begin 
    `uvmc_info("UVM_HELLO", $sformatf("SBA7O : %0d",dsa), UVM_MEDIUM, GREEN);
    #500ns;
    uvm_root::get().set_report_max_quit_count(7);
    for(int i = 0; i<10; i++) begin 
        `uvmc_error("SIMPLE_ERROR", "This is a simple error message");
    end 
    $display("Hey %c",27);
    $finish();
end 



endmodule
