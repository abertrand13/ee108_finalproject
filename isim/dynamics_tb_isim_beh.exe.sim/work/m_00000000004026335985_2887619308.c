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
static const char *ng0 = "//afs/ir/class/ee108/groups/8/final_project/dynamics_tb.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {4, 0};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {3U, 0U};
static const char *ng6 = "Duration: %b, new_sample_ready : %b, final_sample: %b, expected: %b";
static int ng7[] = {0, 0};
static unsigned int ng8[] = {10400U, 0U};
static unsigned int ng9[] = {9100U, 0U};
static const char *ng10 = "Duration: %b, new_sample_ready : %b, final_sample expected? %b";
static unsigned int ng11[] = {7800U, 0U};
static unsigned int ng12[] = {6500U, 0U};
static unsigned int ng13[] = {5200U, 0U};
static unsigned int ng14[] = {3900U, 0U};
static unsigned int ng15[] = {2600U, 0U};
static unsigned int ng16[] = {1300U, 0U};
static unsigned int ng17[] = {24U, 0U};



static void Initial_13_0(char *t0)
{
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;

LAB0:    t1 = (t0 + 1904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(13, ng0);

LAB4:    xsi_set_current_line(14, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(16, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 3932);
    *((int *)t8) = t7;

LAB5:    t9 = (t0 + 3932);
    if (*((int *)t9) > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(17, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(18, ng0);

LAB15:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1804);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB6:    xsi_set_current_line(16, ng0);
    t10 = (t0 + 1804);
    xsi_process_wait(t10, 5000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(16, ng0);
    t12 = (t0 + 920);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    memset(t11, 0, 8);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB12;

LAB10:    if (*((unsigned int *)t15) == 0)
        goto LAB9;

LAB11:    t21 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t21) = 1;

LAB12:    t22 = (t11 + 4);
    t23 = (t14 + 4);
    t24 = *((unsigned int *)t14);
    t25 = (~(t24));
    *((unsigned int *)t11) = t25;
    *((unsigned int *)t22) = 0;
    if (*((unsigned int *)t23) != 0)
        goto LAB14;

LAB13:    t30 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t30 & 1U);
    t31 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t31 & 1U);
    t32 = (t0 + 920);
    xsi_vlogvar_assign_value(t32, t11, 0, 0, 1);
    t2 = (t0 + 3932);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB5;

LAB9:    *((unsigned int *)t11) = 1;
    goto LAB12;

LAB14:    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t23);
    *((unsigned int *)t11) = (t26 | t27);
    t28 = *((unsigned int *)t22);
    t29 = *((unsigned int *)t23);
    *((unsigned int *)t22) = (t28 | t29);
    goto LAB13;

LAB16:    xsi_set_current_line(18, ng0);
    t3 = (t0 + 920);
    t8 = (t3 + 36U);
    t9 = *((char **)t8);
    memset(t11, 0, 8);
    t10 = (t9 + 4);
    t4 = *((unsigned int *)t10);
    t5 = (~(t4));
    t6 = *((unsigned int *)t9);
    t16 = (t6 & t5);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB20;

LAB18:    if (*((unsigned int *)t10) == 0)
        goto LAB17;

LAB19:    t12 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t12) = 1;

LAB20:    t13 = (t11 + 4);
    t14 = (t9 + 4);
    t18 = *((unsigned int *)t9);
    t19 = (~(t18));
    *((unsigned int *)t11) = t19;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB22;

LAB21:    t27 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t27 & 1U);
    t28 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t28 & 1U);
    t15 = (t0 + 920);
    xsi_vlogvar_assign_value(t15, t11, 0, 0, 1);
    goto LAB15;

LAB17:    *((unsigned int *)t11) = 1;
    goto LAB20;

LAB22:    t20 = *((unsigned int *)t11);
    t24 = *((unsigned int *)t14);
    *((unsigned int *)t11) = (t20 | t24);
    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t25 | t26);
    goto LAB21;

LAB23:    goto LAB1;

}

static void Initial_34_1(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 2048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);

LAB4:    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(38, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 30000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    xsi_vlogfile_write(1, 0, 0, ng6, 5, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t10, 16, (char)118, t12, 16);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 125000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB10;

LAB7:    if (t25 != 0)
        goto LAB9;

LAB8:    *((unsigned int *)t13) = 1;

LAB10:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 250000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB9:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB10;

LAB11:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB15;

LAB12:    if (t25 != 0)
        goto LAB14;

LAB13:    *((unsigned int *)t13) = 1;

LAB15:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 490000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB14:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB15;

LAB16:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB20;

LAB17:    if (t25 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t13) = 1;

LAB20:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 970000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB19:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB20;

LAB21:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB25;

LAB22:    if (t25 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t13) = 1;

LAB25:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 1930000LL);
    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB24:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB30;

LAB27:    if (t25 != 0)
        goto LAB29;

LAB28:    *((unsigned int *)t13) = 1;

LAB30:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 3850000LL);
    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB29:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB30;

LAB31:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB35;

LAB32:    if (t25 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t13) = 1;

LAB35:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 7690000LL);
    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB34:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB35;

LAB36:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB40;

LAB37:    if (t25 != 0)
        goto LAB39;

LAB38:    *((unsigned int *)t13) = 1;

LAB40:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 15370000LL);
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB39:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB40;

LAB41:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB45;

LAB42:    if (t25 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t13) = 1;

LAB45:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB46;
    goto LAB1;

LAB44:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB50;

LAB47:    if (t25 != 0)
        goto LAB49;

LAB48:    *((unsigned int *)t13) = 1;

LAB50:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng9)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 960000LL);
    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB49:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB50;

LAB51:    xsi_set_current_line(126, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB55;

LAB52:    if (t25 != 0)
        goto LAB54;

LAB53:    *((unsigned int *)t13) = 1;

LAB55:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng11)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 1920000LL);
    *((char **)t1) = &&LAB56;
    goto LAB1;

LAB54:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB55;

LAB56:    xsi_set_current_line(134, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB60;

LAB57:    if (t25 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t13) = 1;

LAB60:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng12)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 3840000LL);
    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB59:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB60;

LAB61:    xsi_set_current_line(142, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB65;

LAB62:    if (t25 != 0)
        goto LAB64;

LAB63:    *((unsigned int *)t13) = 1;

LAB65:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng13)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 7680000LL);
    *((char **)t1) = &&LAB66;
    goto LAB1;

LAB64:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB65;

LAB66:    xsi_set_current_line(150, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB70;

LAB67:    if (t25 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t13) = 1;

LAB70:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng14)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 15360000LL);
    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB69:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB70;

LAB71:    xsi_set_current_line(158, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB75;

LAB72:    if (t25 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t13) = 1;

LAB75:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng15)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 30720000LL);
    *((char **)t1) = &&LAB76;
    goto LAB1;

LAB74:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(166, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB80;

LAB77:    if (t25 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t13) = 1;

LAB80:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(169, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(171, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(172, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng16)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 61440000LL);
    *((char **)t1) = &&LAB81;
    goto LAB1;

LAB79:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB80;

LAB81:    xsi_set_current_line(174, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB85;

LAB82:    if (t25 != 0)
        goto LAB84;

LAB83:    *((unsigned int *)t13) = 1;

LAB85:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 6);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng1)));
    t3 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 16, t2, 16, t3, 16);
    t4 = (t0 + 1104);
    xsi_vlogvar_assign_value(t4, t13, 0, 0, 16);
    xsi_set_current_line(179, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 1948);
    xsi_process_wait(t2, 122880000LL);
    *((char **)t1) = &&LAB86;
    goto LAB1;

LAB84:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB85;

LAB86:    xsi_set_current_line(182, ng0);
    t3 = (t0 + 828);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 1196);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 600U);
    t10 = *((char **)t9);
    t9 = (t0 + 1380);
    t11 = (t9 + 36U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t14 = (t10 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB90;

LAB87:    if (t25 != 0)
        goto LAB89;

LAB88:    *((unsigned int *)t13) = 1;

LAB90:    xsi_vlogfile_write(1, 0, 0, ng10, 4, t0, (char)118, t5, 6, (char)118, t8, 1, (char)118, t13, 1);
    xsi_set_current_line(185, ng0);
    xsi_vlog_stop(1);
    goto LAB1;

LAB89:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB90;

}


extern void work_m_00000000004026335985_2887619308_init()
{
	static char *pe[] = {(void *)Initial_13_0,(void *)Initial_34_1};
	xsi_register_didat("work_m_00000000004026335985_2887619308", "isim/dynamics_tb_isim_beh.exe.sim/work/m_00000000004026335985_2887619308.didat");
	xsi_register_executes(pe);
}
