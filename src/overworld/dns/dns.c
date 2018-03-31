#include <pokeagb/pokeagb.h>
#include <agb_debug.h>
#include <dns.h>
#include <rtc.h>

#define DNS_BUF_SIZE 256
#define DNS_SEC_PAL_START 224
#define DNS_SEC_PAL_START_C (DNS_SEC_PAL_START / 2)

#define crgb5(r,g,b) (union Color)(((u16)(((b) << 10) | ((g)<<5) | ((r)))))
#define rgb82rgb5(r,g,b) (crgb5(r/8, g/8, b/8))

const union Color dns_color_times[5] = {
    rgb82rgb5(70, 70, 196),
    rgb82rgb5(70, 70, 196),
    rgb82rgb5(70, 70, 196),
    rgb82rgb5(70, 70, 196),
    rgb82rgb5(70, 70, 196)
};

union Color dns_color_multiply(union Color a, union Color b);


void dns_blockset_load_palette(struct MapBlockset* blockset, u16 offset, u16 size){
    struct RtcTimestamp stamp;
    rtc_get_time(&stamp);
    dprintf("rtc data was read: %x.%x.%x\n", stamp.day, stamp.month, stamp.year);
    if(blockset != NULL){
        union Color *dns_buffer = malloc(DNS_BUF_SIZE*2);
        if(blockset->secondary > 0)
        {
            if(blockset->secondary == 1)
            {
                //load secondary palette uncompressed
                memcpy(dns_buffer, blockset->palettes+DNS_SEC_PAL_START, size);
                dns_modify_palette(dns_buffer, size/2);
                gpu_pal_apply(dns_buffer, offset,size);
                load_palette3(offset, size/2);
            }
            else
            {
                //load secondary palette compressed 
                LZ77UnCompWram(blockset->palettes, dns_buffer);

                dns_modify_palette(&dns_buffer[DNS_SEC_PAL_START_C], size/2);

                gpu_pal_apply(&dns_buffer[DNS_SEC_PAL_START_C], offset, size);
                load_palette3(offset,size/2);
                
            }
        }
        else
        {
            union Color black;
            black.packed = 0x0000;
            gpu_pal_apply(&black, 0, 2);
            memcpy(dns_buffer, blockset->palettes, size);
            dns_modify_palette(dns_buffer, size/2);
            gpu_pal_apply(&dns_buffer[1], offset+1, size-2);
            load_palette3(offset+1, (size-2)/2);
            //load primary palette
            
        }
        free(dns_buffer);
    }
}

void dns_oec01_load_pal_impl(u32 *oe_script) {
    struct SpritePalette *pal = (struct SpritePalette *)oe_read_word(oe_script);
    struct SpritePalette palToApply = {
        .data = NULL,
        .tag = pal->tag
    };
    u8 idx = gpu_pal_tags_index_of(palToApply.tag);

    union Color *buffer = malloc(32);
    memcpy(buffer, pal->data, 32);
    dns_modify_palette(buffer, 16);
    palToApply.data = buffer;

    gpu_pal_obj_alloc_tag_and_apply(&palToApply);
    if(idx == 0xFF) {
        u8 idx = gpu_pal_tags_index_of(palToApply.tag);
        tint_palette_switch(idx);
    }
    idx = gpu_pal_tags_index_of(palToApply.tag);
    free(buffer);
    palette_obj_807AA8C(idx);
    *oe_script += 4;
}

void dns_oec02_load_pal_impl(u32 *oe_script) {
    struct SpritePalette *pal = (struct SpritePalette *)oe_read_word(oe_script);
    struct SpritePalette palToApply = {
        .data = NULL,
        .tag = pal->tag
    };
    u8 idx = gpu_pal_tags_index_of(palToApply.tag);

    union Color *buffer = malloc(32);
    memcpy(buffer, pal->data, 32);
    dns_modify_palette(buffer, 16);
    palToApply.data = buffer;
    
    gpu_pal_obj_alloc_tag_and_apply(&palToApply);
    if(idx == 0xFF) {
        u8 idx = gpu_pal_tags_index_of(palToApply.tag);
        tint_palette_switch(idx);
    }
    free(buffer);
    *oe_script += 4;
}

void dns_pal_patch_for_npc(u16 tag, u8 idx)
{
    extern struct SpritePalette ow_pal_table[1100];
    u16 npcPalIdx = hacked_npc_pal_idx_for_given_tag(tag);
    union Color *buffer = malloc(32);
    memcpy(buffer, ow_pal_table[npcPalIdx].data,32);
    dns_modify_palette(buffer,16);
    gpu_pal_apply(buffer, 256 + 16*idx, 32);
    free(buffer);
    tint_palette_switch(idx);
}

void dns_modify_palette(union Color* buffer, u16 size){
    if(current_map_header.light == 8)
        return;
    for(u16 i = 0; i < size; ++i) {
        buffer[i] = dns_color_multiply(dns_color_times[0], buffer[i]);
    }
}

union Color dns_color_multiply(union Color a, union Color b) {
    u32 red = (a.components.r * b.components.r) / 31;
    u32 green = (a.components.g * b.components.g) / 31;
    u32 blue = (a.components.b * b.components.b) / 31;
    return crgb5(red,green,blue);
}