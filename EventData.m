classdef (ConstructOnLoad) EventData < event.EventData

   properties
      value
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