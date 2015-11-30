/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000621157741_0624571120_init();
    work_m_00000000002129617870_2363133229_init();
    work_m_00000000002129617870_3281722346_init();
    work_m_00000000002954471055_1290347385_init();
    work_m_00000000002108915470_1547556834_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002108915470_1547556834");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
