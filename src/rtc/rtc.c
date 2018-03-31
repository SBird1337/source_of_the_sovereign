#include <pokeagb/pokeagb.h>

#define HIGH 1
#define LOW 0
#define IN 0
#define OUT 1

struct RtcTimestamp {
    u8 year;
    u8 month;
    u8 day;
    u8 day_of_week;
    u8 hour;
    u8 minute;
    u8 second;
};

struct RtcGpioData {
    u16 sck : 1;
    u16 sio : 1;
    u16 cs : 1;
    u16 unused : 1;
    u16 free : 12;
};

ASSERT_SIZEOF(struct RtcGpioData, 2);

struct RtcGpioDirection {
    u16 sck : 1;
    u16 sio : 1;
    u16 cs : 1;
    u16 unused : 1;
    u16 free : 12;
};

ASSERT_SIZEOF(struct RtcGpioDirection, 2);

extern struct RtcGpioData rtc_data;
extern struct RtcGpioDirection rtc_direction;
extern u16 rtc_control;

void rtc_wait_cycles(volatile u16 cycles);
void rtc_write(u8 b);
u8 rtc_read(void);

void rtc_get_time(struct RtcTimestamp* out)
{
    rtc_control = 1;

    rtc_direction.sck = OUT;
    rtc_direction.cs = OUT;
    rtc_data.cs = LOW;
    rtc_data.sck = HIGH;

    rtc_wait_cycles(20);

    rtc_data.cs = HIGH;
    rtc_wait_cycles(20);
    rtc_direction.sck = OUT;
    rtc_direction.cs = OUT;
    rtc_write(0x65);

    out->year = rtc_read();
    out->month = rtc_read();
    out->day = rtc_read();
    out->day_of_week = rtc_read();
    out->hour = rtc_read();
    out->minute = rtc_read();
    out->second = rtc_read();

    rtc_data.sck = LOW;
    rtc_data.sio = LOW;
    rtc_data.cs = LOW;
}

void rtc_write(u8 b){
    rtc_direction.sio = OUT;
    rtc_direction.sck = OUT;
    for(u8 i = 0; i < 8; ++i) {
        rtc_data.sck = LOW;
        rtc_data.sio = (b & 0x80) >> 7;
        b <<= 1;
        rtc_wait_cycles(100);
        rtc_data.sck = HIGH;
        rtc_wait_cycles(100);
    }
}

u8 rtc_read(void){
    u8 val = 0;
    rtc_direction.sio = IN;
    rtc_direction.sck = OUT;
    for(u8 i = 0; i < 8; ++i) {
        rtc_data.sck = LOW;
        rtc_wait_cycles(100);
        rtc_data.sck = HIGH;
        val |= (rtc_data.sio << i);
        rtc_wait_cycles(100);
    }
    return val;
}

//this is a blocking wait, because fk IRQ
void rtc_wait_cycles(volatile u16 cycles)
{
    while(cycles > 0)
    {
        cycles--;
    }
}