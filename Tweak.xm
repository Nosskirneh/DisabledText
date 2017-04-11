#define prefPath [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"se.nosskirneh.disabledtext.plist"]

static BOOL titleEnabled;
static NSString *titleText;
static BOOL subtitleEnabled;
static NSString *subtitleText;
static BOOL emergencyEnabled;
static NSString *emergencyText;

%hook SBDashBoardModalView

- (void)setTitleText:(NSString *)text {
    if (text) {
        NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
        [defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:prefPath]];
        titleEnabled = [[defaults objectForKey:@"titleEnabled"] boolValue];
        titleText = [defaults objectForKey:@"titleText"];
        subtitleEnabled = [[defaults objectForKey:@"subtitleEnabled"] boolValue];
        subtitleText = [defaults objectForKey:@"subtitleText"];
        emergencyEnabled = [[defaults objectForKey:@"emergencyEnabled"] boolValue];
        emergencyText = [defaults objectForKey:@"emergencyText"];
        return titleEnabled ? %orig(titleText) : %orig;
    }
    %orig;
}

// When restoring back state, these methods are called with parameter nil
- (void)setSubtitleText:(NSString *)text {
    text && subtitleEnabled ? %orig(subtitleText) : %orig;
}

- (void)setSecondaryActionButtonText:(NSString *)text {
    text && emergencyEnabled ? %orig(emergencyText) : %orig;
}

%end
