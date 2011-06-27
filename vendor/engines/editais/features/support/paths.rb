module NavigationHelpers
  module Refinery
    module Editais
      def path_to(page_name)
        case page_name
        when /the list of editais/
          admin_editais_path

         when /the new edital form/
          new_admin_edital_path
        else
          nil
        end
      end
    end
  end
end
