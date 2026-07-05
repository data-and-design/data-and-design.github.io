---
layout: post
title: "Announcing Umwelt: An Editor for Accessible Multimodal Data"
author: jzong
---

Most data on the web is communicated through visualization, and visualizations are frequently inaccessible to blind and low-vision people. Many tools for creating accessible alternatives require users to first create a visualization before converting it into something non-visual. [Umwelt](https://umwelt-data.github.io/umwelt/) is an accessible editor that takes a different approach. A user can edit a single shared data model to produce three coordinated views of the same dataset—a **visualization**, a **sonification**, and a keyboard-navigable **textual structure**.

Umwelt began as a [research project](https://data-and-design.org/projects/umwelt/) developed through participatory co-design with blind and low-vision collaborators. While a prototype has existed for a few years, we're now releasing it as an open-source tool (with documentation) that anyone can use. There are also several capabilities we added that were not present in the research paper's prototype: a dedicated editor tab for the textual structure, shareable links and spec export, an embeddable viewer you can drop into your own site, and support for layered sonification.

<link rel="stylesheet" href="https://unpkg.com/umwelt-js@0.1.1/dist/index.css">
<style>
.umwelt-embed {
  margin: 1.5rem 0;
  padding: 1rem 1.25rem;
  border: 2px solid #1C269E;
  overflow-x: auto;
}
.table-container { overflow-x: auto; max-width: 100%; }
</style>

_Try it: the example below is a live Umwelt viewer of stock prices for five tech companies. Focus the **Description** and use the **arrow keys** to explore the data as text, or press **Play** (or `p`) to hear each company's prices as pitch. If you're using a screen reader, see the [setup notes](https://umwelt-data.github.io/umwelt/using/#screen-reader-notes) so single-key shortcuts reach the tree._

<div class="umwelt-embed" id="umwelt-intro"></div>
<script type="module">
import { createViewer } from 'https://esm.sh/umwelt-js@0.1.1?bundle';

const spec = {
  data: { name: 'stocks.csv', url: 'https://raw.githubusercontent.com/vega/vega-datasets/master/data/stocks.csv' },
  fields: [
    { name: 'symbol', type: 'nominal' },
    { name: 'date', type: 'temporal' },
    { name: 'price', type: 'quantitative' },
  ],
  key: ['symbol', 'date'],
  visual: {
    units: [{
      name: 'vis_unit_0',
      mark: 'line',
      encoding: { x: { field: 'date' }, y: { field: 'price' }, color: { field: 'symbol' } },
    }],
  },
  audio: {
    units: [{
      name: 'audio_unit_0',
      encoding: { pitch: { field: 'price' } },
      traversal: [{ field: 'symbol' }, { field: 'date' }],
    }],
  },
};

createViewer(spec, document.getElementById('umwelt-intro'));
</script>

## One data model, three coordinated views

Working in Umwelt starts with data, not a chart. You load a dataset and tell Umwelt about its fields—which are categories, which are quantities, which are dates—and which fields form the *key* that identifies each row. You then build up three views of that data, each by assigning fields to the channels of that modality:

- a **visualization**, where fields map to visual channels like x, y, and color, compiled to a [Vega-Lite](https://vega.github.io/vega-lite/) chart;
- a **sonification**, where fields map to properties of sound—pitch, duration, loudness—together with a traversal order that plays the data over time (in the example above, price as rising and falling pitch);
- a **textual structure**, where fields become the groupings of an [Olli](https://umwelt-data.github.io/olli/) tree you explore with the arrow keys and a screen reader, from a summary down to individual values.

Umwelt proposes a sensible default representation to begin from, so you're not staring at a blank editor, but each modality is yours to shape.

Because all three come from the same model, they stay coordinated. Brushing a region of the chart filters the description to match; move through the description and the corresponding points highlight in the chart. The goal is for it to feel easy to move between three options for engaging with the same underlying data.

The consequence that matters most for accessibility is that no view is privileged as the "real" one. Crucially, you don't have to make a visualization first before you're allowed to edit a sonification or textual description independently. Treating all three modalities equally, instead of privileging the visual specification, is the core idea behind Umwelt.

Everything runs in your browser, and your data never leaves your machine. Open the [editor](https://umwelt-data.github.io/umwelt/editor/) and it loads an example so you can start immediately; from the [Data tab](https://umwelt-data.github.io/umwelt/using/data) you can upload a CSV or JSON file, load from a URL, or pick another built-in dataset. The [getting started guide](https://umwelt-data.github.io/umwelt/using/) walks through the whole flow.

## Author the textual structure

In the original prototype, the textual structure was generated automatically and fixed. The editor now has a dedicated **[Text tab](https://umwelt-data.github.io/umwelt/using/text)** for editing the structure. Umwelt still infers a structure to start from, built from two kinds of node you can rearrange and extend:

- **Group** — split the data by a field (or several crossed fields), one branch per value or bucket. "Group by `symbol`" gives one branch per company; nest "Group by `date`" under it to get each company's dates.
- **Highlight** — a named, hand-defined subset. You give it a name and a set of conditions (a query predicate), and it becomes a branch representing the matching rows.

## Share, export, and embed

Though the main goal of Umwelt is to provide an accessible structured editor, it's now possible to export a compact JSON **spec** for portability. From the **[Export tab](https://umwelt-data.github.io/umwelt/using/sharing)** you can:

- **Copy a shareable editor URL** that reopens the editor with your spec loaded. It rides in the URL's hash fragment, so it's never sent to a server—the same mechanism behind the gallery's "Open in editor" links.
- **Grab the raw JSON**, to keep in version control or generate programmatically.

The same viewer you see above is also published as a standalone npm package, [`umwelt-js`](https://umwelt-data.github.io/umwelt/docs/quickstart), so you can render a spec into any page. It's framework-agnostic—SolidJS internally, but you just hand it a spec object and a container:

```js
import { createViewer } from 'umwelt-js';
import 'umwelt-js/style.css';

const spec = {
  data: { name: 'stocks.csv', url: 'https://raw.githubusercontent.com/vega/vega-datasets/master/data/stocks.csv' },
  fields: [
    { name: 'symbol', type: 'nominal' },
    { name: 'date', type: 'temporal' },
    { name: 'price', type: 'quantitative' },
  ],
  key: ['symbol', 'date'],
  visual: {
    units: [{
      name: 'vis_unit_0',
      mark: 'line',
      encoding: { x: { field: 'date' }, y: { field: 'price' }, color: { field: 'symbol' } },
    }],
  },
  audio: {
    units: [{
      name: 'audio_unit_0',
      encoding: { pitch: { field: 'price' } },
      traversal: [{ field: 'symbol' }, { field: 'date' }],
    }],
  },
};

createViewer(spec, document.getElementById('umwelt-viewer'));
```

`createViewer` resolves the data, compiles the visual units to [Vega-Lite](https://vega.github.io/vega-lite/), builds the Olli navigation tree, and starts the audio engine, returning a handle with `updateSpec`, `getSpec`, and `destroy`. You don't have to write specs by hand—author one in the editor and copy the JSON from the Export tab. The [quickstart](https://umwelt-data.github.io/umwelt/docs/quickstart) is a complete, copy-pasteable page. The spec is documented in the [spec reference](https://umwelt-data.github.io/umwelt/docs/spec).

## Layered sonification

Umwelt's spec lets a sonification have more than one audio unit. When it does, a `composition` setting says how they relate: the default, `concat`, plays them as separate tracks, one at a time. The natural counterpart is to play them *at the same time*, and the editor now supports that too, via a `layer` composition—multiple units under one shared traversal and a single set of controls, each voice on its own timbre so you can (in principle) tell them apart. We defined `concat` and `layer` by analogy to visual view composition, where these operators also combine multiple visual views either sequentially or simultaneously.

We built this mostly because it was implicit in our grammar design, and it's also already supported by sonification grammars such as [Erie](https://see-mike-out.github.io/erie-documentation/docs/compose/overlay.html). However, we aren't claiming to have necessarily figured out how to make this a good listening experience. While we've seen [really good examples](https://accessibleoceans.whoi.edu/auditory-display-daily-vertical-migration-gets-eclipsed/) of bespoke layered audio displays created by others, we feel that their success tends to be dataset- and domain-specific. Simultaneous streams can be hard to disentangle by ear, and how many layers a listener can follow—and how best to make them distinguishable—is the kind of thing we'd want to do more research on (if you know about relevant research on sonification design, send it our way). So `layer` for sonification is best thought of mostly as something to experiment with. If you try it and have reactions, we'd like to hear them. The [Designing Sonifications](https://umwelt-data.github.io/umwelt/using/audio#multiple-units-and-composition) guide covers how it behaves.

## Docs and a gallery

Alongside the editor, there's a [documentation site](https://umwelt-data.github.io/umwelt/): a [user guide](https://umwelt-data.github.io/umwelt/using/) for authoring in the editor, [developer docs](https://umwelt-data.github.io/umwelt/docs/) covering the viewer API and the full spec format, and a [gallery](https://umwelt-data.github.io/umwelt/gallery/) of live examples.

## Get started

- **Open the [editor](https://umwelt-data.github.io/umwelt/editor/)** and start with the example dataset, or load your own.
- **Read the [getting started guide](https://umwelt-data.github.io/umwelt/using/)** to learn the editor and how to navigate the description with a screen reader.
- **Browse the [gallery](https://umwelt-data.github.io/umwelt/gallery/)** to hear and remix examples.
- **Embed a viewer**: `npm install umwelt-js` and follow the [quickstart](https://umwelt-data.github.io/umwelt/docs/quickstart).

We'd love your feedback. [Open an issue](https://github.com/umwelt-data/umwelt/issues/new?labels=user%20feedback) or try Umwelt with your own data and tell us how it goes.
