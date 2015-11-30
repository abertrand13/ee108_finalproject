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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//afs/ir/class/ee108/groups/8/final_project/launchpad_interface.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {10U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {7U, 0U};
static unsigned int ng10[] = {11U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {12U, 0U};
static unsigned int ng14[] = {13U, 0U};
static unsigned int ng15[] = {15U, 0U};
static unsigned int ng16[] = {14U, 0U};



static void Cont_8_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 1536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(8, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1928);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 15U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 3);
    t18 = (t0 + 1876);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_10_1(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 1680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(10, ng0);
    t2 = (t0 + 1884);
    *((int *)t2) = 1;
    t3 = (t0 + 1708);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(10, ng0);

LAB5:    xsi_set_current_line(11, ng0);
    t5 = (t0 + 692U);
    t6 = *((char **)t5);
    t5 = (t0 + 600U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 4, 4, 2U, t7, 2, t6, 2);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t8 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(28, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB41:    goto LAB2;

LAB7:    xsi_set_current_line(12, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 1012);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 4);
    goto LAB41;

LAB9:    xsi_set_current_line(13, ng0);
    t3 = ((char*)((ng3)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB11:    xsi_set_current_line(14, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB13:    xsi_set_current_line(15, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB15:    xsi_set_current_line(16, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB17:    xsi_set_current_line(17, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB19:    xsi_set_current_line(18, ng0);
    t3 = ((char*)((ng8)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB21:    xsi_set_current_line(19, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB23:    xsi_set_current_line(20, ng0);
    t3 = ((char*)((ng9)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB25:    xsi_set_current_line(21, ng0);
    t3 = ((char*)((ng11)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB27:    xsi_set_current_line(22, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB29:    xsi_set_current_line(23, ng0);
    t3 = ((char*)((ng13)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB31:    xsi_set_current_line(24, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB33:    xsi_set_current_line(25, ng0);
    t3 = ((char*)((ng15)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB35:    xsi_set_current_line(26, ng0);
    t3 = ((char*)((ng16)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

LAB37:    xsi_set_current_line(27, ng0);
    t3 = ((char*)((ng14)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB41;

}


extern void work_m_00000000000621157741_0624571120_init()
{
	static char *pe[] = {(void *)Cont_8_0,(void *)Always_10_1};
	xsi_register_didat("work_m_00000000000621157741_0624571120", "isim/color_changer_tb_isim_beh.exe.sim/work/m_00000000000621157741_0624571120.didat");
	xsi_register_executes(pe);
}
