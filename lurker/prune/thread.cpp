/*  $Id: thread.cpp,v 1.4 2003-05-16 16:22:17 terpstra Exp $
 *  
 *  thread.cpp - Cleanup after a thread/ command
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

#include "PTable.h"
#include <Keys.h>

#include <iostream>

using namespace std;

void PTable::calc_thread(KSI ks)
{
	/* Threads depend on thread data!
	 *
	 * ... but also include:
	 *   host info (from config file)
	 *
	 * Policy:
	 *   kill if obsolete due to above
	 *   kill if older than a fixed time
	 *   kill if no recent accesses
	 */
	
	MessageId id(ks->first.c_str() + 7);
	if (id.timestamp() == 0)
	{
		ks->second.kill = true; // shouldn't be here
		if (verbose)
			cout << ks->first << ": not a lurker file." << endl;
		return;
	}
	
	if (ks->second.mtime <= config)
	{	// die - it's older than the config file
		ks->second.kill = true;
		if (verbose)
			cout << ks->first << ": older than config file." << endl;
		return;
	}
	
	if (now - ks->second.mtime >= modifiedLimit)
	{
		ks->second.kill = true;
		if (verbose)
			cout << ks->first << ": expired due to maximum age." << endl;
		return;
	}
	
	if (now - ks->second.atime >= accessedLimit)
	{
		ks->second.kill = true;
		if (verbose)
			cout << ks->first << ": expired due to no access." << endl;
		return;
	}
	
	Summary& sum = summaries[id];
	string tid(subject_hash(sum.subject.c_str()));
	if (threads.find(tid) != threads.end())
	{	// die - the thread changed
		ks->second.kill = true;
		if (verbose)
			cout << ks->first << ": thread modified." << endl;
		return;
	}
	
	if (verbose)
		cout << ks->first << ": not expired" << endl;
}
