/*  $Id: splash.cpp,v 1.2 2003-04-21 18:26:21 terpstra Exp $
 *  
 *  splash.cpp - Handle a splash/ command
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

#define _XOPEN_SOURCE 500
#define _BSD_SOURCE
#define _ISOC99_SOURCE

#include "commands.h"
#include "Cache.h"

int handle_splash(const Config& cfg, ESort::Reader* db, const string& param)
{
	Cache cache(cfg, "splash", param);
	
	cache.o << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
		<< "<?xml-stylesheet type=\"text/xsl\" href=\"../fmt/render.xsl\"?>\n"
		<< "<splash>\n"
		<< " " << cfg << "\n";
	
	Config::Lists::const_iterator i;
	for (i = cfg.lists.begin(); i != cfg.lists.end(); ++i)
		cache.o << " " << i->second << "\n";
	
	cache.o << "</splash>\n";
	
	return 0;
}