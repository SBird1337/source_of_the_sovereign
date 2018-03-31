#include <pokeagb/pokeagb.h>
#include <rtc.h>

#define HIGH 1
#define LOW 0
#define IN 0
#define OUT 1

#define SCK 0
#define SIO 1
#define CS 2

struct RtcGpioDataStruct {
    u16 sck : 1;
    u16 sio : 1;
    u16 cs : 1;
    u16 unused : 1;
    u16 free : 12;
};

union RtcGpioData {
    struct RtcGpioDataStruct ports;
    u16 packed;
};

ASSERT_SIZEOF(union RtcGpioData, 2);

struct RtcGpioDirectionStruct {
    u16 sck : 1;
    u16 sio : 1;
    u16 cs : 1;
    u16 unused : 1;
    u16 free : 12;
};

union RtcGpioDirection {
    struct RtcGpioDirectionStruct ports;
    u16 packed;
};

ASSERT_SIZEOF(union RtcGpioDirection, 2);

extern union RtcGpioData rtc_data;
extern union RtcGpioDirection rtc_direction;
extern u16 rtc_control;

void rtc_wait_cycles(volatile u16 cycles);
void rtc_write(u8 b);
void rtc_block_wait(void);
void rtc_gpio_set_data(bool sck, bool sio, bool cs);

u8 rtc_read(void);

void rtc_get_time(struct RtcTimestamp* out)
{
    rtc_control = 1;

    //rtc_direction.sck = OUT;
    //rtc_direction.cs = OUT;
    rtc_direction.packed = 5;
    rtc_control = 1;
    rtc_direction.packed = 7;
    rtc_gpio_set_data(HIGH, LOW, LOW);
    //rtc_data.cs = LOW;
    //rtc_data.sck = HIGH;
    rtc_block_wait();

    rtc_gpio_set_data(HIGH,LOW,HIGH);
    rtc_block_wait();
    //rtc_direction.packed = ( (OUT << SCK) | (OUT << CS) | (OUT << SIO));
    //rtc_direction.sck = OUT;
    //rtc_direction.cs = OUT;
    rtc_write(0x65);

    out->year = rtc_read();
    out->month = rtc_read();
    out->day = rtc_read();
    out->day_of_week = rtc_read();
    out->hour = rtc_read();
    out->minute = rtc_read();
    out->second = rtc_read();

    rtc_data.packed = 0;
    //rtc_data.sck = LOW;
    //rtc_data.sio = LOW;
    //rtc_data.cs = LOW;
}

void rtc_write(u8 b){
    //all out
    rtc_direction.packed = 7;
    for(u8 i = 8; i > 0; ++i) {
        u8 bit = (u8) ((b & 0x80) >> 7);
        b <<= 1;
        rtc_gpio_set_data(LOW,bit,LOW);
        rtc_block_wait();
        rtc_gpio_set_data(HIGH,bit,LOW);
        rtc_block_wait();
    }
}

u8 rtc_read(void){
    u16 val = 0;
    rtc_direction.packed = 5;
    //rtc_direction.sio = IN;
    //rtc_direction.sck = OUT;
    for(u8 i = 0; i < 8; ++i) {
        rtc_gpio_set_data(LOW,LOW,LOW);
        //rtc_data.sck = LOW;
        rtc_block_wait();
        rtc_gpio_set_data(HIGH,LOW,LOW);
        //rtc_data.sck = HIGH;
        rtc_block_wait();
        val |= ((rtc_data.ports.sio) << i);
    }
    return (u8)(val >> 1);
}

void rtc_block_wait(void) {
    u8 i = 100;
    while (i--) {
        __asm__ __volatile__
        (
            "nop\n\r"
        );
    }
}

//this is a blocking wait, because fk IRQ
void rtc_wait_cycles(volatile u16 cycles)
{
    while(cycles > 0)
    {
        cycles--;
    }
}

void rtc_gpio_set_data(bool sck, bool sio, bool cs) {
    u16 value = (u16) (sck | (sio << 1) | (cs << 2));
    rtc_data.packed = value;
}
