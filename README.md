#include <mega16.h>
#include <alcd.h>
#include <delay.h>
#include <stdio.h>

int Hor = 0, Min = 0, Sec = 0;
char Monitor_0[16];

void SetTime()
{
    Sec++;
    if(Sec >= 60)
    {
        Sec = 0;
        Min++;
    }
    if(Min >= 60)
    {
        Min = 0;
        Hor++;
    }
    if(Min >= 100)
    {
        Hor = 0;
    }
    delay_ms(1000);
}

void main(void)
{
lcd_init(16);

while (1)
      { 
         sprintf(Monitor_0, " Time: %02d:%02d:%02d ", Hor, Min, Sec);
         lcd_gotoxy(0, 0);
         lcd_puts(Monitor_0);
         
         if(PINA.0 == 1)
         {
            SetTime();
         }
      }
}