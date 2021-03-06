/*  $Id: Parameters.cpp,v 1.2 2003-08-17 11:21:40 terpstra Exp $
 *  
 *  Parameters.cpp - Control how the database is stored
 *  
 *  Copyright (C) 2002 - Wesley W. Terpstra
 *  
 *  License: GPL
 *  
 *  Authors: 'Wesley W. Terpstra' <wesley@terpstra.ca>
 *  
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; version 2.
 *    
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *    
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#define _XOPEN_SOURCE 500
#define _FILE_OFFSET_BITS 64

#include "esort.h"

#include <cmath>
#include <cassert>

namespace ESort
{

Parameters::Parameters(
	bool          synced,
	bool          unique,
	unsigned long blockSize, 
	unsigned long keySize)
 : blockSize_(blockSize), keySize_(keySize), unique_(unique), synced_(synced)
{
	assert (keySize_ > 0);
	assert (keySize_ * 8 <= blockSize_);
	
	keyWidth_ = static_cast<int>(
		ceil(
			log(static_cast<double>(keySize_)) /
			log(256)
		));
}

}
