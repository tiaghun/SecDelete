--
--  AppDelegate.applescript
--  Securely Empty Trash
--
--  Created by Alison on 16/04/20.
--  Copyright © 2020 Alison E.E. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	-- IBActions
	
		-- Empty Trash
  		 on emptyTrash_(sender)
			set ResourcePath to current application's NSBundle's mainBundle()'s bundlePath() as text & "/Contents/Resources/"
   			do shell script quoted form of ResourcePath & ("SecDelete") with administrator privileges
      		display dialog "Trash scrambled and erased successfully" buttons {"OK"} default button {"OK"} with icon "burnt.icns"
			tell application "Securely Empty Trash"
   				quit
       		end tell
         end emptyTrash_
		-- End Empty Trash
  
		-- Show User Target Files
  		 on showUserTargetFiles_(sender)
  			set ResourcePath to current application's NSBundle's mainBundle()'s bundlePath() as text & "/Contents/Resources/"
     		do shell script quoted form of ResourcePath & ("ShowUserTargetFiles")
    		set UserTargetFiles to read ResourcePath & ("UserTargetFiles")
      		display dialog "Securely Empty Trash v2.0.3 build 13" default answer UserTargetFiles with title "Trash Can Contents" buttons {"Close"} default button {"Close"}
       	 end showUserTargetFiles_
  		-- End Show User Target Files
        
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script
