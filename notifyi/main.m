#import <Foundation/Foundation.h>

#import "AppDelegate.h"

AppDelegate *app = nil;

void SignalHandler(int sig) {
	fprintf(stderr, "Stopping...\n");
	[app stop];
	exit(EXIT_SUCCESS);	
}

int main(int argc, const char *argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	app = [[AppDelegate alloc] init];
	
	signal(SIGINT, SignalHandler);
	signal(SIGTERM, SignalHandler);
	
	[app start];
	
	[[NSRunLoop currentRunLoop] run];

	[pool release];
	
	return EXIT_SUCCESS;
}
