#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "esort.h"

typedef ESort::Walker	ESort_Walker;
typedef ESort::Writer	ESort_Writer;
typedef ESort::Reader	ESort_Reader;
typedef ESort::Direction ESort_Direction;
typedef ESort::string	ESort_String;
typedef int		error_int;


MODULE = ESort	PACKAGE = ESort

ESort_Writer*
Writer(ESort_String db, int synced=1, int unique=1, unsigned long blockSize=8192, unsigned long keySize=255, int mode=0666)
	CODE:
		RETVAL = ESort_Writer::opendb(db, ESort::Parameters(synced, unique, blockSize, keySize), mode).release();
	OUTPUT:
		RETVAL


ESort_Reader*
Reader(ESort_String db, int synced=1, int unique=1, unsigned long blockSize=8192, unsigned long keySize=255)
	CODE:
		RETVAL = ESort_Reader::opendb(db, ESort::Parameters(synced, unique, blockSize, keySize)).release();
	OUTPUT:
		RETVAL


MODULE = ESort	PACKAGE = ESort::WriterPtr

error_int
ESort_Writer::rollback()

error_int
ESort_Writer::commit()

error_int
ESort_Writer::insert(ESort_String key)

ESort_Walker*
ESort_Writer::seek(ESort_String key, ESort_Direction dir)
	CODE:
		RETVAL = THIS->seek(key, dir).release();
	OUTPUT:
		RETVAL

ESort_Walker*
ESort_Writer::seekp(ESort_String prefix, ESort_String key, ESort_Direction dir)
	CODE:
		RETVAL = THIS->seekp(prefix, key, dir).release();
	OUTPUT:
		RETVAL

void
ESort_Writer::DESTROY()


MODULE = ESort	PACKAGE = ESort::ReaderPtr

ESort_Walker*
ESort_Reader::seek(ESort_String key, ESort_Direction dir)
	CODE:
		RETVAL = THIS->seek(key, dir).release();
	OUTPUT:
		RETVAL

ESort_Walker*
ESort_Reader::seekp(ESort_String prefix, ESort_String key, ESort_Direction dir)
	CODE:
		RETVAL = THIS->seekp(prefix, key, dir).release();
	OUTPUT:
		RETVAL

void
ESort_Reader::DESTROY()


MODULE = ESort	PACKAGE = ESort::WalkerPtr

ESort_String
ESort_Walker::key()
	CODE:
		RETVAL = THIS->key;
	OUTPUT:
		RETVAL

error_int
ESort_Walker::advance()

void
ESort_Walker::DESTROY()
