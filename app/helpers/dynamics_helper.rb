module DynamicsHelper

    def add_book(name, f, association, genre)
        new_book = f.object.send(association).klass.new
        new_book.genre = genre
        id = new_book.object_id
        fields = f.simple_fields_for(association, new_book, child_index: id) do |builder|
            render(association.to_s.singularize+"fields", f: builder)
        end
        link_to('Add a book', '#', class: 'add_field badge badge-success mt-4', data: {id: id, fields: fields.gsub("\n", "")})
    end
end

#     def donothing(name, f, association, collection, child_association = nil)
#     # or f.object_reflect_on_association(association)
#     #new_object = f.object.send(association).klass.new
#     new_book = f.object.class.reflect_on_association(association).klass.new
#     binding.pry
#     if child_association
#       new_book.send(child_association).build
#     end
    
#     # we create a unique id from the object_id
#     id = new_book.object_id
#     # we create a form for a single object 'new_object'
#     fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
#       render(association.to_s.singularize + "fields", f: builder, genres: collection)
#     end
    
#     button_to( name, '#', class: "add_field btn btn-primary",data: {id: id, fields: fields.gsub("\n", "")}
#     )
#     # 'gsub' to escape new lines
#   end
# #

# # def link_to_add_fields2(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
# #   # If a block is provided there is no name attribute and the arguments are
# #   # shifted with one position to the left. This re-assigns those values.
# #   f, association, options, html_options = name, f, association, options if block_given?

# #   options = {} if options.nil?
# #   html_options = {} if html_options.nil?

# #   if options.include? :locals
# #     locals = options[:locals]
# #   else
# #     locals = { }
# #   end

# #   if options.include? :partial
# #     partial = options[:partial]
# #   else
# #     partial = association.to_s.singularize + '_fields'
# #   end

# #   # Render the form fields from a file with the association name provided
# #   new_object = f.object.class.reflect_on_association(association).klass.new
# #   fields = f.fields_for(association, new_object, child_index: 'new_record') do |builder|
# #     render(partial, locals.merge!( f: builder))
# #   end

# #   # The rendered fields are sent with the link within the data-form-prepend attr
# #   html_options['data-form-prepend'] = raw CGI::escapeHTML( fields )
# #   html_options['href'] = '#'

# #   content_tag(:a, name, html_options, &block)
# # end
# end

