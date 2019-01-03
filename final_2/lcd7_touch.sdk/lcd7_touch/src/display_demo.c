
#include "xil_types.h"
#include <stdio.h>
#include <math.h>
#include "xparameters.h"
#include "xil_io.h"
#include<complex.h>
#include"D:\study\c\la\complex_matric.h"

void CLEAR_BUF()
{
	char ch;
	while ((ch = getchar()) != EOF && ch != '\n');
}

int main(void)
{

    u16 num=0; //进行读数的计数和循环跳出
    s32 a;    //储存读取的数据
    char tep; //判断时候单回还是双回

	while(1){
		num=0;
		tep=getchar();   //读取指令，S或D
		CLEAR_BUF();

		//单回  单回共504个数据 S的ascii码对应83
		if(tep==83){
			//printf("single start\n");
			//清空标志位并发送指令
			Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000,0);    //清空标志位
			Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000, 0x0F0F0F01); //发送指令

			//延时,确保FPGA收到数据 并初始化标志位
			usleep(1000 * 500); //sleep 0.5s 确定FPGA收到信号
			Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000,0);

			//printf("single waiting\n");
			while(num==0){
				a = Xil_In32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000);
				if (a==0xF0F0F0F1)
				{
					num=1;
				}
			}
			num=0;
			//printf("single data\n");
			for( num=1; num<680; num++ )
				{
					a = Xil_In32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + num*4);
					printf( "%d \n", a);
					usleep(100); // 100us
				}
			}
			//双回 共672个数据  D的ascii码对应68
			else if(tep==68){
				//printf("double start\n");
				//清空标志位并发送指令
				Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000, 0);    //清空标志位
				Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000, 0x0F0F0F02); //发送指令

				//延时,确保FPGA收到数据 并初始化标志位
				usleep(1000 * 500); //sleep 0.5s 确定FPGA收到信号
				Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000, 0);

				//printf("double waiting\n");
				while(num==0)
	          	{
	          		a = Xil_In32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000);
	          		if (a==0xF0F0F0F2)
	          		{
						num=1;
	          		}
	          	}
				num=0;
				//printf("double data\n");
				for( num=1; num<680; num++ )
	          	{
	          	    a = Xil_In32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + num*4);
	          	    printf( "%d \n", a);
	          	    usleep(100); // 100us
	          	}
	        }else{
	        	printf( "wrong!!");
	        }
	        usleep(1000 * 500); // 0.5s
	        printf( "F");    //发送测量结束指令
	}
}










