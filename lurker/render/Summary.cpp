/*  $Id: Summary.cpp,v 1.2 2003-04-21 18:26:19 terpstra Exp $
 *  
 *  Summary.cpp - Helper which can load a message given MessageId
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

#include <mimelib/message.h>

#include <Keys.h> 
#include <XmlEscape.h>

#include <memory>
#include <cerrno>
#include <cstring>
#include <fstream>

#include "Summary.h"

using namespace std;

string Summary::load(ESort::Reader* r)
{
	string prefix = LU_SUMMARY + id_.serialize_forward();
	
	auto_ptr<ESort::Walker> w(r->seek(prefix));
	if (!w.get())
	{
		if (errno == 0) return "does not exist? end of database";
		return string("Reader::seek:") + strerror(errno);
	}
	
	// Does it not exist?
	if (w->key.substr(0, prefix.length()) != prefix)
		return "does not exist";
	
	int l = prefix.length();
	int j;
	for (j = l; j >= l; j = w->advance())
	{
		// We use this for getting an unsigned value below.
		const unsigned char* k = (const unsigned char*)w->key.c_str() + l;
		
		// read all the values
		switch (*k)
		{
		case LU_MESSAGE_AUTHOR_EMAIL:
			author_email_ = w->key.substr(l+1, string::npos);
			break;
			
		case LU_MESSAGE_AUTHOR_NAME:
			author_name_ = w->key.substr(l+1, string::npos);
			break;
			
		case LU_MESSAGE_SUBJECT:
			subject_ = w->key.substr(l+1, string::npos);
			break;
			
		case LU_MESSAGE_MBOX:
			if ((int)w->key.length() < l + 12+1+1)
				return "invalid mbox entry -- too short";
			
			int i;
			offset_ = 0;
			
			for (i = 0; i < 8; ++i)
			{
				offset_ <<= 8;
				offset_ |= *++k;
			}
			length_ = 0;
			for (i = 8; i < 12; ++i)
			{
				length_ <<= 8;
				length_ |= *++k;
			}
			
			mbox_ = w->key.substr(l+1+12, string::npos);
			mboxs_.insert(mbox_);
			break;
		
		default:
			return "unknown mbox summary control code";
		}
	}
	
	if (j == -1 && errno != 0)
		return string("Walker::advance:") + strerror(errno);
	
	return "";
}

string Summary::message(const string& dbdir, DwMessage& message) const
{
	string name = dbdir + "/" + mbox_;
	ifstream f(name.c_str());
	if (!f.is_open())
		return name + ":ifstream::is_open:" + strerror(errno);
	
	f.seekg(offset_);
	if (!f.good())
		return name + ":seekg:" + strerror(errno);
	
	DwString str;
	char buf[8192];
	unsigned long want = length_;
	
	while (want)
	{
		long get;
		if (want < sizeof(buf))
			get = want;
		else	get = sizeof(buf);
		
		f.read(buf, get);
		
		if (!f.good())
			return name + ":read:" + strerror(errno);
		
		str.append(buf, get);
		want -= get;
	}
	
	message.FromString(str);
	message.Parse();
	
	return "";
}

ostream& operator << (ostream& o, const Summary& s)
{
	o << "<summary>"
	  << "<id>" << s.id().serialize() << "</id>"
	  << "<timestamp>" << s.id().timestamp() << "</timestamp>";
	
	if (s.subject().length() > 0)
		o << "<subject>" << xmlEscape << s.subject() << "</subject>";
	
	o  << "<email";
	if (s.author_email().length() > 0)
		o << " address=\"" << xmlEscape << s.author_email() << "\"";
	if (s.author_name().length() > 0)
		o << " name=\"" << xmlEscape << s.author_name() << "\"";
	o << "/></summary>";
	
	return o;
}