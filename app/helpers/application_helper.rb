module ApplicationHelper

	# Returns the full title on a per-page basis.         # Documentation comment
    def full_title(page_title)                            # Method definition
        base_title = "Otobüs Güzergahları"                # Variable assignment
        if page_title.empty?                              # Boolean test
          base_title                                      # Implicit return
        else
          "#{base_title} | #{page_title}"                 # String interpolation
        end
    end
    
    # Get language content
    def get_language
        language = "Turkish"
        if( I18n.locale.to_s == "en" )
        	language = "English"
        end	
        language	
    end	

    

end
