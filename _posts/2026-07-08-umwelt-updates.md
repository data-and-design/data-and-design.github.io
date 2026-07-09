---
layout: post
title: "Umwelt Updates: Example Gallery, Sonification Improvements, Editable Text Structures"
author: jzong
---

[Umwelt](https://github.com/umwelt-data/umwelt) is an open-source editor for creating accessible, multimodal data representations. From a single specification, Umwelt produces three coordinated views of a dataset: a visualization, a sonification, and a keyboard-navigable textual structure. Rather than derive non-visual representations from a visual specification, Umwelt treats all modalities as equal outputs — blind and sighted users can author a representation starting from any modality. Umwelt is based on [research](https://vis.csail.mit.edu/pubs/umwelt/) involving participatory design with blind and low-vision collaborators, and its textual structure is powered by [Olli](https://umwelt-data.github.io/olli/).

Today we're announcing a set of updates to Umwelt: sonification improvements, a new Text tab for shaping the description structure, a new documentation site with an example gallery, and `umwelt-js`, an npm package for embedding Umwelt viewers in your own site.

<link rel="stylesheet" href="https://unpkg.com/umwelt-js@0.2.2/dist/index.css">
<style>
.umwelt-embed {
  border: 2px solid #1C269E;
  padding: 0.75rem;
  margin: 1.5rem 0;
  overflow: auto;
}
</style>

_Try it: this scatterplot plots miles per gallon against horsepower for cars, colored by origin. Press **Play** (or the `p` key) below to hear two sonifications sweep the plot along each axis — first binned horsepower playing the mean miles per gallon, then binned miles per gallon playing the mean horsepower. Then focus the description tree and use the **arrow keys** to explore the points grouped by origin as navigable text. If keypresses aren't reaching the tree, see the [screen reader setup notes](https://umwelt-data.github.io/umwelt/using/#screen-reader-notes)._

<div class="umwelt-embed" id="umwelt-intro"></div>
<script type="module">
import { createViewer } from 'https://esm.sh/umwelt-js@0.2.2?bundle';

const spec = {
  "data": {
    "name": "cars.json",
    "url": "https://raw.githubusercontent.com/vega/vega-datasets/master/data/cars.json"
  },
  "fields": [
    {
      "name": "Miles_per_Gallon",
      "type": "quantitative"
    },
    {
      "name": "Horsepower",
      "type": "quantitative"
    },
    {
      "name": "Origin",
      "type": "nominal"
    }
  ],
  "key": [],
  "visual": {
    "mark": "point",
    "encoding": {
      "x": {
        "field": "Miles_per_Gallon"
      },
      "y": {
        "field": "Horsepower"
      },
      "color": {
        "field": "Origin"
      }
    }
  },
  "audio": {
    "units": [
      {
        "encoding": {
          "pitch": {
            "field": "Miles_per_Gallon",
            "aggregate": "mean"
          }
        },
        "traversal": [
          {
            "field": "Horsepower",
            "bin": true
          }
        ]
      },
      {
        "encoding": {
          "pitch": {
            "field": "Horsepower",
            "aggregate": "mean"
          }
        },
        "traversal": [
          {
            "field": "Miles_per_Gallon",
            "bin": true
          }
        ]
      }
    ],
    "composition": "concat"
  }
};

createViewer(spec, document.getElementById('umwelt-intro'));
</script>

## More expressible sonifications

Umwelt's sonifications map fields to properties of a tone — pitch, duration, volume — and play the data over time following a *traversal*, an ordered list of fields that works like nested loops. This release expands what sonification are possible to author.

### Instruments

Each audio unit now has an **instrument** — its timbre, chosen from a set of presets (`pure`, `bright`, `hollow`, `bell`, `reed`, `strings`). Think of it like a visual unit's mark: it's the voice the whole unit speaks in, not something that varies per data point. `pure` is the clean default and the easiest for judging pitch precisely; the other presets matter most when units play together (more on that below). The editor's Audio tab includes a preview button for each instrument so you can audition timbres while you design.

### Stereo pan

A new `pan` encoding channel places tones in the stereo field: higher values play further right. Pan works best as reinforcement rather than a channel on its own — pan the same field you traverse, and the sound sweeps left-to-right in step with playback, placing each value in space as well as pitch. The gallery's [stereo panning example](https://umwelt-data.github.io/umwelt/gallery/stereo-pan) sonifies U.S. population by age group this way: pitch carries the population count while pan follows the age axis. (Since stereo position is lost on mono speakers and for listeners with hearing loss in one ear, we recommend never making `pan` the only place a field is encoded.)

### Layered units

Sonifications with multiple audio units can now be composed by **layering**, not just concatenation. Where `concat` plays units one at a time as separate sequences, `layer` plays them simultaneously under one shared traversal — like overlaying series on a shared axis. Layered units are scheduled on a shared time grid so they stay locked to the same cursor. And each layer automatically takes a distinct instrument so you can tell the voices apart.

The [overlaid voices example](https://umwelt-data.github.io/umwelt/gallery/overlaid-voices) plays Seattle's daily high and low temperatures at the same time on two timbres, which means the spread you hear between the two voices communicates the daily temperature range.

_Try it: press **Play** to hear the high temperatures on a reed voice and the lows on a bell, month by month. Or [open this example in the editor](https://umwelt-data.github.io/umwelt/editor/#spec=N4IgJghgLhIFygHYQLYFN4gM5ulANmgLQDuuUAFmgE4B0AxlgG4gA0IArtfphVFAAcscAPQjqEErQDmAS0ocARhxzV6Ae0RQ0WhupQimaaREPGIRSDBxQsIlBCzbqIq6Zx5CpclTqMWAL7sAGayaPhgWPAA2kioGHDg0BjsUACeAgkg2igC6hI8qbLoAKqI8pgompQgQXHomDkCAPoOAB5s2RlZAI4cEFry0LJGtaz1WU2tsoid6ZmYfQNQQyujAQC67ADWaGkxSdogWyBMslj9PAic5bYxE5hnWM0ct80ADJ0O1NuY+DMpEA6DRgGbSeCgDrXULhMCYKyAlalW6VaoUMYgfbQsIRRpoXKtCAddgQaTSajmI6JdADWoBOogZANRJPF5vACMXwgPz+AM6wPUoMQ4OuUNAMNxiQRc2KaDKFWpaIxWPFOLhiSmKBmnVJ5MpWRps3pm3YGly6iw8lkmj+EDSNAxEA4oPUEJu8iicFijPimCdLrZ8g+nRmTmoHHQWkwFLQcPYAqFItAAnk9HR2NheIJ7R1ZIpJipIENdNSEiM1CwECu3ol6sOiNl8qgqK06M2DKZWX91sDUGanPYoag4cjzcSinChSBiBBYLdKagabdtazLS1sxJef1lVwRqC2TLNEr1dVmalyRlyIVRaV7ZOZrylpWNsS+DtDvpQA) to change the instruments or flip the composition to `concat`._

<div class="umwelt-embed" id="umwelt-overlaid"></div>
<script type="module">
import { createViewer } from 'https://esm.sh/umwelt-js@0.2.2?bundle';

const spec = {
  data: {
    name: 'seattle-weather.csv',
    url: 'https://raw.githubusercontent.com/vega/vega-datasets/master/data/seattle-weather.csv',
  },
  fields: [
    { name: 'date', type: 'temporal', timeUnit: 'month' },
    { name: 'temp_max', type: 'quantitative' },
    { name: 'temp_min', type: 'quantitative' },
  ],
  key: ['date'],
  visual: {
    units: [
      {
        name: 'vis_unit_0',
        mark: 'line',
        encoding: {
          x: { field: 'date', timeUnit: 'month' },
          y: { field: 'temp_max', aggregate: 'mean' },
        },
      },
      {
        name: 'vis_unit_1',
        mark: 'line',
        encoding: {
          x: { field: 'date', timeUnit: 'month' },
          y: { field: 'temp_min', aggregate: 'mean' },
        },
      },
    ],
    composition: 'layer',
  },
  audio: {
    units: [
      {
        name: 'audio_unit_0',
        instrument: 'reed',
        encoding: { pitch: { field: 'temp_max', aggregate: 'mean' } },
        traversal: [{ field: 'date', timeUnit: 'month' }],
      },
      {
        name: 'audio_unit_1',
        instrument: 'bell',
        encoding: { pitch: { field: 'temp_min', aggregate: 'mean' } },
        traversal: [{ field: 'date', timeUnit: 'month' }],
      },
    ],
    composition: 'layer',
  },
};

createViewer(spec, document.getElementById('umwelt-overlaid'));
</script>

Behind the scenes, we also made the sonification more consistent with the other modalities: playback steps, bins, and aggregates are now computed from the same compiled data as the chart and the Olli tree, so when you scrub the sonification, select a region on the chart, or navigate the description, all three views are talking about exactly the same groups of data points.

## A new Text tab for shaping descriptions

The editor previously had tabs for designing the visual and audio modalities; the textual structure was always inferred automatically. A new **Text** tab makes the third modality authorable too (leveraging [recent improvements in Olli's spec design](https://data-and-design.org/blog/2026/05/27/announcing-olli-v3/)).

By default you don't have to touch it: Umwelt infers a description tree from your chart (or, with no chart, from the fields). The Text tab shows that inferred structure as an editable starting point. From there you can:

- **Add and reorder groups** — split the data by a field (or several crossed fields), and nest groups to build hierarchy, with per-grouping control over binning and time units
- **Add highlights** — named, hand-defined subsets that no field grouping expresses, like *After 1975*, defined by composable conditions with type-appropriate operators
- **Reset to auto-generated** whenever you want to return to Umwelt's inferred structure

This matters because the description tree provides primary access to the chart for screen reader users, and can carry its own modality-specific information. A highlight, for example, lets an author call out an editorially meaningful slice of the data — the kind of thing a visual annotation would do — and make it a first-class, navigable branch of the structure. The [text guide](https://umwelt-data.github.io/umwelt/using/text) covers the details.

## A new documentation site and example gallery

Umwelt now has a proper home on the web: [umwelt-data.github.io/umwelt](https://umwelt-data.github.io/umwelt/). The site includes:

- **A [user guide](https://umwelt-data.github.io/umwelt/using/)** that walks through the whole editor — loading data, configuring fields, and designing the visual, audio, and text modalities — with dedicated pages on [sonification design](https://umwelt-data.github.io/umwelt/using/audio) and [screen reader setup](https://umwelt-data.github.io/umwelt/using/#screen-reader-notes).
- **[Developer docs](https://umwelt-data.github.io/umwelt/docs/)** covering the full [specification format](https://umwelt-data.github.io/umwelt/docs/spec), the [viewer API](https://umwelt-data.github.io/umwelt/docs/viewer-api), and [editor share URLs](https://umwelt-data.github.io/umwelt/docs/editor-urls).
- **An [example gallery](https://umwelt-data.github.io/umwelt/gallery/)** with live, playable examples.

The gallery is organized by the *structure of the data* rather than by visual chart type. That framing is modality-neutral: a data shape determines the space of encodings across the visualization, the sonification, and the text structure. Each example describes what its sonification sounds like and what its text structure reads like, not just what the chart looks like.

Every gallery example has an **Open in editor** link, and the editor's Export tab produces the same kind of shareable link for your own work: the spec is compressed into the URL's hash fragment, so it's never sent to a server, and anyone who opens the link gets your exact representation loaded and ready to remix.

## Embed Umwelt anywhere with umwelt-js

The viewer that powers the editor and the gallery — visualization, description tree, and sonification, coordinated — is now published on npm as [`umwelt-js`](https://www.npmjs.com/package/umwelt-js). The live examples in this post are rendered with it. Give it a spec and a container, and you get the full multimodal viewer in your own page:

```ts
import { createViewer } from 'umwelt-js';
import 'umwelt-js/style.css';

const viewer = createViewer(spec, document.getElementById('container'));
```

You don't have to write specs by hand: author one in the editor and copy the JSON from the Export tab, or start from a gallery example. The [quickstart](https://umwelt-data.github.io/umwelt/docs/quickstart) has a complete one-file example.

## Get started

- **Open the [editor](https://umwelt-data.github.io/umwelt/editor/)** — it runs entirely in your browser, and your data never leaves your machine.
- **Browse the [gallery](https://umwelt-data.github.io/umwelt/gallery/)** and remix an example in the editor.
- **Read the [user guide](https://umwelt-data.github.io/umwelt/using/)** to learn the editor end to end.
- **Install it**: `npm install umwelt-js` and follow the [quickstart](https://umwelt-data.github.io/umwelt/docs/quickstart).

We'd love your feedback! [Open an issue](https://github.com/umwelt-data/umwelt/issues/new?labels=user%20feedback) or try Umwelt with your own data and let us know how it goes.
