/****************************************************************************
 * Copyright (C) 2015-2016 by the SotS Team                                 *
 *                                                                          *
 * This file is part of Sovereign of the Skies.                             *
 *                                                                          *
 *   Sovereign of the Skies is free software: you can redistribute it       *
 *   and/or modify it                                                       *
 *   under the terms of the GNU Lesser General Public License as published  *
 *   by the Free Software Foundation, either version 3 of the License, or   *
 *   (at your option) any later version provided you include a copy of the  *
 *   licence and this header.                                               *
 *                                                                          *
 *   Sovereign of the Skies is distributed in the hope that it will be      *
 *   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 *                                                                          *
 *   You should have received a copy of the GNU Lesser General Public       *
 *   License along with Sovereign of the Skies.                             *
 *   If not, see <http://www.gnu.org/licenses/>.                            *
 ****************************************************************************/

/**
 * @file memory.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Manage memory
 * 
 * This header file provides methods to allocate and free memory areas.
 * It also provides basic memory copy/set methods.
 */

#ifndef MEMORY_H
#define MEMORY_H

/* === INCLUDE === */

#include <types.h>

/* === EXTERN METHODS === */

/**
 * @brief allocates memory
 * @param size amount of bytes to allocate
 * @return address to allocated memory area
 */
extern void* malloc(size_t size);

/**
 * @brief frees previously allocated memory
 * @param address address to free
 */
extern void free(void* address);

/**
 * @brief copy bytes in memory
 * @param destination address to copy to
 * @param source address to copy from
 * @param num amount of bytes to copy
 * @return destination pointer
 */
extern void* memcpy(void * destination, const void* source, size_t num);

/**
 * @brief set bytes in memory
 * @param dst destination to set words
 * @param value to be set
 * @param size number of bytes to set
 * @return 
 */
extern void* memset(void* dst, int value, size_t size);

/**
 * @brief decompress data into wram using interrupt
 * @param src data source
 * @param dst data destination (must be in wram)
 */
extern void wram_decompress(void* src, void* dst);

/**
 * @brief decompress data into vram using interrupt
 * @param src data source
 * @param dst data destination (must be in vram)
 */
extern void vram_decompress(void* src, void* dst);

#endif /* MEMORY_H */

