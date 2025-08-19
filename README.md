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
bundle exec jekyll serve
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
