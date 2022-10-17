classdef (ConstructOnLoad) shortcut_data < event.EventData

   properties
      shortcut
   end
   
   methods
      function this = shortcut_data(arg)

        arguments
          arg.shortcut = ''
        end
        
        this.shortcut = arg.shortcut;

      end
   end
end