#ifndef RTC_H_
#define RTC_H_

#include <pokeagb/pokeagb.h>

struct RtcTimestamp {
    u8 year;
    u8 month;
    u8 day;
    u8 day_of_week;
    u8 hour;
    u8 minute;
    u8 second;
};

void rtc_get_time(struct RtcTimestamp* out);

#endif