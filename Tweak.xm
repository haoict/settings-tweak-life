// Made by CardboardFace

static bool hasRan = false;

%hook UITableView
	- (void)endUpdates {
		%orig;
		
		// Only run the tweak when the app is first launched
		// This prevents crashing on pages that implement extra table views (e.g. Emergency & SOS)
		if (hasRan) return;
		hasRan = true;
		
		NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:1 inSection:6];
		[self scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
	}
%end