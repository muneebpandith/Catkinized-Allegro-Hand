/*****************************************************************************
 * Copyright (C) 2001-2007  PEAK System-Technik GmbH
 *
 * linux@peak-system.com
 * www.peak-system.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * Maintainer(s): Klaus Hitschler (klaus.hitschler@gmx.de)
 *
 * Major contributions by:
 *                Edouard Tisserant (edouard.tisserant@lolitech.fr) XENOMAI
 *                Laurent Bessard   (laurent.bessard@lolitech.fr)   XENOMAI
 *                Oliver Hartkopp   (oliver.hartkopp@volkswagen.de) socketCAN
 *                     
 *****************************************************************************/

/*****************************************************************************
 *
 * sja1000.h - prototypes for sja1000 access functions
 *
 * $Id: pcan_sja1000.h 1345 2016-10-18 14:38:20Z stephane $
 *
 *****************************************************************************/

#ifndef __SJA1000_H__
#define __SJA1000_H__

#include "src/pcan_common.h"

#include <linux/types.h>
#include <linux/interrupt.h>	/* 2.6. special */

#include "src/pcan_main.h"

//#define PCAN_SJA1000_LOCK_ENTIRE_ISR

int  sja1000_open(struct pcandev *dev, u16 btr0btr1, u8 bExtended,
							u8 bListenOnly);
void sja1000_release(struct pcandev *dev);
int sja1000_write(struct pcandev *dev, struct pcan_udata *ctx);

irqreturn_t __pcan_sja1000_irqhandler(struct pcandev *dev);
irqreturn_t pcan_sja1000_irqhandler(struct pcandev *dev);

int sja1000_write_frame(struct pcandev *dev, struct can_frame *cf);

#ifndef NO_RT
int sja1000_irqhandler(rtdm_irq_t *irq_context);

#elif LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 19)
irqreturn_t sja1000_irqhandler(int irq, void *arg, struct pt_regs *pt);
#else
irqreturn_t sja1000_irqhandler(int irq, void *arg);
#endif

int sja1000_probe(struct pcandev *dev);

#endif
