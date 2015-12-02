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
    work_m_00000000002129617870_3665832619_init();
    work_m_00000000002129617870_1123187982_init();
    work_m_00000000002129617870_0647936010_init();
    work_m_00000000003892093808_0067806752_init();
    work_m_00000000003678845591_1636751176_init();
    work_m_00000000001375583632_2887619308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001375583632_2887619308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
