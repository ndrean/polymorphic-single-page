# https://www.driftingruby.com/episodes/nested-forms-from-scratch

module ApplicationHelper
  def link_to_add_book(name, f, association_books, association_genre, **args)
    # we can add ooptions in JSON form

    # f.object takes the object of the form builder
    # f.object.send(association) in console to inspect and see we want 'klass' and 'new' to build a new book
    # or f.object_reflect_on_association(association)
    new_object_b = f.object.send(association_book).klass.new
    new_object_g = f.object.send(association_genre).klass.new
    

    # we create a unique id from the object_id
    id = new_object.object_id
    
    # we create a form for a single object 'new_object'
    fields = f.simple_fields_for(association_books, association_genre, new_object_b,new_object_g, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    link_to( name, '#', class: "add_fields" + args[:class],
         data: {id: id, fields: fields.gsub("\n", "")}
    )
    # 'gsub' to escape new lines
  end
#

# def link_to_add_fields2(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
#   # If a block is provided there is no name attribute and the arguments are
#   # shifted with one position to the left. This re-assigns those values.
#   f, association, options, html_options = name, f, association, options if block_given?

#   options = {} if options.nil?
#   html_options = {} if html_options.nil?

#   if options.include? :locals
#     locals = options[:locals]
#   else
#     locals = { }
#   end

#   if options.include? :partial
#     partial = options[:partial]
#   else
#     partial = association.to_s.singularize + '_fields'
#   end

#   # Render the form fields from a file with the association name provided
#   new_object = f.object.class.reflect_on_association(association).klass.new
#   fields = f.fields_for(association, new_object, child_index: 'new_record') do |builder|
#     render(partial, locals.merge!( f: builder))
#   end

#   # The rendered fields are sent with the link within the data-form-prepend attr
#   html_options['data-form-prepend'] = raw CGI::escapeHTML( fields )
#   html_options['href'] = '#'

#   content_tag(:a, name, html_options, &block)
# end
end
