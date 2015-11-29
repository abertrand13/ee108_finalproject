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
    work_m_00000000002129617870_0647936010_init();
    work_m_00000000003892093808_0067806752_init();
    work_m_00000000002129617870_3281722346_init();
    work_m_00000000003349729749_2082343157_init();
    work_m_00000000003128334299_1636751176_init();
    work_m_00000000004026335985_2887619308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004026335985_2887619308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
