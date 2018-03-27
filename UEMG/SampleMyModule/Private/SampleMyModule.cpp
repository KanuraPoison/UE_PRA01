// Copyright 1998-2017 Epic Games, Inc. All Rights Reserved. 
#include "SampleMyModule/Public/SampleMyModule.h" 
class FSampleMyModule : public ISampleMyModule 
{ 
	/** IModuleInterface implementation */ 
	virtual void StartupModule() override; 
	virtual void ShutdownModule() override; 
}; 
IMPLEMENT_MODULE( FSampleMyModule, SampleMyModule ) 
void FSampleMyModule::StartupModule() 
{ 
	// This code will execute after your module is loaded into memory (but after global variables are initialized, of course.) 
} 
void FSampleMyModule::ShutdownModule() 
{ 
	// This function may be called during shutdown to clean up your module.  For modules that support dynamic reloading, 
	// we call this function before unloading the module. 
} 
