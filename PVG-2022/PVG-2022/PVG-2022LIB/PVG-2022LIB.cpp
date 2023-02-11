#include "pch.h"
#include "framework.h"
#include <iostream>
#include <ctime>
#include <math.h>
#include<string>
#include <Windows.h>
#include <time.h>

extern "C"
{
	unsigned int __stdcall ord(char ch)
	{
		return (unsigned int)ch;
	}
	unsigned char __stdcall chr(unsigned int number)
	{
		return (unsigned char)number;
	}

	unsigned int __stdcall GetMonth(unsigned int number)
	{
		if (number == 1)
		{
			time_t rawtime;
			struct tm timeinfo;
			time(&rawtime);
			localtime_s(&timeinfo, &rawtime);
			int month = timeinfo.tm_mon + 1;
			return (unsigned int)month;
		}
		else
		{
			return 1;
		}
	}

	unsigned int __stdcall GetDate(unsigned int number)
	{
		if (number == 1)
		{
			time_t rawtime;
			struct tm timeinfo;
			time(&rawtime);
			localtime_s(&timeinfo, &rawtime);
			int month = timeinfo.tm_mon + 1;
			int day = timeinfo.tm_mday;
			int year = timeinfo.tm_year + 1900;
			return (unsigned int)day * 1000000 + (unsigned int)month * 10000 + (unsigned int)year;
		}
		else
		{
			return 1;
		}
	}

	unsigned int __stdcall GetMinutes(unsigned int number)
	{
		if (number == 1)
		{
			time_t rawtime;
			struct tm timeinfo;
			time(&rawtime);
			localtime_s(&timeinfo, &rawtime);
			int minutes = timeinfo.tm_min;
			return (unsigned int)minutes;
		}
		else
		{
			return 1;
		}
	}

	unsigned int __stdcall GetHours(unsigned int number)
	{
		if (number == 1)
		{
			time_t rawtime;
			struct tm timeinfo;
			time(&rawtime);
			localtime_s(&timeinfo, &rawtime);
			int hour = timeinfo.tm_hour;
			return (unsigned int)hour;
		}
		else
		{
			return 1;
		}
	}

	void __stdcall outputuint(unsigned int a)
	{
		std::cout << a << std::endl;
	}
	void __stdcall outputchar(char a)
	{
		std::cout << a << std::endl;
	}
	void __stdcall outputstr(void* in)
	{
		char* a = (char*)in;
		setlocale(0, "");
		if (a != NULL)
			std::cout << a << std::endl;
	}

}