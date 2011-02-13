module NavigationHelpers
  module Refinery
    module Noticias
      def path_to(page_name)
        case page_name
        when /the list of noticias/
          admin_noticias_path

         when /the new noticia form/
          new_admin_noticia_path
        else
          nil
        end
      end
    end
  end
end
