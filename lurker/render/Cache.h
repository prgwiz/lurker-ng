/*  $Id: Cache.h,v 1.2 2003-04-21 18:26:18 terpstra Exp $
 *  
 *  Cache.h - Helper which transforms xml -> html and caches files
 *  
 *  Copyright (C) 2002 - Wesley W. Terpstra
 *  
 *  License: GPL
 *  
 *  Authors: 'Wesley W. Terpstra' <wesley@terpstra.ca>
 *  
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; version 2.1.
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

#ifndef CACHE_H 
#define CACHE_H

#include <Config.h>

#include <iostream>
#include <cstdio>
#include <string>

using std::ostream;
using std::string;
using std::cout;

class streambug;

class Cache
{
 protected:
 	streambug*	bug;
 	
 public:
 	Cache(const Config& cfg, const string& command, const string& parameter);
 	~Cache();
 	
 	ostream o;
 	
 protected:
 	FILE*		output;
 	FILE*		cache;
};

#endif
