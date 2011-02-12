module NavigationHelpers
  module Refinery
    module Eventos
      def path_to(page_name)
        case page_name
        when /the list of eventos/
          admin_eventos_path

         when /the new evento form/
          new_admin_evento_path
        else
          nil
        end
      end
    end
  end
end
