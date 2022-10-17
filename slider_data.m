classdef (ConstructOnLoad) slider_data < event.EventData

   properties
      value
   end
   
   methods
      function this = slider_data(arg)

        arguments
          arg.value = []
        end
        
        this.value = arg.value;

      end
   end
end