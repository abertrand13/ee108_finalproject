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
static const char *ng0 = "//afs/ir/class/ee108/groups/8/final_project/color_changer.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static unsigned int ng5[] = {1U, 0U};
static int ng6[] = {4, 0};
static int ng7[] = {5, 0};
static int ng8[] = {6, 0};



static void Always_49_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 2916U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3688);
    *((int *)t2) = 1;
    t3 = (t0 + 2944);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(49, ng0);

LAB5:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 1244U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2300);
    t4 = (t3 + 36U);
    t8 = *((char **)t4);
    t9 = (t0 + 2208);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = (t0 + 2116);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    t15 = (t0 + 2024);
    t16 = (t15 + 36U);
    t17 = *((char **)t16);
    t18 = (t0 + 1932);
    t19 = (t18 + 36U);
    t20 = *((char **)t19);
    t21 = (t0 + 1840);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t23, 4, t20, 4, t17, 4, t14, 4, t11, 4, t8, 4, t2, 1);
    t24 = (t0 + 2392);
    xsi_vlogvar_assign_value(t24, t7, 0, 0, 1);
    t25 = (t0 + 2300);
    xsi_vlogvar_assign_value(t25, t7, 1, 0, 4);
    t26 = (t0 + 2208);
    xsi_vlogvar_assign_value(t26, t7, 5, 0, 4);
    t27 = (t0 + 2116);
    xsi_vlogvar_assign_value(t27, t7, 9, 0, 4);
    t28 = (t0 + 2024);
    xsi_vlogvar_assign_value(t28, t7, 13, 0, 4);
    t29 = (t0 + 1932);
    xsi_vlogvar_assign_value(t29, t7, 17, 0, 4);
    t30 = (t0 + 1840);
    xsi_vlogvar_assign_value(t30, t7, 21, 0, 4);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(51, ng0);
    t8 = ((char*)((ng2)));
    t9 = (t0 + 2300);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = (t0 + 2208);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    t15 = (t0 + 2116);
    t16 = (t15 + 36U);
    t17 = *((char **)t16);
    t18 = (t0 + 2024);
    t19 = (t18 + 36U);
    t20 = *((char **)t19);
    t21 = (t0 + 1932);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    t24 = (t0 + 1428U);
    t25 = *((char **)t24);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t25, 4, t23, 4, t20, 4, t17, 4, t14, 4, t11, 4, t8, 1);
    t24 = (t0 + 2392);
    xsi_vlogvar_assign_value(t24, t7, 0, 0, 1);
    t26 = (t0 + 2300);
    xsi_vlogvar_assign_value(t26, t7, 1, 0, 4);
    t27 = (t0 + 2208);
    xsi_vlogvar_assign_value(t27, t7, 5, 0, 4);
    t28 = (t0 + 2116);
    xsi_vlogvar_assign_value(t28, t7, 9, 0, 4);
    t29 = (t0 + 2024);
    xsi_vlogvar_assign_value(t29, t7, 13, 0, 4);
    t30 = (t0 + 1932);
    xsi_vlogvar_assign_value(t30, t7, 17, 0, 4);
    t31 = (t0 + 1840);
    xsi_vlogvar_assign_value(t31, t7, 21, 0, 4);
    goto LAB21;

LAB9:    xsi_set_current_line(52, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2300);
    t8 = (t4 + 36U);
    t9 = *((char **)t8);
    t10 = (t0 + 2208);
    t11 = (t10 + 36U);
    t12 = *((char **)t11);
    t13 = (t0 + 2116);
    t14 = (t13 + 36U);
    t15 = *((char **)t14);
    t16 = (t0 + 2024);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    t19 = (t0 + 1428U);
    t20 = *((char **)t19);
    t19 = (t0 + 1840);
    t21 = (t19 + 36U);
    t22 = *((char **)t21);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t22, 4, t20, 4, t18, 4, t15, 4, t12, 4, t9, 4, t3, 1);
    t23 = (t0 + 2392);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 1);
    t24 = (t0 + 2300);
    xsi_vlogvar_assign_value(t24, t7, 1, 0, 4);
    t25 = (t0 + 2208);
    xsi_vlogvar_assign_value(t25, t7, 5, 0, 4);
    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 9, 0, 4);
    t27 = (t0 + 2024);
    xsi_vlogvar_assign_value(t27, t7, 13, 0, 4);
    t28 = (t0 + 1932);
    xsi_vlogvar_assign_value(t28, t7, 17, 0, 4);
    t29 = (t0 + 1840);
    xsi_vlogvar_assign_value(t29, t7, 21, 0, 4);
    goto LAB21;

LAB11:    xsi_set_current_line(53, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 2300);
    t8 = (t4 + 36U);
    t9 = *((char **)t8);
    t10 = (t0 + 2208);
    t11 = (t10 + 36U);
    t12 = *((char **)t11);
    t13 = (t0 + 2116);
    t14 = (t13 + 36U);
    t15 = *((char **)t14);
    t16 = (t0 + 1428U);
    t17 = *((char **)t16);
    t16 = (t0 + 1932);
    t18 = (t16 + 36U);
    t19 = *((char **)t18);
    t20 = (t0 + 1840);
    t21 = (t20 + 36U);
    t22 = *((char **)t21);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t22, 4, t19, 4, t17, 4, t15, 4, t12, 4, t9, 4, t3, 1);
    t23 = (t0 + 2392);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 1);
    t24 = (t0 + 2300);
    xsi_vlogvar_assign_value(t24, t7, 1, 0, 4);
    t25 = (t0 + 2208);
    xsi_vlogvar_assign_value(t25, t7, 5, 0, 4);
    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 9, 0, 4);
    t27 = (t0 + 2024);
    xsi_vlogvar_assign_value(t27, t7, 13, 0, 4);
    t28 = (t0 + 1932);
    xsi_vlogvar_assign_value(t28, t7, 17, 0, 4);
    t29 = (t0 + 1840);
    xsi_vlogvar_assign_value(t29, t7, 21, 0, 4);
    goto LAB21;

LAB13:    xsi_set_current_line(54, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2300);
    t8 = (t4 + 36U);
    t9 = *((char **)t8);
    t10 = (t0 + 2208);
    t11 = (t10 + 36U);
    t12 = *((char **)t11);
    t13 = (t0 + 1428U);
    t14 = *((char **)t13);
    t13 = (t0 + 2024);
    t15 = (t13 + 36U);
    t16 = *((char **)t15);
    t17 = (t0 + 1932);
    t18 = (t17 + 36U);
    t19 = *((char **)t18);
    t20 = (t0 + 1840);
    t21 = (t20 + 36U);
    t22 = *((char **)t21);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t22, 4, t19, 4, t16, 4, t14, 4, t12, 4, t9, 4, t3, 1);
    t23 = (t0 + 2392);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 1);
    t24 = (t0 + 2300);
    xsi_vlogvar_assign_value(t24, t7, 1, 0, 4);
    t25 = (t0 + 2208);
    xsi_vlogvar_assign_value(t25, t7, 5, 0, 4);
    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 9, 0, 4);
    t27 = (t0 + 2024);
    xsi_vlogvar_assign_value(t27, t7, 13, 0, 4);
    t28 = (t0 + 1932);
    xsi_vlogvar_assign_value(t28, t7, 17, 0, 4);
    t29 = (t0 + 1840);
    xsi_vlogvar_assign_value(t29, t7, 21, 0, 4);
    goto LAB21;

LAB15:    xsi_set_current_line(55, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2300);
    t8 = (t4 + 36U);
    t9 = *((char **)t8);
    t10 = (t0 + 1428U);
    t11 = *((char **)t10);
    t10 = (t0 + 2116);
    t12 = (t10 + 36U);
    t13 = *((char **)t12);
    t14 = (t0 + 2024);
    t15 = (t14 + 36U);
    t16 = *((char **)t15);
    t17 = (t0 + 1932);
    t18 = (t17 + 36U);
    t19 = *((char **)t18);
    t20 = (t0 + 1840);
    t21 = (t20 + 36U);
    t22 = *((char **)t21);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t22, 4, t19, 4, t16, 4, t13, 4, t11, 4, t9, 4, t3, 1);
    t23 = (t0 + 2392);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 1);
    t24 = (t0 + 2300);
    xsi_vlogvar_assign_value(t24, t7, 1, 0, 4);
    t25 = (t0 + 2208);
    xsi_vlogvar_assign_value(t25, t7, 5, 0, 4);
    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 9, 0, 4);
    t27 = (t0 + 2024);
    xsi_vlogvar_assign_value(t27, t7, 13, 0, 4);
    t28 = (t0 + 1932);
    xsi_vlogvar_assign_value(t28, t7, 17, 0, 4);
    t29 = (t0 + 1840);
    xsi_vlogvar_assign_value(t29, t7, 21, 0, 4);
    goto LAB21;

LAB17:    xsi_set_current_line(56, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1428U);
    t8 = *((char **)t4);
    t4 = (t0 + 2208);
    t9 = (t4 + 36U);
    t10 = *((char **)t9);
    t11 = (t0 + 2116);
    t12 = (t11 + 36U);
    t13 = *((char **)t12);
    t14 = (t0 + 2024);
    t15 = (t14 + 36U);
    t16 = *((char **)t15);
    t17 = (t0 + 1932);
    t18 = (t17 + 36U);
    t19 = *((char **)t18);
    t20 = (t0 + 1840);
    t21 = (t20 + 36U);
    t22 = *((char **)t21);
    xsi_vlogtype_concat(t7, 25, 25, 7U, t22, 4, t19, 4, t16, 4, t13, 4, t10, 4, t8, 4, t3, 1);
    t23 = (t0 + 2392);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 1);
    t24 = (t0 + 2300);
    xsi_vlogvar_assign_value(t24, t7, 1, 0, 4);
    t25 = (t0 + 2208);
    xsi_vlogvar_assign_value(t25, t7, 5, 0, 4);
    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 9, 0, 4);
    t27 = (t0 + 2024);
    xsi_vlogvar_assign_value(t27, t7, 13, 0, 4);
    t28 = (t0 + 1932);
    xsi_vlogvar_assign_value(t28, t7, 17, 0, 4);
    t29 = (t0 + 1840);
    xsi_vlogvar_assign_value(t29, t7, 21, 0, 4);
    goto LAB21;

}

static void Cont_61_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;

LAB0:    t1 = (t0 + 3060U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2300);
    t4 = (t2 + 36U);
    t5 = *((char **)t4);
    t6 = (t0 + 2208);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 2116);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = (t0 + 2024);
    t13 = (t12 + 36U);
    t14 = *((char **)t13);
    t15 = (t0 + 1932);
    t16 = (t15 + 36U);
    t17 = *((char **)t16);
    t18 = (t0 + 1840);
    t19 = (t18 + 36U);
    t20 = *((char **)t19);
    xsi_vlogtype_concat(t3, 24, 24, 6U, t20, 4, t17, 4, t14, 4, t11, 4, t8, 4, t5, 4);
    t21 = (t0 + 3764);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    memset(t25, 0, 8);
    t26 = 16777215U;
    t27 = t26;
    t28 = (t3 + 4);
    t29 = *((unsigned int *)t3);
    t26 = (t26 & t29);
    t30 = *((unsigned int *)t28);
    t27 = (t27 & t30);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t32 | t26);
    t33 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t33 | t27);
    xsi_driver_vfirst_trans(t21, 0, 23);
    t34 = (t0 + 3696);
    *((int *)t34) = 1;

LAB1:    return;
}

static void Cont_62_2(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;

LAB0:    t1 = (t0 + 3204U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB7;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t4) = 1;

LAB7:    t20 = (t0 + 3800);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 40U);
    t24 = *((char **)t23);
    memset(t24, 0, 8);
    t25 = 1U;
    t26 = t25;
    t27 = (t4 + 4);
    t28 = *((unsigned int *)t4);
    t25 = (t25 & t28);
    t29 = *((unsigned int *)t27);
    t26 = (t26 & t29);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t31 | t25);
    t32 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t32 | t26);
    xsi_driver_vfirst_trans(t20, 0, 0);
    t33 = (t0 + 3704);
    *((int *)t33) = 1;

LAB1:    return;
LAB6:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

}

static void implSig1_execute(char *t0)
{
    char t4[8];
    char t18[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;

LAB0:    t1 = (t0 + 3348U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (!(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    memcpy(t25, t4, 8);

LAB10:    t53 = (t0 + 3836);
    t54 = (t53 + 32U);
    t55 = *((char **)t54);
    t56 = (t55 + 40U);
    t57 = *((char **)t56);
    memset(t57, 0, 8);
    t58 = 1U;
    t59 = t58;
    t60 = (t25 + 4);
    t61 = *((unsigned int *)t25);
    t58 = (t58 & t61);
    t62 = *((unsigned int *)t60);
    t59 = (t59 & t62);
    t63 = (t57 + 4);
    t64 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t64 | t58);
    t65 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t65 | t59);
    xsi_driver_vfirst_trans(t53, 0, 0);
    t66 = (t0 + 3712);
    *((int *)t66) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1152U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t16 = (t17 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (~(t19));
    t21 = *((unsigned int *)t17);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t16) != 0)
        goto LAB13;

LAB14:    t26 = *((unsigned int *)t4);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = (t4 + 4);
    t30 = (t18 + 4);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t29);
    t33 = *((unsigned int *)t30);
    t34 = (t32 | t33);
    *((unsigned int *)t31) = t34;
    t35 = *((unsigned int *)t31);
    t36 = (t35 != 0);
    if (t36 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB13:    t24 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB14;

LAB15:    t37 = *((unsigned int *)t25);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t25) = (t37 | t38);
    t39 = (t4 + 4);
    t40 = (t18 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (~(t41));
    t43 = *((unsigned int *)t4);
    t44 = (t43 & t42);
    t45 = *((unsigned int *)t40);
    t46 = (~(t45));
    t47 = *((unsigned int *)t18);
    t48 = (t47 & t46);
    t49 = (~(t44));
    t50 = (~(t48));
    t51 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t51 & t49);
    t52 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t52 & t50);
    goto LAB17;

}

static void implSig2_execute(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
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

LAB0:    t1 = (t0 + 3492U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 3, t3, 3, t2, 3);
    t5 = (t0 + 3872);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 7U;
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
    xsi_driver_vfirst_trans(t5, 0, 2);
    t18 = (t0 + 3720);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000002954471055_1290347385_init()
{
	static char *pe[] = {(void *)Always_49_0,(void *)Cont_61_1,(void *)Cont_62_2,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("work_m_00000000002954471055_1290347385", "isim/color_changer_tb_isim_beh.exe.sim/work/m_00000000002954471055_1290347385.didat");
	xsi_register_executes(pe);
}
