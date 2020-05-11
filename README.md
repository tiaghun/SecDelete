# SecDelete
An application bundle to replace the defunct Securely Empty Trash function on macOS (10.11+)

  SecDelete, A.K.A. "Securely Empty Trash.app" is a simple, self contained application bundle written in Applescript-ObjC
and Zsh. The goal is to effectively replace (or reintroduce) the Securely Empty Trash function that was removed from macOS as of version 10.11 (El Capitan). It functions by gathering a full directory tree of the '~/.Trash' directory, and overwritting files one by one.

  Each file undergoes three stages of overwritting. First the file is overwritten with a quantity of data equal to it's original size, pulled from '/dev/urandom'. Second, the file is zeroed out to it's original size using '/dev/zero'. Finally it is blanked with '/dev/null'. After all files in the Trash tree have been overwritten, all contents of the '~/.Trash' folder are erased via 'rm'.
  
  The GUI is written in Applescript-ObjC, however the main loop of the program is written in Shell script. 
  
  # Warning: Do not use this on any device whose user Trash is located on an SSD or other flash storage device, as it will reduce the lifespan of your drive. It is intended for users running off of HDDs only.
