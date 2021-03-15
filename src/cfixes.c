
#include <stdio.h>
#include <stdarg.h>

extern int remove(const char* path) {
	return unlink(path);
}

/*-
 * See the file LICENSE for redistribution information.
 *
 * Copyright (c) 1996,2008 Oracle.  All rights reserved.
 *
 */
/*
 * snprintf --
 *	Bounded version of sprintf.
 */

static void sprintf_overflow()
{
	/*
	 * !!!
	 * We're potentially manipulating strings handed us by the application,
	 * and on systems without a real snprintf() the sprintf() calls could
	 * have overflowed the buffer.  We can't do anything about it now, but
	 * we don't want to return control to the application, we might have
	 * overwritten the stack with a Trojan horse.  We're not trying to do
	 * anything recoverable here because systems without snprintf support
	 * are pretty rare anymore.
	 */
#define	OVERFLOW_ERROR	"internal buffer overflow, process ended\n"
#ifndef	STDERR_FILENO
#define	STDERR_FILENO	2
#endif
	(void)write(STDERR_FILENO, OVERFLOW_ERROR, sizeof(OVERFLOW_ERROR) - 1);

	exit(1);
}

static int sprintf_retcharpnt()
{
	int ret_charpnt;
	char buf[10];

	/*
	 * Some old versions of sprintf return a pointer to the first argument
	 * instead of a character count.  Assume the return value of snprintf,
	 * vsprintf, etc. will be the same as sprintf, and check the easy one.
	 *
	 * We do this test at run-time because it's not a test we can do in a
	 * cross-compilation environment.
	 */

	ret_charpnt =
	    (int)sprintf(buf, "123") != 3 ||
	    (int)sprintf(buf, "123456789") != 9 ||
	    (int)sprintf(buf, "1234") != 4;

	return (ret_charpnt);
}

int snprintf(char *str, size_t n, const char *fmt, ...)
{
	static int ret_charpnt = -1;
	va_list ap;
	size_t len;

	if (ret_charpnt == -1)
		ret_charpnt = sprintf_retcharpnt();

	va_start(ap, fmt);

	len = (size_t)vsprintf(str, fmt, ap);
	if (ret_charpnt)
		len = strlen(str);

	va_end(ap);

	if (len >= n) {
		sprintf_overflow();
		/* NOTREACHED */
	}
	return ((int)len);
}

/*
 * vsnprintf --
 *	Bounded version of vsprintf.
 */
/*int vsnprintf(char *str, size_t n, const car *fmt, va_list ap)
{
	static int ret_charpnt = -1;
	size_t len;

	if (ret_charpnt == -1)
		ret_charpnt = sprintf_retcharpnt();

	len = (size_t)vsprintf(str, fmt, ap);
	if (ret_charpnt)
		len = strlen(str);

	if (len >= n) {
		sprintf_overflow();
		// NOTREACHED
	}
	return ((int)len);
}*/

