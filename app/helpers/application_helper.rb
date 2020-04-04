# https://www.driftingruby.com/episodes/nested-forms-from-scratch
# https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/

module ApplicationHelper
  def button_to_add_book(name, f, association, collection)
    # or f.object_reflect_on_association(association)
    new_object = f.object.send(association).klass.new
    # we create a unique id from the object_id
    id = new_object.object_id
    # we create a form for a single object 'new_object'
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "fields", f: builder, genres: collection)
    end

    button_to( name, '#', class: "add_field btn btn-primary",data: {id: id, fields: fields.gsub("\n", "")}, remote: true
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
