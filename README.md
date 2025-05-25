#include <mega16.h>
#include <delay.h>

// داده‌های حروف برای ماتریس 8x8
const unsigned char IMAN[4][8] = {
    {0x3E, 0x41, 0x41, 0x3E, 0x00, 0x00, 0x00, 0x00}, // I
    {0x7F, 0x09, 0x09, 0x7F, 0x00, 0x00, 0x00, 0x00}, // M
    {0x7F, 0x49, 0x49, 0x41, 0x00, 0x00, 0x00, 0x00}, // A
    {0x7F, 0x09, 0x19, 0x6F, 0x00, 0x00, 0x00, 0x00}  // N
};

void displayChar(const unsigned char character[8]) {
    for (int i = 0; i < 8; i++) {
        PORTD = ~(1 << i);  // انتخاب سطر (فعال‌سازی یک سطر در هر لحظه)
        PORTC = character[i]; // مقدار مربوط به آن سطر را در ستون‌ها قرار می‌دهیم
        delay_ms(2); // تأخیر برای نمایش درست
    }
}

void main() {
    DDRD = 0xFF;  // پورت D خروجی (کنترل سطرها)
    DDRC = 0xFF;  // پورت C خروجی (کنترل ستون‌ها)

    while (1) {
        for (int letter = 0; letter < 4; letter++) {
            for (int t = 0; t < 500; t++) { // نمایش هر حرف به مدت 1 ثانیه (500x2ms)
                displayChar(IMAN[letter]);
            }
            delay_ms(3000); // مکث 3 ثانیه بین حروف
        }
    }
}
