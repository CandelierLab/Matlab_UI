classdef (ConstructOnLoad) EventData < event.EventData

   properties
      shortcut
   end
   
   methods
      function this = EventData(arg)

        arguments
          arg.value = ''
        end
        
        this.value = arg.value;

      end
   end
end