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
    work_m_04396722342658220445_2153102842_init();
    work_m_03389591354448859605_2017953780_init();
    work_m_02580701195797488590_3665832619_init();
    work_m_04495924095399244422_2171520100_init();
    work_m_05730596030376708827_0407206800_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_05730596030376708827_0407206800");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
