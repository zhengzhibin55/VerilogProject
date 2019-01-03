
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

    u16 num=0; //���ж����ļ�����ѭ������
    s32 a;    //�����ȡ������
    char tep; //�ж�ʱ�򵥻ػ���˫��

	while(1){
		num=0;
		tep=getchar();   //��ȡָ�S��D
		CLEAR_BUF();

		//����  ���ع�504������ S��ascii���Ӧ83
		if(tep==83){
			//printf("single start\n");
			//��ձ�־λ������ָ��
			Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000,0);    //��ձ�־λ
			Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000, 0x0F0F0F01); //����ָ��

			//��ʱ,ȷ��FPGA�յ����� ����ʼ����־λ
			usleep(1000 * 500); //sleep 0.5s ȷ��FPGA�յ��ź�
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
			//˫�� ��672������  D��ascii���Ӧ68
			else if(tep==68){
				//printf("double start\n");
				//��ձ�־λ������ָ��
				Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 8000, 0);    //��ձ�־λ
				Xil_Out32(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + 7000, 0x0F0F0F02); //����ָ��

				//��ʱ,ȷ��FPGA�յ����� ����ʼ����־λ
				usleep(1000 * 500); //sleep 0.5s ȷ��FPGA�յ��ź�
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
	        printf( "F");    //���Ͳ�������ָ��
	}
}









