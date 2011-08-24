module NavigationHelpers
  module Refinery
    module Textos
      def path_to(page_name)
        case page_name
        when /the list of textos/
          admin_textos_path

         when /the new texto form/
          new_admin_texto_path
        else
          nil
        end
      end
    end
  end
end
