#pragma once

class DynamicLib
{
public:
	const char * getPlatformABI();
	DynamicLib();
	~DynamicLib();
};

