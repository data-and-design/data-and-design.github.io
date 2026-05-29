---
layout: post
title: "Announcing Olli v3: Diagrams, Choropleths, and Customizable Descriptions"
author: jzong
---

Data visualizations are one of the most common ways information is communicated on the web, and they are frequently inaccessible to blind or low-vision screen reader users. [Olli](https://github.com/umwelt-data/olli) is an open-source JavaScript library that converts visualizations into keyboard-navigable tree structures, where each level of the tree describes a different level of detail about the chart. Navigate to the root and hear a chart summary; press the down arrow to enter the x-axis and hear each category; go deeper to reach individual data points.

Today we're releasing Olli v3, a ground-up rewrite that significantly expands what Olli can describe and how users interact with it.

<link rel="stylesheet" href="https://unpkg.com/olli@3.0.3/dist/styles.css">
<style>
.olli-embed {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
  align-items: start;
  margin: 1.5rem 0;
  border: 2px solid #1C269E;
}
.olli-embed > div {
  padding: 0.75rem;
  overflow: auto;
  min-height: 12rem;
}
@media (max-width: 768px) {
  .olli-embed { grid-template-columns: 1fr; }
}
.table-container {
  overflow-x: auto;
  max-width: 100%;
}
</style>

_Try it: focus on the example below, then use the **arrow keys** to navigate. Press **Down** to drill into axes and categories, **Left/Right** to step across siblings, **Up** to go back. Press **?** for a full list of keyboard shortcuts.  If you're having trouble, see the [setup guide](https://umwelt-data.github.io/olli/using/) to make sure your screen reader is configured so keypresses reach Olli._

<div class="olli-embed">
  <div role="img" aria-label="Multi-series line chart"><div aria-hidden="true" id="vega-intro"></div></div>
  <div id="tree-intro"></div>
</div>
<script type="module">
import { olliVis } from 'https://esm.sh/olli@3.0.3';
import { VegaLiteAdapter } from 'https://esm.sh/olli@3.0.3/adapters';
import { parse, View } from 'https://esm.sh/vega@5';
import { compile } from 'https://esm.sh/vega-lite@5';
import { withExternalStateParam, connectOlliToVegaLite } from 'https://esm.sh/@umwelt-data/umwelt-utils@0.1.3/vl-bridge';

const spec = {
  $schema: 'https://vega.github.io/schema/vega-lite/v5.json',
  description: 'Stock prices of 5 tech companies over time.',
  data: { url: 'https://raw.githubusercontent.com/vega/vega-datasets/next/data/stocks.csv' },
  mark: 'line',
  config: { legend: { disable: true } },
  encoding: {
    x: { field: 'date', type: 'temporal' },
    y: { field: 'price', type: 'quantitative' },
    color: { field: 'symbol', type: 'nominal' },
  },
};

const injected = withExternalStateParam(spec);
const compiled = compile(injected).spec;
const view = await new View(parse(compiled), { renderer: 'canvas' })
  .initialize(document.getElementById('vega-intro'))
  .runAsync();

const olliSpec = await VegaLiteAdapter(spec);
const handle = olliVis(olliSpec, document.getElementById('tree-intro'), { initialPreset: 'standard' });
connectOlliToVegaLite(handle, view);
</script>

## A more diverse example gallery

Olli originally shipped with examples primarily covering bar charts, scatterplots, and line charts. In v3, the [gallery](https://umwelt-data.github.io/olli/gallery/) has grown to cover a much wider range of charts:

- **[Pie](https://umwelt-data.github.io/olli/gallery/pie-chart) and [donut](https://umwelt-data.github.io/olli/gallery/donut-chart) charts** — arc-based charts that are common in dashboards and reports
- **[Heatmaps](https://umwelt-data.github.io/olli/gallery/heatmap) and [table-based plots](https://umwelt-data.github.io/olli/gallery/lasagna-plot)** — including lasagna plots for temporal pattern visualization
- **[Streamgraphs](https://umwelt-data.github.io/olli/gallery/streamgraph) and [area charts](https://umwelt-data.github.io/olli/gallery/area-chart)** — stacked area visualizations common in time-series data
- **[Bubble plots](https://umwelt-data.github.io/olli/gallery/bubble-plot)** — scatterplots with a size dimension
- **[Population pyramids](https://umwelt-data.github.io/olli/gallery/population-pyramid)** — back-to-back bar charts used in demographic analysis
- **Multi-view displays** — [faceted](https://umwelt-data.github.io/olli/gallery/faceted-chart), [layered](https://umwelt-data.github.io/olli/gallery/layered-chart), and [concatenated](https://umwelt-data.github.io/olli/gallery/concat-chart) chart compositions

### Choropleth maps

The most exciting new example type is geographic. Olli v3 can now describe [choropleth maps](https://umwelt-data.github.io/olli/gallery/choropleth-map)—the kind of shaded geographic maps you see in election results, public health dashboards, and census data reporting. Geographic data often comes in formats like TopoJSON with numeric FIPS codes instead of readable place names. When you navigate a tree and hear "county 06037", that's not useful. So Olli's adapter layer automatically detects FIPS codes in the data, looks them up, and enriches each data point with the corresponding county name, state name, and US census region. Navigate the choropleth example and you'll hear "Los Angeles County, California" instead of a five-digit code.

This locale-aware data enrichment is currently built for the US (county and state FIPS codes), but the approach is designed to be extensible to other regions and geographic coding systems in the future.

<div class="olli-embed">
  <div role="img" aria-label="Choropleth map"><div aria-hidden="true" id="vega-choropleth"></div></div>
  <div id="tree-choropleth"></div>
</div>
<script type="module">
import { olliVis } from 'https://esm.sh/olli@3.0.3';
import { VegaLiteAdapter } from 'https://esm.sh/olli@3.0.3/adapters';
import { parse, View } from 'https://esm.sh/vega@5';
import { compile } from 'https://esm.sh/vega-lite@5';
import { withExternalStateParam, connectOlliToVegaLite, postprocessViewData } from 'https://esm.sh/@umwelt-data/umwelt-utils@0.1.3/vl-bridge';

const spec = {
  $schema: 'https://vega.github.io/schema/vega-lite/v6.json',
  description: 'US county-level unemployment rates',
  width: 500,
  height: 300,
  data: {
    url: 'https://raw.githubusercontent.com/vega/vega-datasets/next/data/us-10m.json',
    format: { type: 'topojson', feature: 'counties' },
  },
  transform: [{
    lookup: 'id',
    from: {
      data: { url: 'https://raw.githubusercontent.com/vega/vega-datasets/next/data/unemployment.tsv' },
      key: 'id',
      fields: ['rate'],
    },
  }],
  projection: { type: 'albersUsa' },
  mark: 'geoshape',
  encoding: {
    color: { field: 'rate', type: 'quantitative' },
  },
};

const injected = withExternalStateParam(spec);
const compiled = compile(injected).spec;
const view = await new View(parse(compiled), { renderer: 'canvas' })
  .initialize(document.getElementById('vega-choropleth'))
  .runAsync();

// Enrich geoshape data with readable place names from FIPS codes
await postprocessViewData(view);

const olliSpec = await VegaLiteAdapter(spec);
const handle = olliVis(olliSpec, document.getElementById('tree-choropleth'), { initialPreset: 'standard' });
connectOlliToVegaLite(handle, view);
</script>

## Beyond charts: diagram accessibility

Olli v3 isn't just about charts anymore. Under the hood, the data model was generalized from a chart-specific representation to a domain-agnostic [hypergraph](https://umwelt-data.github.io/olli/docs/hypergraph). This means Olli can now describe structured information that isn't necessarily tree-shaped—things like mechanical diagrams, system architectures, or any set of elements with relationships between them. This work is grounded in our research on accessible descriptions of relational diagrams, published as [Benthic](https://data-and-design.org/publications/benthic/).

Why a hypergraph rather than a tree? In many diagrams, an element belongs to more than one grouping at the same time. For example, a rope passes through two different pulley systems, or a component sits inside one subsystem while also being connected to another. A tree forces each element into a single parent, but a hypergraph lets the same element appear in multiple parent contexts. In the Benthic paper we called this *parent context switching*: the ability to navigate an element from any of the groups it belongs to. This is what makes the resulting accessible structure *perceptually congruent*—its organization mirrors the visual groupings a sighted reader perceives.

The new [`olliDiagram`](https://umwelt-data.github.io/olli/docs/entry-points) entry point accepts a `DiagramSpec` describing elements and their relationships: containment, grouping, connections, alignment, and distribution. A [Bluefish adapter](https://umwelt-data.github.io/olli/docs/adapters) converts Bluefish layout specifications into diagram specs automatically.

The gallery includes a [pulley diagram](https://umwelt-data.github.io/olli/gallery/pulley) example drawn from our Benthic user studies. It represents a mechanical system of pulleys, ropes, and weights. Navigate the structure to understand which components are connected, which systems they belong to, and how the elements are spatially organized.

<div class="olli-embed">
  <div role="img" aria-label="Pulley diagram"><div aria-hidden="true" id="bluefish-pulley"></div></div>
  <div id="tree-pulley"></div>
</div>
<script type="module">
import * as bf from 'https://esm.sh/bluefish-js@0.0.39';
import { olliDiagram } from 'https://esm.sh/olli@3.0.3';
import { BluefishAdapter } from 'https://esm.sh/olli@3.0.3/adapters';
import { createBluefishBridge } from 'https://esm.sh/@umwelt-data/umwelt-utils@0.1.3/bluefish-bridge';

const { render } = bf;

const pulleySpec = ({ Align, Circle, Distribute, Group, Line, Rect, Ref, Text }) => {
  const r = 25;

  function pulleyCircle(name, label) {
    return Align({ name, alignment: 'center', zOrder: 1, customData: { olli: { kind: 'pulley', label } } }, [
      Circle({ r, stroke: '#828282', 'stroke-width': 3, fill: '#C1C1C1' }),
      Circle({ r: 5, fill: '#555555', customData: { olli: { skip: true } } }),
    ]);
  }

  function pulleyDot(name) {
    return Circle({ name, r: 5, fill: '#555555', zOrder: 3, customData: { olli: { skip: true } } });
  }

  function weightBox(name, olliLabel, wlabel) {
    return Align({ name, alignment: 'center', customData: { olli: { kind: 'box', label: olliLabel } } }, [
      Rect({ width: 40, height: 40, fill: '#545454', stroke: '#545454' }),
      Text({ 'font-size': '10', fill: 'white', customData: { olli: { skip: true } } }, wlabel),
    ]);
  }

  return [
  Rect({ name: 'ceiling', height: 20, width: 14 * r, fill: '#C9C9C9', 'stroke-width': 2, customData: { olli: { label: 'Ceiling' } } }),
  Rect({ name: 'floor', height: 20, width: 14 * r, fill: '#C9C9C9', 'stroke-width': 2, customData: { olli: { label: 'Floor' } } }),
  pulleyCircle('A', 'Pulley A'),
  pulleyCircle('B', 'Pulley B'),
  pulleyCircle('C', 'Pulley C'),
  weightBox('b1', 'Box B1', 'B1'),
  weightBox('b2', 'Box B2', 'B2'),
  Distribute({ direction: 'horizontal', spacing: 0 }, [Ref({ select: 'A' }), Ref({ select: 'B' })]),
  Distribute({ direction: 'horizontal', spacing: 0 }, [Ref({ select: 'B' }), Ref({ select: 'C' })]),
  Distribute({ direction: 'vertical', spacing: 60 }, [Ref({ select: 'ceiling' }), Ref({ select: 'A' })]),
  Distribute({ direction: 'vertical', spacing: 60 }, [Ref({ select: 'ceiling' }), Ref({ select: 'C' })]),
  Distribute({ direction: 'vertical', spacing: 50 }, [Ref({ select: 'A' }), Ref({ select: 'B' })]),
  Align({ alignment: 'top' }, [Ref({ select: 'B' }), Ref({ select: 'b1' }), Ref({ select: 'b2' })]),
  Distribute({ direction: 'vertical', spacing: 60 }, [Ref({ select: 'B' }), Ref({ select: 'floor' })]),
  Align({ alignment: 'centerX' }, [Ref({ select: 'ceiling' }), Ref({ select: 'B' })]),
  Distribute({ direction: 'horizontal', spacing: -20 }, [Ref({ select: 'b1' }), Ref({ select: 'A' })]),
  Distribute({ direction: 'horizontal', spacing: -20 }, [Ref({ select: 'C' }), Ref({ select: 'b2' })]),
  Align({ alignment: 'centerX' }, [Ref({ select: 'B' }), Ref({ select: 'floor' })]),
  Align({ alignment: 'center' }, [Ref({ select: 'A' }), Text({ name: 'A-label', x: -r, y: -r, customData: { olli: { skip: true } } }, 'A')]),
  Align({ alignment: 'center' }, [Ref({ select: 'B' }), Text({ name: 'B-label', x: r, y: r, customData: { olli: { skip: true } } }, 'B')]),
  Align({ alignment: 'center' }, [Ref({ select: 'C' }), Text({ name: 'C-label', x: r, y: -r, customData: { olli: { skip: true } } }, 'C')]),
  Line({ name: 'p', source: [0.5, 0], target: [0, 0.5], stroke: '#774e32', zOrder: -1, customData: { olli: { kind: 'rope', label: 'Rope p', semantic: 'hangs-from', directed: true } } }, [Ref({ select: 'b1' }), Ref({ select: 'A' })]),
  Line({ name: 'r', source: [1, 0.5], target: [0, 0.5], stroke: '#774e32', zOrder: -1, customData: { olli: { kind: 'rope', label: 'Rope r' } } }, [Ref({ select: 'A' }), Ref({ select: 'B' })]),
  Line({ name: 's', source: [1, 0.5], target: [0, 0.5], stroke: '#774e32', zOrder: -1, customData: { olli: { kind: 'rope', label: 'Rope s' } } }, [Ref({ select: 'B' }), Ref({ select: 'C' })]),
  Line({ name: 'u', source: [0.5, 0], target: [1, 0.5], stroke: '#774e32', zOrder: -1, customData: { olli: { kind: 'rope', label: 'Rope u', semantic: 'hangs-from', directed: true } } }, [Ref({ select: 'b2' }), Ref({ select: 'C' })]),
  Line({ name: 'q', source: [0.5, 0.5], stroke: '#774e32', zOrder: 2, customData: { olli: { kind: 'rope', label: 'Rope q', semantic: 'hangs-from', directed: true } } }, [Ref({ select: 'A' }), Ref({ select: 'ceiling' })]),
  Line({ name: 't', source: [0.5, 0.5], stroke: '#774e32', zOrder: 2, customData: { olli: { kind: 'rope', label: 'Rope t', semantic: 'hangs-from', directed: true } } }, [Ref({ select: 'C' }), Ref({ select: 'ceiling' })]),
  Line({ name: 'v', source: [0.5, 0.5], stroke: '#774e32', zOrder: 2, customData: { olli: { kind: 'rope', label: 'Rope v', semantic: 'anchored-to', directed: true } } }, [Ref({ select: 'B' }), Ref({ select: 'floor' })]),
  Text({ name: 'p-label', customData: { olli: { skip: true } } }, 'p'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 'p-label' }), Ref({ select: 'p' })]),
  Text({ name: 'r-label', customData: { olli: { skip: true } } }, 'r'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 'r' }), Ref({ select: 'r-label' })]),
  Text({ name: 's-label', customData: { olli: { skip: true } } }, 's'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 's-label' }), Ref({ select: 's' })]),
  Text({ name: 'u-label', customData: { olli: { skip: true } } }, 'u'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 'u' }), Ref({ select: 'u-label' })]),
  Align({ alignment: 'centerY' }, [Ref({ select: 'r' }), Ref({ select: 'p-label' }), Ref({ select: 'r-label' }), Ref({ select: 's-label' }), Ref({ select: 'u-label' })]),
  Text({ name: 'q-label', customData: { olli: { skip: true } } }, 'q'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 'q' }), Ref({ select: 'q-label' })]),
  Distribute({ direction: 'vertical', spacing: 20 }, [Ref({ select: 'ceiling' }), Ref({ select: 'q-label' })]),
  Text({ name: 't-label', customData: { olli: { skip: true } } }, 't'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 't-label' }), Ref({ select: 't' })]),
  Align({ alignment: 'centerY' }, [Ref({ select: 'q-label' }), Ref({ select: 't-label' })]),
  Text({ name: 'v-label', customData: { olli: { skip: true } } }, 'v'),
  Distribute({ direction: 'horizontal', spacing: 3 }, [Ref({ select: 'v-label' }), Ref({ select: 'v' })]),
  Distribute({ direction: 'vertical', spacing: 20 }, [Ref({ select: 'B' }), Ref({ select: 'v-label' })]),
  pulleyDot('A-dot'),
  Align({ alignment: 'center' }, [Ref({ select: 'A' }), Ref({ select: 'A-dot' })]),
  pulleyDot('B-dot'),
  Align({ alignment: 'center' }, [Ref({ select: 'B' }), Ref({ select: 'B-dot' })]),
  pulleyDot('C-dot'),
  Align({ alignment: 'center' }, [Ref({ select: 'C' }), Ref({ select: 'C-dot' })]),
  Group({ name: 'sysA', customData: { olli: { label: 'Pulley System A' } } }, [Ref({ select: 'A' }), Ref({ select: 'p' }), Ref({ select: 'r' })]),
  Group({ name: 'sysB', customData: { olli: { label: 'Pulley System B' } } }, [Ref({ select: 'r' }), Ref({ select: 'B' }), Ref({ select: 's' })]),
  Group({ name: 'sysC', customData: { olli: { label: 'Pulley System C' } } }, [Ref({ select: 's' }), Ref({ select: 'C' }), Ref({ select: 'u' })]),
  ];
};

const chartContainer = document.getElementById('bluefish-pulley');
render(() => pulleySpec(bf), chartContainer);
const svgElement = chartContainer.querySelector('svg');

const spec = BluefishAdapter(pulleySpec);
const handle = olliDiagram(spec, document.getElementById('tree-pulley'));
createBluefishBridge({ handle, svgElement });
</script>

This architecture also opens the door for third-party domain plugins. If you have a domain with structured relationships that should be navigable as a hypergraph, you can build a domain plugin that provides its own description tokens, keyboard shortcuts, and dialogs. You can also [directly author a hypergraph](https://umwelt-data.github.io/olli/docs/hypergraph) and render it with olli's [domain-agnostic base entrypoint](https://umwelt-data.github.io/olli/docs/entry-points).

## Better descriptions

In v2, Olli's descriptions were generated from a fixed template. Our research paper [Customization is Key](https://data-and-design.org/publications/customization/) found that screen reader users have diverse and sometimes conflicting preferences for how chart descriptions should be structured—what information to include, how verbose to be, and in what order. v3 puts this finding into practice with a [token-based description system](https://umwelt-data.github.io/olli/using/descriptions). Each piece of information in a description is a separate token—e.g., the item's name, its position among siblings, its depth level, the number of children, aggregate statistics. Tokens are composed into recipes that you can customize:

- **Presets**: switch between Detailed, Standard, and Minimal verbosity in one step
- **Per-token control**: turn individual tokens on or off, choose between concise and full versions
- **Token reordering**: put the information you care about most at the beginning of the description
- **Live preview**: see how your changes affect the description before committing

Press `d` on any tree to open the description settings dialog and try it. Your customizations persist in your browser across sessions.

## Improved new user experience

Olli relies on keyboard interaction, which means screen reader users need to be in the right mode for keypresses to reach Olli rather than being intercepted by the screen reader itself. This is a common stumbling block.

v3 adds a built-in [help dialog](https://umwelt-data.github.io/olli/using/) (press `?` from any tree) that detects your operating system and shows setup instructions for your screen reader, with explicit support for VoiceOver, NVDA, and JAWS. The help dialog also lists all available keyboard shortcuts for the current tree, so you don't need to memorize anything up front. Different trees may have different shortcuts available depending on their domain (charts vs. diagrams), and the help dialog always reflects what's available in the current graph.

## Chart highlighting

When you navigate an Olli tree that's paired with a rendered chart, v3 now provides utilities to highlight the corresponding data on the visualization. Move focus to "Origin equals USA" in the tree, and only the USA data points stay fully visible on the chart while everything else dims. This creates a bidirectional link between the accessible tree and the visual representation. This is useful for sighted collaborators following along, for presentations, or for users with low vision who benefit from both the tree and the visual.

This works through a bridge library ([`@umwelt-data/umwelt-utils`](https://github.com/umwelt-data/umwelt-utils)) that syncs Olli's focus state with Vega-Lite's selection store. The same pattern works for Bluefish diagrams: navigate the tree and the corresponding SVG elements highlight in the diagram. The [quickstart guide](https://umwelt-data.github.io/olli/docs/quickstart#two-way-highlighting) shows how to set this up in your own project.

<div class="olli-embed">
  <div role="img" aria-label="Scatterplot"><div aria-hidden="true" id="vega-highlight"></div></div>
  <div id="tree-highlight"></div>
</div>
<script type="module">
import { olliVis } from 'https://esm.sh/olli@3.0.3';
import { VegaLiteAdapter } from 'https://esm.sh/olli@3.0.3/adapters';
import { parse, View } from 'https://esm.sh/vega@5';
import { compile } from 'https://esm.sh/vega-lite@5';
import { withExternalStateParam, connectOlliToVegaLite } from 'https://esm.sh/@umwelt-data/umwelt-utils@0.1.3/vl-bridge';

const spec = {
  $schema: 'https://vega.github.io/schema/vega-lite/v5.json',
  data: { url: 'https://raw.githubusercontent.com/vega/vega-datasets/next/data/penguins.json' },
  mark: 'point',
  encoding: {
    x: { field: 'Flipper Length (mm)', type: 'quantitative', scale: { zero: false } },
    y: { field: 'Body Mass (g)', type: 'quantitative', scale: { zero: false } },
    color: { field: 'Species', type: 'nominal' },
    shape: { field: 'Species', type: 'nominal' },
  },
};

const injected = withExternalStateParam(spec);
const compiled = compile(injected).spec;
const view = await new View(parse(compiled), { renderer: 'canvas' })
  .initialize(document.getElementById('vega-highlight'))
  .runAsync();

const olliSpec = await VegaLiteAdapter(spec);
const handle = olliVis(olliSpec, document.getElementById('tree-highlight'), { initialPreset: 'standard' });
connectOlliToVegaLite(handle, view);
</script>

## Simpler API for developers

v2 had two npm packages: `olli` and `olli-adapters`. v3 consolidates everything into a single `olli` package with [subpath exports](https://umwelt-data.github.io/olli/docs/installation):

```ts
// v2
import { olli } from 'olli';
import { VegaLiteAdapter } from 'olli-adapters';
const spec = VegaLiteAdapter(vlSpec);
const el = olli(spec);
container.appendChild(el);

// v3
import { olliVis } from 'olli';
import { VegaLiteAdapter } from 'olli/adapters';
const spec = await VegaLiteAdapter(vlSpec);
const handle = olliVis(spec, container);
```

The adapters subpath is lazy-loaded, which means importing `olli` doesn't pull in vega-lite or other adapter dependencies. This keeps bundle size small for applications that only use one adapter.

v3 has three entry points depending on your data:

<div class="table-container" markdown="1">

| Entry point | Input | Use when |
|---|---|---|
| `olliVis` | Chart spec | Tabular data with axes, legends, marks |
| `olliDiagram` | Diagram spec | Relational data with containment, connections |
| `olli` | Raw hypergraph | Custom domain or pre-built graph |

</div>

All three return an [`OlliHandle`](https://umwelt-data.github.io/olli/docs/handle) for programmatic control:

```ts
const handle = olliVis(spec, container);

handle.onFocusChange((navId) => { /* ... */ });
handle.onSelectionChange((selection) => { /* ... */ });
handle.setSelection(myPredicate);
handle.focus(someNavId);
handle.destroy();
```

## Under the hood

v3 is a ground-up rewrite organized as a layered architecture. At the bottom, `olli-core` provides a domain-agnostic hypergraph data model, predicate-based selection, and a reactive navigation runtime built on Solid.js signals. Above that, `olli-render-solid` implements the accessible tree view as declarative Solid.js components. Domain-specific logic lives in separate layers: `olli-vis` for charts, `olli-diagram` for diagrams. Each registers their own description tokens, keyboard shortcuts, dialogs, and predicate providers through an extensible registry pattern. Adapters for Vega-Lite and Bluefish sit at the top, converting external specs into Olli's internal representation. The public `olli` package wraps everything with a vanilla JS API.

This layered design means adding a new domain (like we did with diagrams) doesn't require touching core navigation or rendering code. The [developer docs](https://umwelt-data.github.io/olli/docs/) cover the architecture in detail, including a guide for [creating custom domains](https://umwelt-data.github.io/olli/docs/creating-domain).

## Get started

- **Try the [gallery](https://umwelt-data.github.io/olli/gallery/)** to see Olli v3 in action across chart types and diagrams.
- **Read the [getting started guide](https://umwelt-data.github.io/olli/using/)** to learn keyboard navigation with a screen reader.
- **Follow the [developer quickstart](https://umwelt-data.github.io/olli/docs/quickstart)** to add Olli to your own site.
- **Install it**: `npm install olli`

If you're migrating from v2, the main changes are: adapters are now at `olli/adapters` instead of `olli-adapters`, adapter calls are async, and the entry point mounts into a container and returns an `OlliHandle` instead of returning a raw DOM element.

We'd love your feedback! [Open an issue](https://github.com/umwelt-data/olli/issues) or try Olli with your own visualizations and let us know how it goes.
