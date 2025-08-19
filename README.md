# data-and-design.org

## How to dev dnd website

- Install Jekyll ([instructions](https://jekyllrb.com/docs/installation/macos/))
- Install bundler

```
gem install jekyll bundler
```

- Install dependencies

```
bundle install
```

- Serve your content

```
bundle exec jekyll serve --livereload
```

- Check localhost:4000 for your content

## How to add a person

- Add person record to `_data/authors.yml`

Required fields:

```
  name: string
  url: string
  title: string
```

Optional fields:

```
  affiliation: string # if not CU Boulder
  external: boolean # flags as external (not listed under team)
  collaborator: boolean # flags as research collaborator (listed under collaborators)
  imgAlt: string # custom alt text for a person's photo
```

- Add a photo to `/imgs/people/[key].jpg`

  - Square headshot photo
  - Extension must be .jpg
  - Ideally compress to under 1mb
  - Filename must match the key of the person record in `authors.yml`

## How to add a publication

- Create publication markdown page in `/_pubs`

  - The filename will be the url slug, i.e. `https://data-and-design.org/publications/[filename]`
  - The publication record is defined at the top of the md page, in the front matter

    Required fields:

    ```
    title: string
    authors: array of author objects
    venue: string (venue key)
    year: number
    ```

    Optional fields:

    ```
    date: YYYY-MM-DD # publication date
    doi: string # DOI identifier
    pdf_url: string # path to PDF file
    html_url: string # external HTML URL
    themes: array of strings # research themes
    projects: array of strings # associated project keys
    materials: array of objects # supplementary materials
      - name: string # material name
        url: string # material URL
    ```

    Author object fields:

    ```
    key: string # author key (references _data/authors.yml)
    name: string # full name (for external authors without key)
    affiliation: string # institutional affiliation (overrides default)
    equal: boolean # denotes equal contribution
    ```

- Add the pdf to `/publications`
  - The pdf filename should match the page filename
