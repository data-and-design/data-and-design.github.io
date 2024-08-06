module Jekyll
  class BibTexTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    # Lookup allows access to the page/post variables through the tag context
    def lookup(context, name)
      lookup = context
      name.split(".").each { |value| lookup = lookup[value] }
      lookup
    end

    def bibtex_escape(str)
      str.gsub('&', '\\\\&')
        .sub('%', '\\\\%')
        .sub("é", "\\\\'{e}")
        .sub("Ç", "\\\\c{C}")
        .sub("ğ", "\\\\u{g}")
    end

    def render(context)
      # Site
      venues = lookup(context, 'site.data.venues')
      people = lookup(context, 'site.data.authors')

      # Page
      authors = lookup(context, 'page.authors')
      venue = lookup(context, 'page.venue')
      year = lookup(context, 'page.year')
      slug = lookup(context, 'page.slug')
      title = lookup(context, 'page.title')
      doi = lookup(context, 'page.doi')

      bibtex = venues.dig(venue, 'bibtex')

      author_str = authors.map{|a| a['name'] || people.dig(a['key'], 'name')}.join(' AND ')
      author_str = 'hi'
      doi_str = "\n  doi = {#{doi}},"

#       "@#{bibtex['type']}{#{year}-#{slug},
#   title = {{#{title}}},
#   author = {#{author_str}},
#   #{bibtex['venue']} = {#{bibtex_escape(venues[venue]['full'])}},
#   year = {#{year}},#{!doi.nil? ? doi_str : ''}
#   url = {http://vis.csail.mit.edu/pubs/#{slug}}
# }"
    "hi"
    end
  end
end

Liquid::Template.register_tag('bibtex', Jekyll::BibTexTag)
