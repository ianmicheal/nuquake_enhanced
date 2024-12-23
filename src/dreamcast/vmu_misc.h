#ifndef VMU_MISC_H
#define VMU_MISC_H

#ifndef __KOS_H
#include <kos.h>
#endif

extern uint8 icon_palette[32];
extern uint8 icon_bitmap[512];

extern int vmu_freeblocks;
extern int vmu_totalblocks;
extern maple_device_t *vm_dev;

#define APP_NAME "nuQuake         "  // 16 characters
#define VMU_NAME "NUQUAKE_"          // 8 characters

void VMU_init();
int VMU_GetFreeblocks();
// Fixed signature to match how it's actually used
uint16 VMU_calcCRC(const uint8_t *file_buf, int data_len);
void VMU_initLCDicons();
void VMU_loadLCDicon(uint8 *src_icon, uint8 *dst_icon);
void VMU_displayLCDicon(uint8 *lcd_icon);
void VMU_saveExtraIcon();
void VMU_saveExtraBg();

#endif /* VMU_MISC_H */
