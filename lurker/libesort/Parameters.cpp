/*  $Id: Parameters.cpp,v 1.10 2006-02-19 01:17:22 terpstra Exp $
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

#define _FILE_OFFSET_BITS 64

#include "esort.h"

#include <cmath>
#include <cassert>

namespace ESort
{

Parameters::Parameters(
	bool          synced,
	bool          unique,
	unsigned int  version, 
	unsigned long blockSize, 
	unsigned long keySize)
 : version_(version), blockSize_(blockSize), keySize_(keySize), unique_(unique), synced_(synced)
{
	assert (keySize_ > 0);
	assert (keySize_ * 8 <= blockSize_);
	
	keyWidth_ = static_cast<int>(
		ceil(
			log(static_cast<double>(keySize_)) /
			log(256)
		));
}

bool Parameters::isWider(const Parameters& p)
{
	return version_   > p.version_   ||
	       blockSize_ > p.blockSize_ ||
	       keySize_   > p.keySize_;
}

}
